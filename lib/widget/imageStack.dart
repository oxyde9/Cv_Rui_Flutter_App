// ignore_for_file: file_names

import 'package:cv_app/theme.dart';
import 'package:flutter/material.dart';

Stack imageStack(source, legend, titre) {
  return Stack(
    children: <Widget>[
      Container(
        height: 300,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        //
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(source),
              fit: BoxFit.fill,
            )),
      ),
      Positioned(
        bottom: 20.0,
        left: 20.0,
        right: 10.0,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(legend),
            )),
      ),
      Positioned(
        top: 20.0,
        left: 190.0,
        right: 0.0,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                titre,
                style: headerTextStyle,
              ),
            )),
      ),
    ],
  );
}
