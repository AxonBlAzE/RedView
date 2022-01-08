import 'package:flutter/material.dart';
import 'package:redview/pages/home.dart';
import 'package:redview/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          fontFamily: 'Comfortaa',
          backgroundColor: Color.fromRGBO(27, 37, 47, 1),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
        },
      ),
    );