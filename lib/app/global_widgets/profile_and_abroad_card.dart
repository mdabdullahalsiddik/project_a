
import 'package:flutter/material.dart';
import 'app_text.dart';

class ProfileAndAbroadCard extends StatelessWidget {
  const ProfileAndAbroadCard({super.key, required this.title, required this.subTitle, required this.onTap, required this.icon});

  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 1,
        child: ListTile(
          minLeadingWidth: 50,
          onTap: onTap,
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Theme.of(context).primaryColor.withAlpha(20),
            child: Image.asset(icon, width: 24, height: 24, fit: BoxFit.contain),
          ),
          title: CustomText(title, size: 16, weight: FontWeight.bold),
          subtitle: CustomText(subTitle, size: 10, weight: FontWeight.w400),
          isThreeLine: false,
        ),
      ),
    );
  }
}
