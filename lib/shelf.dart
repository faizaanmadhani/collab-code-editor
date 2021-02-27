import 'package:flutter/material.dart';

// Generalized widget for rendering all the required books

class Shelf extends StatelessWidget {
  final String pageTitle;

  Shelf(this.pageTitle);

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Center (
        child: Text(pageTitle),
      )
    );
  }
}