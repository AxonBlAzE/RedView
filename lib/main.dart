import 'package:flutter/material.dart';
import 'package:redview/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
        },
      ),
    );