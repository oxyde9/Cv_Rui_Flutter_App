///
/// screen/device.dart
///
import 'package:flutter/material.dart';
import 'profil.dart';
import 'infos.dart';
import 'education.dart';
import 'experience.dart';
import 'competences.dart';

/// La classe de l'écran, qui va instancier un état
// ignore: must_be_immutable
class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

/// La classe de l'état
class _DeviceScreenState extends State<DeviceScreen> {
  /// écran par défaut
  int _currentScreen = 0;

  /// liste des écrans
  final List<Widget> _screenList = [
    ProfilScreen(),
    ExperienceScreen(),
    EducationScreen(),
    SkillScreen(),
    InfoScreen()
  ];

  /// construction de l'écran principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: const Text("CV Rui "),
      ), */
      //
      body: _screenList[_currentScreen],
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        //
        onTap: onTabTapped,
        //
        currentIndex: _currentScreen,
        //
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Experience',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Formation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer),
            label: 'Competence',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Infos',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}
