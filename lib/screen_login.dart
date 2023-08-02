import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/admin');
              },
              child: Text('Admin')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              child: Text('User'))
        ],
      ),
    );
  }
}
