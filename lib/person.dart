import 'package:flutter/foundation.dart';

class Person {
  String firstName;
  String lastName;
  String nickname;
  DateTime birthday;
  String imagePath;

  Person({
    @required this.firstName,
    @required this.lastName,
    this.nickname,
    @required this.birthday,
    @required this.imagePath}):
      assert(firstName != null),
      assert(lastName != null),
      assert(birthday != null),
      assert(imagePath != null);

  operator ==(Object other) {
    return other is Person && other.hashCode() == hashCode();
  }

  int hashCode() {
    var hash = firstName.hashCode;
    hash = 37 * hash + lastName.hashCode;
    hash = 37 * hash + birthday.hashCode;

    return hash;
  }
}