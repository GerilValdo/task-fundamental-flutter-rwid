import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_flutter_rwid/core/data/remote/dio/dio_repository.dart';

import 'core/data/local/objectbox/objectbox.dart';
import 'core/data/remote/firebase/auth/auth_repository.dart';
import 'core/routes/route.dart';
import 'features/auth/bloc/auth_bloc.dart';
import 'features/home/bloc/news_api_bloc.dart';
import 'features/news/bloc/news_bloc.dart';
import 'firebase_options.dart';

late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  objectbox = await ObjectBox.create();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBloc(objectbox)..add(GetNews()),
        ),
        BlocProvider(
          create: (context) => NewsApiBloc(DioRepository()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(authRepository: AuthRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/sign-in',
        routes: routesApp,
      ),
    );
  }
}
