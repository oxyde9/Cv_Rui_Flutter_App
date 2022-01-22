///
/// main.dart
///
import 'package:flutter/material.dart';

import 'screen/device.dart';

/// Instancie l'application
void main() {
  runApp(MyApp());
}

/// La classe principale de l'application
/// qui va instancier un état StatefulWidget
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

/// la classe de l'état principal de l'application
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ///
    /// met en place un conteneur général de l'appli
    /// avec infos titre, theme, splash, icones...
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rui CV',
      //theme
      theme: ThemeData(
          fontFamily: 'Poppins',
          cardColor: Color.fromRGBO(2, 0, 62, 1),
          primarySwatch: myColor),

      ///
      /// et appel de l'écran d'accueil
      home: DeviceScreen(),
    );
  }
}

MaterialColor myColor = MaterialColor(0xFF02003E, color);
Map<int, Color> color = {
  50: Color.fromRGBO(2, 0, 62, .1),
  100: Color.fromRGBO(2, 0, 62, .1),
  200: Color.fromRGBO(2, 0, 62, .1),
  300: Color.fromRGBO(2, 0, 62, .1),
  400: Color.fromRGBO(2, 0, 62, .1),
  500: Color.fromRGBO(2, 0, 62, .1),
  600: Color.fromRGBO(2, 0, 62, .1),
  700: Color.fromRGBO(2, 0, 62, .1),
  800: Color.fromRGBO(2, 0, 62, .1),
  900: Color.fromRGBO(2, 0, 62, .1),
};
