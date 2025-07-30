import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onTapInfo;

  final bool leadingIcon;
  final List<Widget>? actions;
  final bool? centerTitle;

  const CustomAppBar({super.key, required this.title, this.onBack, this.leadingIcon = true, this.onTapInfo, this.actions, this.centerTitle});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle ?? true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      leading:
          leadingIcon
              ? Padding(
                padding: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: onBack ?? () => Get.back(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor.withAlpha(10),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              )
              : null,
      title: CustomText(title, size: 16, weight: FontWeight.w500, color: Theme.of(context).textTheme.bodyLarge!.color),
      actions: actions,
    );
  }
}
