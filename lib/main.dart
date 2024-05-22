import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:uol_info/screens/home_detail.dart';
import 'package:uol_info/screens/home_screen.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // if(kIsWeb){
  //   await Firebase.initializeApp(
  //       options:FirebaseOptions(
  //           apiKey: "AIzaSyBw01sWZRhxYC4HVXAcl5YLx_TI9-oT4Mo",
  //           authDomain: "flutter-task-768be.firebaseapp.com",
  //           projectId: "flutter-task-768be",
  //           storageBucket: "flutter-task-768be.appspot.com",
  //           messagingSenderId: "690117692247",
  //           appId: "1:690117692247:web:529415ea6fcd6ddffd0c12",
  //           measurementId: "G-RZJMEBXNFE"
  //       )
  //   );
  //}
//  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/HomeDetail', page: () => HomeDetail()),
        //GetPage(name: '/AddFamily', page: () => AddFamily()),
        //GetPage(name: '/profile', page: () => Profile()),
        // GetPage(name: '/Registration', page: () => Registration()),
      ],
    );
  }
}

