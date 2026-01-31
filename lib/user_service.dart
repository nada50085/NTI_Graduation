// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserService {
//   static final _users = FirebaseFirestore.instance.collection('users');

//   static Future<void> createUser(String uid) async {
//     await _users.doc(uid).set({
//       'cart': [],
//       'themeMode': 'light',
//       'language': 'en',
//     });
//   }

//   static Future<Map<String, dynamic>> getUserData(String uid) async {
//     final doc = await _users.doc(uid).get();
//     return doc.data() ?? {};
//   }

//   static Future<void> updateCart(String uid, List<Map<String, dynamic>> cart) async {
//     await _users.doc(uid).update({'cart': cart});
//   }

//   static Future<void> updateTheme(String uid, String theme) async {
//     await _users.doc(uid).update({'themeMode': theme});
//   }

//   static Future<void> updateLanguage(String uid, String language) async {
//     await _users.doc(uid).update({'language': language});
//   }
// }
