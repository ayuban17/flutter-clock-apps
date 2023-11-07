import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/data/enums.dart';
import 'app/data/models/menu_info.dart';
import 'app/modules/views/homepage.dart';

void main() async {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
        create: (context) => MenuInfo(MenuType.clock),
        child: HomePage(),
      ),
    ),
  );
}
