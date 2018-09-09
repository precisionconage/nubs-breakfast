import 'package:flutter/foundation.dart';

class Person {
  String firstName;
  String lastName;
  String nickname;
  DateTime birthday;
  String image;

  Person({
    @required this.firstName,
    @required this.lastName,
    this.nickname,
    @required this.birthday,
    @required this.image}):
      assert(firstName != null),
      assert(lastName != null),
      assert(birthday != null),
      assert(image != null);

  operator ==(Object other) {
    return other is Person && other.hashCode == hashCode;
  }

  int get hashCode {
    var hash = firstName.hashCode;
    hash = 37 * hash + lastName.hashCode;
    hash = 37 * hash + birthday.hashCode;

    return hash;
  }
}