import 'package:flutter/material.dart';

import '../../../global_widgets/app_text.dart';

class ProfileAndAbroadCard extends StatelessWidget {
  const ProfileAndAbroadCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  final String title;
  final VoidCallback? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          height: 36, // Slightly increased for better spacing
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.20)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12), // Custom padding
          child: Row(
            children: [
              Image.asset(
                icon,
                width: 17,
                height: 17,
                color: Theme.of(context).primaryColor,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomText(
                  title,
                  size: 12,
                  weight: FontWeight.w400,
                
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
