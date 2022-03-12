import 'package:flutter/material.dart';
import 'package:ieee_flutter_app/core/design/app_theme.dart';
import 'package:ieee_flutter_app/core/service/network/network_service.dart';
import 'package:ieee_flutter_app/view/on_board/view/on_board_view.dart';

void main() {
  NetworkService.instance.initializeNetworkSettings();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      title: 'Material App',
      home: OnBoardView(),
    );
  }
}
