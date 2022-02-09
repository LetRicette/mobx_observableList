import 'package:flutter/material.dart';
import 'package:mobx_observablelist/controller.dart';
import 'package:mobx_observablelist/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    // create: () => Controller(),
    providers: [
      Provider<Controller>(
        create: (_) => Controller(),
      ),
    ],
    child: MaterialApp(
      home: Home(),
    ),
  ));
}
