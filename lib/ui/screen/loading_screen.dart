import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:majestic_app/ui/screen/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> transition() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  void initState() {
    transition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
              child: Lottie.asset('assets/lottie/lottie_loading.json',
                  width: 400, height: 400, fit: BoxFit.cover)),
          Center(
              child: Image.asset(
            'assets/images/image_majestic.png',
          ))
        ],
      ),
    );
  }
}
