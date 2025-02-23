import 'package:flutter/material.dart';
import 'package:task_flutter_rwid/core/data/local/objectbox/objectbox.dart';

import 'core/routes/route.dart';

late ObjectBox objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectbox = await ObjectBox.create();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign-in',
      routes: routesApp,
    );
  }
}
