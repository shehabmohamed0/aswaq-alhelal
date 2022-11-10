import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

// const fcm = admin.messaging();
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript


export const isPhoneExist = functions.https.onCall(async (data, context) => {
    const phoneNumber = data.phoneNumber;
    try {
        await admin.auth().getUserByPhoneNumber(phoneNumber);
        return true;
    } catch (e) {
        return false;
    }
});

export const onNotification = functions.firestore.document('notifications/{notification}').onCreate(async (snapshot, context) => {
    functions.logger.log('notification start');
    const fcm = admin.messaging();
    const docData = snapshot.data();
    const userId = docData.userId;
    const title = docData.title;
    const body = docData.body;
    const data = docData.data;
    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: title,
            body: body,
            clickAction: 'FLUTTER_NOTIFICATION_CLICK'
        },
        data: data
    };
    await admin.firestore().doc('notifications_counter/' + userId).set({
        'counter': admin.firestore.FieldValue.increment(1)
    });
    const docs = await admin.firestore().collection(`users/${userId}/tokens`).get();
    const tokens = docs.docs.map(e => String(e.id));
    functions.logger.log(tokens);

    return fcm.sendToDevice(tokens, payload);

});
export const onProfile = functions.firestore.document('profiles/{profile}').onWrite(async (snapshot, context) => {
    const firestore = admin.firestore();
    const data = snapshot.after.data();

    if (!snapshot.before.exists && snapshot.after.data()!.type == 'user') {
        return;
    }

    if (!snapshot.before.exists && snapshot.after.data()!.type == 'institution') {
        let defaultCacheClient = await firestore.doc('profiles/zN9HD2x9hgfaih9KaqBM').get();
        const institutionId = data!.id;
        let clientProfileData = defaultCacheClient.data()!;
        let institutionClientData = {
            'institutionId': institutionId,
            'profile': clientProfileData,

        };
        await firestore.collection('institution_clients').add(institutionClientData);
    }
    const profileId = snapshot.after.id;
    const userDoc = admin.firestore().doc('users/' + (data!.userId));
    userDoc.set({
        'profiles': {
            [profileId]: data
        }
    }, {
        merge: true
    })


});


export const jobOffer = functions.https.onCall(async (data, context) => {

    if (!context.auth) {
        throw new functions.https.HttpsError('failed-precondition', 'The function must be called ' +
            'while authenticated.');
    }
    var userId = '';
    try {
        const userRecord = await admin.auth().getUserByPhoneNumber(data.phoneNumber);
        userId = userRecord.uid;
    } catch (error) {
        throw new functions.https.HttpsError('not-found', 'The phone number does not correspond ' +
            'to any user.');
    }

    const firestore = admin.firestore();
    const institutionId = data.institutionId

    const employeeSnap = await firestore.collection('employees')
        .where('institutionId', '==', institutionId)
        .where('userId', '==', userId)
        .limit(1).get();

    if (employeeSnap.docs.length > 0) {
        throw new functions.https.HttpsError('failed-precondition', 'This user is currently working for the institution');
    }
    const offersSnap = await firestore.collection('jobs_offers')
        .where('institutionId', '==', institutionId)
        .where('userId', '==', userId)
        .where('state', 'in', ['pending', 'accepted'])
        .limit(1).get();

    if (offersSnap.docs.length > 0) {
        throw new functions.https.HttpsError('already-exists', 'You already send an offer to ' +
            'this user.');
    }
    const institution = await firestore.doc(`profiles/${institutionId}`).get();
    functions.logger.log(institution.data());

    const institutionName = institution.data()!['nickName'];
    const ownerId = data.ownerId
    const phoneNumber = data.phoneNumber
    const role = data.role
    const state = data.state



    const doc = firestore.collection('jobs_offers').doc();
    const notificationDoc = firestore.collection('notifications').doc();
    const batch = firestore.batch();
    batch.create(
        doc, {
        'ownerId': ownerId,
        'institutionId': institutionId,
        'institutionName': institutionName,
        'phoneNumber': phoneNumber,
        'userId': userId,
        'role': role,
        'state': state,
        'creationTime': admin.firestore.FieldValue.serverTimestamp()
    }
    );




    batch.create(
        notificationDoc, {
        'id': notificationDoc.id,
        'title': 'Job Offer',
        'body': `job offer from ${institutionName} to work as ${data.role}`,
        'seen': false,
        'userId': userId,
        'data': {
            'id': notificationDoc.id,
            'route': '/jobsOffers',

        },
        'creationTime': admin.firestore.FieldValue.serverTimestamp()
    }
    );
    try {
        await batch.commit();
        data.id = doc.id;
        data.creationTime = admin.firestore.Timestamp.now();
    } catch {
        throw new functions.https.HttpsError('internal', 'Server error');
    }


    return data;
});


export const onJobOfferUpdate = functions.firestore.document('jobs_offers/{jobOffer}').onUpdate(async (snapshot, context) => {
    functions.logger.log('update start');
    const firestore = admin.firestore();

    const data = snapshot.after.data();
    const user = await firestore.doc(`profiles/${data.userId}`).get();
    functions.logger.log(user.data());
    const userData = user.data()!;
    const name = userData.name ?? null;
    const role = data.role;
    const ownerId = data.ownerId;
    const phoneNumber = data.phoneNumber;
    functions.logger.log(ownerId);
    const state = data.state;

    const batch = firestore.batch();
    if (state == 'accepted') {
        const doc = firestore.collection('employees').doc();
        batch.create(
            doc, {
            'userId': data.userId,
            institutionId: data.institutionId,
            'name': name,
            'phoneNumber': phoneNumber,
            'role': role,
            'creationTime': admin.firestore.FieldValue.serverTimestamp()
        }
        )

    }

    const notificationDoc = firestore.collection('notifications').doc();
    batch.create(
        notificationDoc, {
        'id': notificationDoc.id,
        title: 'Recruitments',
        body: `Your job offer to ${phoneNumber} has been ${state}`,
        clickAction: 'FLUTTER_NOTIFICATION_CLICK',
        'userId': ownerId,
        seen: false,
        'data': {
            'id': notificationDoc.id,
            'route': '/recruitment',
            'institutionId': data.institutionId,
            'userId': ownerId,

        },
        'creationTime': admin.firestore.FieldValue.serverTimestamp()
    }
    )

    return batch.commit();
});


export const onOrder = functions.firestore.document('orders/{order}').onWrite(async (snapshot, context) => {
    // const firestore = admin.firestore();
    // const data = snapshot.after.data()!;
    // const institutionId = data.from;
    // const institutionOwnerId = data.institutionOwnerId;
    // const userId = data.to;
    // const name = data.name;
    // const phoneNumber = data.phoneNumber;
    // const orderState = data.orderState;

    // if (!snapshot.before.exists) {
    //     const doc = firestore.collection('notifications').doc();

    //     return doc.create({
    //         'id': doc.id,
    //         'userId': institutionOwnerId,
    //         'title': 'Orders',
    //         'body': `New Order has been sent by ${name}`,
    //         'data': data
    //     });

    // } else {
    //     const doc = firestore.collection('notifications').doc();
    //     if (orderState == 'declined') {
    //         return doc.create({
    //             'id': doc.id,
    //             'userId': userId,
    //             'title': 'Orders',
    //             'body': `Your Order has been declined`,
    //             'data': data
    //         });

    //     } else if (orderState == 'canceled') {
    //         return doc.create({
    //             'id': doc.id,
    //             'userId': userId,
    //             'title': 'Orders',
    //             'body': `Your Order has been declined`,
    //             'data': data
    //         });

    //     }
    //     return;

    // }

});
