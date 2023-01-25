import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget {
  const ApplicationAppBar({Key? key}) : super(key: key);
  final pokeLogoPath = "assets/pokelogo.jpeg";
  final appName = "Pokemon";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: CircleAvatar(
                radius: 32,
                backgroundImage: AssetImage(pokeLogoPath),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  appName,
                  style: TextStyle(fontSize: 29),
                ),
              ))
        ],
      ),
    );
  }
}
