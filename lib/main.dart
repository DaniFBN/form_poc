import 'package:flutter/material.dart';
import 'package:form_poc/test_page_model.dart';

import 'fields/text/money/palm_money_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        extensions: [
          PalmMoneyStyle(
            errorColor: Colors.red.shade300,
          ),
        ],
      ),
      home: TestPageModel(),
    );
  }
}
