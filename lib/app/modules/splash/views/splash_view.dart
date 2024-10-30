import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF2FF),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Vector background atas
          Positioned(
            top: 100,
            left: 0,
            child: Image.asset(
              'assets/images/splash vector 1.png',
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/splash vector 2.png',
            ),
          ),

          // Konten tengah
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bunga ungu 1.png',
                ),
                const Text(
                  'HELLO FELLAS.',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Temukan segala jenis bunga\n dari berbagai belahan dunia!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                )
              ],
            ),
          ),

          // Vector background bawah
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/Vector 3.png',
                  width: MediaQuery.of(context).size.width,
                ),
                Image.asset(
                  'assets/images/Vector 4.png',
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
