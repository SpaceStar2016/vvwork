import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class LocalStorage {
  static const String key = "myObjectKey";

  static Future<bool> saveObject(MyObject myObject) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedObject = myObject.toJson(); // Assuming MyObject has a toJson() method
    return prefs.setString(key, jsonEncode(MyObject));
  }

  static Future<MyObject?> getObject() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedObject = prefs.getString(key);
    if (encodedObject != null) {
      return jsonDecode(encodedObject); // Assuming MyObject has a fromJson() method
    }
    return null;
  }
}

class MyObject {
  final String name;
  final int age;

  MyObject(this.name, this.age);

  // Convert the object to a map
  Map<String, dynamic> toJson() => {
    'name': name,
    'age': age,
  };

  // Create an object from a map
  factory MyObject.fromJson(Map<String, dynamic> json) {
    return MyObject(
      json['name'] as String,
      json['age'] as int,
    );
  }
}
