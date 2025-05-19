import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';

class GenderBackWidget extends StatefulWidget {
  const GenderBackWidget({
    Key? key,
    required this.texts,
    this.marginleft,
    this.marginRight,
    this.requestEntite,
    this.requestProfile,
    this.selectIndex = 1,
  }) : super(key: key);

  final List<String> texts;
  final double? marginleft;
  final double? marginRight;
  final CreateAccoutRequestEntite? requestEntite;
  final MainPatientProfile? requestProfile;
  final int selectIndex;

  @override
  State<GenderBackWidget> createState() => _GenderBackWidgetState();
}

class _GenderBackWidgetState extends State<GenderBackWidget> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.requestEntite?.gender ??
        widget.requestProfile?.gender ??
        widget.selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: List.generate(widget.texts.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
              widget.requestEntite?.gender = _selectedIndex;
              widget.requestProfile?.gender = _selectedIndex;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            margin: EdgeInsets.only(
              left: widget.marginleft ?? 0.0,
              right: widget.marginRight ?? 0.0,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? AppColorManger.primaryColor
                  : AppColorManger.backGroundColorGender,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: TextUtiels(
              fontFamily: AppFontFamily.tajawalBold,
              text: widget.texts[index],
            ),
          ),
        );
      }),
    );
  }
}
