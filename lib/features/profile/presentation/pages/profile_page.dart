import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  width: double.infinity,
                  height: 170.h,
                  color: const Color(0xff0173B4),
                ),
              ),
              Positioned(
                bottom: -27.h,
                child: Image.asset(
                  width: 100.w,
                  height: 100.h,
                  'assets/image/png/3d_avatar_21.png',
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),
          TextUtiels(
            text: 'حسن الحلاق',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColorManger.textColor2,
                ),
          ),
          TextUtiels(
            text: 'مرحبا بك',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColorManger.textlight,
                  fontWeight: AppFontWeightManger.fontWeightBold,
                ),
          ),
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 10);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 20);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
