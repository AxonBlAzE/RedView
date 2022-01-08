// ignore_for_file: unnecessary_new

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:reddit/reddit.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String post = "";
  Reddit reddit = new Reddit(new http.Client());
  // fetch posts using reddit
  Future fetchPosts() async {
    var posts = await reddit.frontPage.hot().limit(10).fetch();
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 37, 47, 1),
      appBar: AppBar(
        title: const Text(
          'Trending',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(194, 15, 85, 1),
            fontFamily: 'Comfortaa',
          ),
        ),
      backgroundColor: const Color.fromRGBO(27, 37, 47, 1),
      elevation: 0,
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  fetchPosts().then((value) {
                    setState(() {
                      post = value.toString();
                    });
                  });
                }, 
                child: const Text('Fetch Posts'),
                ),
              ],
            ),
            Text(post),
          ],
        ),
      )
    );
  }
}