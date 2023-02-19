import 'package:flutter/material.dart';
import 'package:prueba/pages/edit_name_page.dart';

import 'package:prueba/pages/index.dart';
// importacion de firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _routes = {
    '/': (context) => const home(),
    '/add': (context) => const AddPersonPage(),
    '/edit': (context) => const editName(),
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMP',
      initialRoute: '/',
      routes: _routes,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const Screen404());
      },
    );
  }
}
