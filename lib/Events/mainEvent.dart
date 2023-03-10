import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Events/ui/theme.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyEventApp());
}

class MyEventApp extends StatelessWidget {
  const MyEventApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Event App',
      theme: Themes.light_theme,
      darkTheme: Themes.dark_theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
