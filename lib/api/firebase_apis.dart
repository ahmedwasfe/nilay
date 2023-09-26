import 'dart:convert';
import 'dart:developer';
import 'dart:io';

class FirebaseAPIs {
// static FirebaseAuth mAuth = FirebaseAuth();

// TODO for accessing cloud firestore database
//   static FirebaseFirestore mFirestore = FirebaseFirestore.instance;
//
//   // for accessing firebase storage
//   static FirebaseStorage mStorage = FirebaseStorage.instance;
//
//   // static User get user => mAuth.currentUser!;
//   static User currentUser = AppHelper.getCurrentUser()!;
//
//   static late Conversation me;
//
// // TODO for checking id user exists or not ?
//   static Future<bool> userExist() async {
//     return (await mFirestore
//         .collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .doc(currentUser.uuid!)
//         .get())
//         .exists;
//   }
//
//   static Future<void> getSelfInfo() async {
//     await mFirestore
//         .collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .doc(currentUser.uuid)
//         .get()
//         .then((user) async {
//       if (user.exists) {
//         me = Conversation.fromJson(user.data()!);
//         print('Current User: ${jsonEncode(me)}');
//       } else {
//         await createConversation().then((value) => getSelfInfo());
//       }
//     });
//   }
//
//   // TODO Create new conversation
//   static Future<void> createConversation() async {
//     final time = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//
//     var uuid = Uuid();
//     String uid = uuid.v4();
//     // print('uidv4: $uid');
//     Conversation conversation = Conversation(
//       userId: currentUser.id.toString(),
//       uuid: currentUser.uuid,
//       name: currentUser.name,
//       image: currentUser.image,
//       email: currentUser.email,
//       phone: currentUser.phone,
//       userType: currentUser.type,
//       lastMessage: "Hey, I'm using Arahab",
//       createAt: time,
//       isOnline: false,
//       lastActive: time,
//       pushToken: '',
//     );
//     return await mFirestore
//         .collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .doc(currentUser.uuid)
//         .set(conversation.toJson());
//   }
//
//   // TODO get all users without current user
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
//     return mFirestore
//         .collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .where('uuid', isNotEqualTo: currentUser.uuid)
//         .snapshots();
//   }
//
//   // TODO getting specific user info
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
//       Conversation conversation) {
//     return mFirestore.collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .where('uuid', isEqualTo: conversation.uuid)
//         .snapshots();
//   }
//
//   // TODO update online or last active status of user
//   static Future<void> updateActiveStatus(bool isOnline) async {
//     final lastActive = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     var activeStatus = {
//       'is_online': isOnline,
//       'last_active': lastActive
//     };
//     mFirestore.collection(Const.KEY_COLLECTION_CONVERSATIONS)
//         .doc(currentUser.uuid)
//         .update(activeStatus);
//   }
//
//   // TODO ******** Chat Screen Related APIs *********
//
//   // TODO for getting conversation Id
//   static String getConversationId(String id) =>
//       currentUser.uuid.hashCode <= id.hashCode
//           ? '${currentUser.uuid}_$id'
//           : '${id}_${currentUser.uuid}';
//
//   // static String getConversationId() {
//   //   var uuid = Uuid();
//   //   return uuid.v4();
//   // }
//
//   // TODO for get all messages of specific conversation from firestore database
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
//       Conversation conversation) {
//     return mFirestore
//         .collection(
//         '${Const.KEY_COLLECTION_CHATS}/${getConversationId(
//             conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/')
//         .orderBy('sent', descending: true)
//         .snapshots();
//   }
//
//   // TODO for send messages
//   static Future<void> sendMessage(Conversation conversation, String msg,
//       MessageType messageType) async {
//     // message sending time (also used as id)
//     final time = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     // message to send
//     Message message = Message(
//         fromId: currentUser.uuid,
//         toId: conversation.uuid,
//         toImage: conversation.image,
//         message: msg,
//         read: '',
//         type: messageType,
//         sent: time);
//
//     final ref = mFirestore.collection(
//         '${Const.KEY_COLLECTION_CHATS}/${getConversationId(
//             conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/');
//     await ref.doc(time).set(message.toJson());
//   }
//
//   // TODO update read status of message
//   static Future<void> updateMessageReadStatus(Message message) async {
//     final time = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     var readMessage = {'read': time};
//
//     mFirestore
//         .collection(
//         '${Const.KEY_COLLECTION_CHATS}/${getConversationId(
//             message.fromId!)}/${Const.KEY_COLLECTION_MESSAGES}/')
//         .doc(message.sent!)
//         .update(readMessage);
//   }
//
//   // TODO get only last message of a Specific chat
//   static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
//       Conversation conversation) {
//     return mFirestore
//         .collection(
//         '${Const.KEY_COLLECTION_CHATS}/${getConversationId(
//             conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/')
//         .orderBy('sent', descending: true)
//         .limit(1)
//         .snapshots();
//   }
//
//   // TODO Send chat image
//   static Future<void> sendImageMessage(Conversation conversation,
//       File file) async {
//     final time = DateTime
//         .now()
//         .millisecondsSinceEpoch
//         .toString();
//     // getting image file extension
//     final ext = file.path
//         .split('.')
//         .last;
//
//     // storage image file ref with path
//     final ref = mStorage.ref().child(
//         '${Const.KEY_COLLECTION_IMAGES}/${getConversationId(
//             conversation.uuid!)}/${time}.$ext');
//
//     // uploading image
//     await ref.putFile(file, SettableMetadata(contentType: 'image/$ext'))
//         .then((p0) {
//       log('Data Transferred: ${p0.bytesTransferred / 1000} KB');
//     });
//
//     // update image in firestore database
//     final imageUri = await ref.getDownloadURL();
//     await sendMessage(conversation, imageUri, MessageType.IMAGE);
//   }
}
