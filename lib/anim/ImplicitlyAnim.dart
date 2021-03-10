import 'package:flutter/material.dart';

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.network(owl_url),
      TextButton(
        child: Text(
          "show detail",
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        onPressed: () => setState(() {
          opacity = 1.0;
        }),
      ),
      AnimatedOpacity(
        duration: Duration(seconds: 3),
        opacity: opacity,
        child: Column(
          children: <Widget>[
            Text(
              'Type: Owl',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Age: 39',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Employment: None',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
