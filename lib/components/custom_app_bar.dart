import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imake/components/widgets.dart';
import 'package:imake/utils/color_palette.dart';
import 'package:imake/utils/font_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? onBackTap;
  final bool showBackArrow;
  final Color? backgroundColor;
  final List<Widget>? actionWidgets;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.onBackTap,
      this.showBackArrow = true,
      this.backgroundColor = kWhiteColor,
      this.actionWidgets});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: showBackArrow
          ? IconButton(
              icon: SvgPicture.asset('assets/svgs/back_arrow.svg'),
              onPressed: () {
                if (onBackTap != null) {
                  onBackTap!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            )
          : null,
      actions: actionWidgets,
      title: Row(
        children: [
          buildText(title, kBlackColor, textMedium, FontWeight.w500,
              TextAlign.start, TextOverflow.clip),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarWithCustomTitle extends CustomAppBar {
  final IconData? buttonIcon;
  final VoidCallback? onTitleIconPressed;

  const CustomAppBarWithCustomTitle(
      {super.key,
      required String title,
      bool showBackArrow = false,
      Color? backgroundColor,
      List<Widget>? actionWidgets,
      this.buttonIcon,
      this.onTitleIconPressed})
      : super(
            title: title,
            showBackArrow: showBackArrow,
            backgroundColor: backgroundColor,
            actionWidgets: actionWidgets);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: actionWidgets,
      title: TextButton.icon(
        icon: Icon(buttonIcon),
        label: buildText(title, kBlackColor, textMedium, FontWeight.w500,
            TextAlign.start, TextOverflow.clip),
        onPressed: onTitleIconPressed,
      ),
    );
  }
}
