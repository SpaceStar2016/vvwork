// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';
// class LocalStorage {
//   static const String key = "myObjectKey";
//
//   static Future<bool> saveObject(Vocabulary myObject) async {
//     final prefs = await SharedPreferences.getInstance();
//     final encodedObject = myObject.toJson(); // Assuming MyObject has a toJson() method
//     return prefs.setString(key, jsonEncode(Vocabulary));
//   }
//
//   static Future<Vocabulary?> getObject() async {
//     final prefs = await SharedPreferences.getInstance();
//     final encodedObject = prefs.getString(key);
//     if (encodedObject != null) {
//       return jsonDecode(encodedObject); // Assuming MyObject has a fromJson() method
//     }
//     return null;
//   }
// }
//
// class Vocabulary {
//   final String word;
//   final String? translation;
//
//   Vocabulary(this.word, this.translation);
//
//   // Convert the object to a map
//   Map<String, dynamic> toJson() => {
//     'word': word,
//     'translation': translation ?? '',
//   };
//
//   // Create an object from a map
//   factory Vocabulary.fromJson(Map<String, dynamic> json) {
//     return Vocabulary(
//       json['word'] as String,
//       json['translation'] as String,
//     );
//   }
// }
