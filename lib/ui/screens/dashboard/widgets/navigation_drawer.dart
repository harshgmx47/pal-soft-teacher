import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  static final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Container(
            color: Colors.grey[800],
            child: ListView(children: <Widget>[
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    buildMenuItem(
                      context,
                      text: 'Dashboard',
                      icon: Icons.dashboard,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("/");
                      },
                    ),
                    buildMenuItem(
                      context,
                      text: 'Daily Quiz',
                      icon: Icons.question_mark,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("dailyQuiz");
                      },
                    ),
                    buildMenuItem(
                      context,
                      text: 'ExamModule',
                      icon: Icons.question_mark,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("examModule");
                      },
                    ),
                  ],
                ),
              )
            ])));
  }

  Widget buildMenuItem(
    BuildContext context, {
    required String text,
    required IconData icon,
    final VoidCallback? onTap,
  }) {
    final color = Colors.white;
    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(text, style: TextStyle(color: color, fontSize: 12)),
        onTap: onTap,
      ),
    );
  }
}
