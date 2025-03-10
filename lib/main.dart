import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/local/objectbox/objectbox.dart';
import 'core/routes/route.dart';
import 'features/news/bloc/news_bloc.dart';

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
    return BlocProvider(
      create: (context) => NewsBloc(objectbox)..add(GetNews()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/sign-in',
        routes: routesApp,
      ),
    );
  }
}
