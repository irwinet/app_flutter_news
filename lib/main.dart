import 'package:app_flutter_news/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:app_flutter_news/src/pages/tabs_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'Material App',
      home: TabsPage(),
    );
  }
}