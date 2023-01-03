
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Poster extends StatelessWidget {
  String link;
  int id;
  Poster({super.key, required this.link, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {context.pushNamed("detail")},
        child: Container(
            width: 150,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(link)))));
  }
}
