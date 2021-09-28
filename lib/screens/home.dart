import 'package:flutter/material.dart';
import 'package:noticias_app/widgets/deportes.dart';

import 'package:noticias_app/widgets/salud.dart';

import 'package:noticias_app/widgets/general.dart';
import 'package:noticias_app/widgets/tecnologia.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;

  List<Widget> body = [General(), Salud(), Deportes(), Tecnologia()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: indice,
          children: body,
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.white,
          currentIndex: indice,
          onTap: (i) {
            setState(() {
              indice = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: " General"),
            BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety_rounded), label: "Salud"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer_outlined), label: " Deportes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: "Tecnologia"),
          ],
        ),
      ),
    );
  }
}
