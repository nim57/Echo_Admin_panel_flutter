/**
 * Import function triggers from their respective submodules:
 */
const {onDocumentCreated} = require("firebase-functions/v2/firestore");
const {initializeApp} = require("firebase-admin/app");
const {getFirestore} = require("firebase-admin/firestore");
const {getMessaging} = require("firebase-admin/messaging");
const logger = require("firebase-functions/logger");

// Initialize Firebase Admin SDK
initializeApp();

// Create and deploy your first functions
exports.sendNotification = onDocumentCreated(
    "notifications/{notificationId}",
    async (event) => {
      try {
        // Get the created document snapshot
        const snap = event.data;
        if (!snap) {
          logger.error("No data associated with the event");
          return;
        }

        // Get notification data
        const notification = snap.data();
        logger.log("New notification received:", notification);

        // Validate required fields
        if (!notification.title || !notification.description) {
          throw new Error("Missing required notification fields");
        }

        // Create FCM message payload
        const message = {
          notification: {
            title: notification.title,
            body: notification.description,
          },
          data: {
            type: "notification",
            notificationId: event.params.notificationId,
            click_action: "FLUTTER_NOTIFICATION_CLICK",
          },
          topic: "all_users",
        };

        // Send notification via FCM
        const messaging = getMessaging();
        await messaging.send(message);
        logger.log(
            "Notification sent successfully:",
            event.params.notificationId,
        );

        // Update document status
        const firestore = getFirestore();
        await firestore
            .collection("notifications")
            .doc(event.params.notificationId)
            .update({status: "sent"});
      } catch (error) {
        logger.error("Error sending notification:", error);

        // Update document with error status
        const firestore = getFirestore();
        await firestore
            .collection("notifications")
            .doc(event.params.notificationId)
            .update({
              status: "failed",
              error: error.message,
            });
      }
    },
);
