import 'package:flutter/material.dart';

class NavigateMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routeName;

  const NavigateMenuItem({super.key,
    required this.title,
    required this.icon,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
    );
  }
}
