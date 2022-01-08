import 'package:flutter/material.dart';
import 'package:redview/pages/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();
    gotoHome();
  }

  void gotoHome() async {
    await Future.delayed(const Duration(seconds: 2), (){
      Navigator.popAndPushNamed(context, '/home');
      });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(27, 37, 47, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SpinKitCubeGrid(
              color: Color.fromRGBO(194, 15, 85, 1),
              size: 50.0,
              duration: Duration(milliseconds: 1200),
            ),
            SizedBox(height: 40,),
            Text(
              'Welcome to RedView',
                style: TextStyle(
                  color: Color.fromRGBO(194, 15, 85, 1),
                  fontSize: 25,
                ),
              )
          ],
        ),
      ),
    );
  }
}