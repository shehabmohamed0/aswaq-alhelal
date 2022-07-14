import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp();
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript

export const helloWorld = functions.https.onRequest((request, response) => {
    functions.logger.info("Hello logs!", { structuredData: true });
    response.send("Hello from Firebase!");
});
export const isPhoneExist = functions.https.onCall(async (data, context) => {
    const phoneNumber = data.phoneNumber;
    try {
        await admin.auth().getUserByPhoneNumber(phoneNumber);
        return true;
    } catch (e) {
        return false;
    }
});