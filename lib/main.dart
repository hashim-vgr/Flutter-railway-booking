import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpro/screen_home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';





Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
 
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BookMyTrain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 70, 111, 225),
          brightness: Brightness.light,
        ),
        fontFamily: GoogleFonts.montserrat().fontFamily,
       
        
        textTheme: TextTheme( titleLarge:TextStyle(fontSize: 20,fontWeight: FontWeight.w900) ,headlineLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,),
          headlineMedium: TextStyle(fontSize: 25))
      ),

     home: ScreenHome(),
    );
  }
}



