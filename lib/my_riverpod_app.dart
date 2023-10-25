import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/page/riverpod_page.dart';

///RiverPod App
class MyRiverPodApp extends StatelessWidget {
  const MyRiverPodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RiverPodPage());
  }
}
