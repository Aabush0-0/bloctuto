import 'package:Bloc/screens/post_page.dart';
import 'package:flutter/material.dart';

import 'core/networks/app_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppKeys.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PostPage());
  }
}
