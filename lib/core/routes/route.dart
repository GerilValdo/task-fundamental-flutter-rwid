import 'package:flutter/material.dart';
import 'package:task_flutter_rwid/features/main/main_screen.dart';
import '../../features/profile/profile_page.dart';
import '../../features/saved/saved_page.dart';
import '../../features/home/home_page.dart';
import '../../features/auth/login_page.dart';
import '../../features/auth/register_page.dart';
// import '../../features/news/news_form.dart';

Map<String, Widget Function(BuildContext)> routesApp = {
  '/': (context) => MainScreen(),
  '/home-page': (context) => HomePage(),
  '/saved-page': (context) => SavedPage(),
  '/profile-page': (context) => ProfilePage(),
  '/sign-in': (context) => LoginPage(),
  '/sign-up': (context) => RegisterPage(),
  // '/news-form': (context) => NewsForm(),
};
