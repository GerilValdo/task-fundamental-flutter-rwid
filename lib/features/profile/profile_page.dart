import 'package:flutter/material.dart';
import './widgets/menu_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).height,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Container(
                  height: 135,
                  width: 135,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 4, color: Colors.black)),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Image.asset(
                      'assets/image/photo_profile.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ListTile(
                  title: Center(
                      child: Text(
                    'Geril Valdo Jatsiah Manday',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  subtitle: Center(child: Text('gerilmanday@gmail.com')),
                ),
                SizedBox(height: 15),
                Divider(
                  color: Colors.black26,
                ),
                MenuProfilePage(),
                Divider(
                  color: Colors.black26,
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white)
                      .copyWith(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Logout'),
                      SizedBox(width: 5),
                      Icon(
                        Icons.exit_to_app_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
