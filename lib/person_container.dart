import 'package:flutter/material.dart';
import 'person.dart';

class PersonContainer extends StatelessWidget {
  final Person person;
  final bool isCool;

  PersonContainer({Key key, this.person, this.isCool}) : super(key: key);

  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return new SimpleDialog(
              title: new Text("${person.firstName} ${person.nickname != null ? "\"${person.nickname}\" " : ""}${person.lastName}"),
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Image(image: AssetImage(person.image)),
                    new Text("Birthday: ${person.birthday.year}-${person.birthday.month.toString().padLeft(2, '0')}-${person.birthday.day.toString().padLeft(2, '0')}"),
                    new Text("Is cool? ${this.isCool ? "yes" : "no"}"),
                  ],
                ),
              ],
            );
          },
        );
      },
      child: new ConstrainedBox(
        constraints: new BoxConstraints.expand(),
        child: new Image(image: AssetImage(person.image))
      ),
    );
  }
}