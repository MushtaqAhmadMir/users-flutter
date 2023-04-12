import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  const User({
    super.key,
    required this.name,
    required this.email,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(avatar),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(name), Text(email)],
            )
          ],
        )
      ],
    );
  }
}