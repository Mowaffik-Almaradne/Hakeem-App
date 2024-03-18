import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.flexibleSpace,
      required,
      required this.hieghtAppbar})
      : super(key: key);

  final Widget flexibleSpace;
  final double hieghtAppbar;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      flexibleSpace: flexibleSpace,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hieghtAppbar);
}
