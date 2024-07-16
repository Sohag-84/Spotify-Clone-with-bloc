import 'package:flutter/material.dart';
import 'package:spotify_clone_using_bloc/common/helpers/is_dark_mode.dart';

class BassicAppBar extends StatelessWidget implements PreferredSize {
  final Widget? title;
  final Widget? action;
  final bool hideBack;
  const BassicAppBar({
    super.key,
    this.title,
    this.action,
    this.hideBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(""),
      centerTitle: true,
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.04)
                      : Colors.black.withOpacity(0.04),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
              ),
            ),
      actions: [
        action ?? Container(),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
