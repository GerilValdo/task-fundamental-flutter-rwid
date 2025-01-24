import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
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
    );
  }
}

class MenuProfilePage extends StatelessWidget {
  const MenuProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> listMenuProfilePage = [
      {'icon': Icon(Icons.person), 'title': Text('Update Profile')},
      {'icon': Icon(Icons.lock), 'title': Text('Change Password')},
      {'icon': Icon(Icons.settings), 'title': Text('Settings')},
      {'icon': Icon(Icons.question_mark_rounded), 'title': Text('About Us')},
    ];
    return SizedBox(
      child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final menuItem = listMenuProfilePage[index];
            return ListTile(
              leading: menuItem['icon'],
              title: menuItem['title'],
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            );
          },
          separatorBuilder: (context, index) => Divider(
                color: Colors.black26,
              ),
          itemCount: 4),
    );
  }
}
