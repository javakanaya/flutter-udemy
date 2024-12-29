const { onDocumentCreated } = require('firebase-functions/v2/firestore');
const admin = require('firebase-admin');

admin.initializeApp();

// Firestore trigger for document creation
exports.myFunction = onDocumentCreated('chat/{messageId}', async (event) => {
  const data = event.data; // Firestore document data

  // Extract username and text with defaults
  const username = data.username || 'Unknown User';
  const text = data.text || '';

  // Define the notification message
  const message = {
    notification: {
      title: username,
      body: text,
    },
    data: {
      click_action: 'FLUTTER_NOTIFICATION_CLICK',
    },
    topic: 'chat', // Topic to send the notification
  };

  try {
    // Send notification
    const response = await admin.messaging().send(message);
    console.log('Notification sent successfully:', response);
  } catch (error) {
    console.error('Error sending notification:', error);
  }
});
