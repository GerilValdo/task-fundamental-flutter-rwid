import 'package:flutter/material.dart';

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
