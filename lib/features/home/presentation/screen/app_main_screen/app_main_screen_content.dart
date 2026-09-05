import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class AppMainScreenContent extends StatefulWidget {
  const AppMainScreenContent({Key? key}) : super(key: key);

  @override
  State<AppMainScreenContent> createState() => _AppMainScreenContentState();
}

class _AppMainScreenContentState extends State<AppMainScreenContent> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen(param: HomeScreenParam());
  }
}
