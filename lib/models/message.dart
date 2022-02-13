import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

final User currentUser = User(
  id: 0,
  name: "Current User",
  imageUrl: "assets/images/", //Image.network("")
);

final User batman = User(
  id: 1,
  name: "Batman",
  imageUrl: "assets/logos/batman.jpg",
);

final User greg = User(
  id: 2,
  name: "Greg",
  imageUrl: "assets/logos/", //Image.network("")
);

final User james = User(
  id: 3,
  name: "James",
  imageUrl: "assets/logos/", //Image.network("")
);

final User john = User(
  id: 4,
  name: "John",
  imageUrl: "assets/logos/", //Image.network("")
);

final User olivia = User(
  id: 5,
  name: "Olivia",
  imageUrl: "assets/logos/", //Image.network("")
);

final User sam = User(
  id: 6,
  name: "Sam",
  imageUrl: "assets/logos/", //Image.network("")
);

final User sophia = User(
  id: 7,
  name: "Sophia",
  imageUrl: "assets/logos/", //Image.network("")
);
