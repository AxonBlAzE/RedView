import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 37, 47, 1),
      appBar: AppBar(
        title: const Text(
          'Select A Viewer',
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
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getButton('Reddit', 'https://www.reddit.com/', context),
                const SizedBox(width: 40,),
                _getButton('Scrolller', 'https://scrolller.com/', context),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getButton('Reddup', 'https://www.reddup.co/', context),
                const SizedBox(width: 40,),
                _getButton('Deck', 'https://rdddeck.com/', context),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getButton('ReddPics', 'https://reddpics.com/', context),
                const SizedBox(width: 40,),
                _getButton('UpDoot', 'https://updoot.app/', context),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getButton('Panoptikos', 'https://popular.pics/reddit/subreddits/posts?r=CozyPlaces,MostBeautiful,wallpapers', context),
                const SizedBox(width: 40,),
                _getButton('Old Reddit', 'https://old.reddit.com/', context),
              ],
            ),
          ],
        ),
      )
    );
  }
}

Widget _getButton(String title, String url,BuildContext context) {
  return GestureDetector(
    onTap: () async {Navigator.pushNamed(context, '/view',arguments: {
      'title': title,
      'url': url,
    });
    },
    child: Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Color.fromRGBO(194, 15, 85, 1), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "./assets/images/$title.png",
                fit: BoxFit.cover,
                width: 60,
                height: 60,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(194, 15, 85, 1),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}