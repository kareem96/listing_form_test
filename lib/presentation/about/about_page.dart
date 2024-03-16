import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 200),
            Text("Abdul Karim"),
            Text("ak339444@gmail.com"),
            Text("https://github.com/kareem96"),
          ],
        )
      ),
    );
  }
}
