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

export const jobOffer = functions.https.onCall(async (data, context) => {
    if (!context.auth) {
        // Throwing an HttpsError so that the client gets the error details.
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
    const ownerId = data.ownerId
    const institutionId = data.institutionId
    const institutionName = data.institutionName
    const phoneNumber = data.phoneNumber
    const role = data.role
    const state = data.state


    const snap = await firestore.collection('jobs_offers')
        .where('institutionId', '==', institutionId)
        .where('userId', '==', userId)
        .where('state', 'not-in', ['pending', 'accepted'])
        .limit(1).get();

    if (snap.docs.length > 0) {
        throw new functions.https.HttpsError('already-exists', 'You already send an offer to ' +
            'this user.');
    }




    const doc = firestore.collection('jobs_offers').doc();

    await doc.set({
        'ownerId': ownerId,
        'institutionId': institutionId,
        'institutionName': institutionName,
        'phoneNumber': phoneNumber,
        'userId': userId,
        'role': role,
        'state': state,
        'creationTime': admin.firestore.FieldValue.serverTimestamp()
    });
    data.id = doc.id;
    data.creationTime = admin.firestore.Timestamp.now();

    return data;
});


export const onJobOffer = functions.firestore.document('jobs_offers/{jobOffer}').onCreate(async (snapshot, context) => {
    functions.logger.log('OnOffer start');
    const fcm = admin.messaging();
    const data = snapshot.data();
    const userId = data.userId;

    functions.logger.log(userId);

    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: 'New job offer',
            body: `job offer from ${data.institutionName} to work as ${data.role}`,
            clickAction: 'FLUTTER_NOTIFICATION_CLICK'
        }
    };
    const docs = await admin.firestore().collection(`users/${userId}/tokens`).get();
    const tokens = docs.docs.map(e => String(e.id));
    functions.logger.log(tokens);


    return fcm.sendToDevice(tokens, payload);
});

export const onJobOfferUpdate = functions.firestore.document('jobs_offers/{jobOffer}').onUpdate(async (snapshot, context) => {
    functions.logger.log('update start');
    const fcm = admin.messaging();
    const firestore = admin.firestore();

    const data = snapshot.after.data();
    const user = await firestore.doc(`users/${data.userId}`).get();
    functions.logger.log(user.data());
    const userData = user.data()!;
    const name = userData.name ?? null;
    const role = data.role;
    const ownerId = data.ownerId;
    const phoneNumber = data.phoneNumber;
    functions.logger.log(ownerId);
    const state = data.state;
    if (state == 'accepted') {
        firestore.collection('employees').add({
            'userId': data.userId,
            institutionId: data.institutionId,
            'name': name,
            'phoneNumber': phoneNumber,
            'role': role,
            'creationTime': admin.firestore.FieldValue.serverTimestamp()
        })

    }

    const payload: admin.messaging.MessagingPayload = {
        notification: {
            title: 'Job offer',
            body: `Your job offer to ${phoneNumber} has been ${state}`,
            clickAction: 'FLUTTER_NOTIFICATION_CLICK'
        }

    };
    const docs = await admin.firestore().collection(`users/${ownerId}/tokens`).get();
    const tokens = docs.docs.map(e => String(e.id));
    functions.logger.log(tokens);


    return fcm.sendToDevice(tokens, payload);
});

