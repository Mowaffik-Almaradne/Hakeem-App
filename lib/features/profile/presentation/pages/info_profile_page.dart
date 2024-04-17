import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/main/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_type_gender_widget.dart';

class InfoProfilePage extends StatelessWidget {
  const InfoProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return MainBackGround(
      //? Back Groung Profile And Image :
      mainBody: SingleChildScrollView(
        child: Column(
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
                    color: AppColorManger.backGroundClipper,
                  ),
                ),
                Positioned(
                  bottom: -5.h,
                  child: Image.asset(
                    width: 100.w,
                    height: 100.h,
                    AppPngManger.imageProfile,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            TextUtiels(
              text: 'حسن الحلاق',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 24.sp,
                  ),
            ),
            TextUtiels(
              text: AppWordManger.welcome,
              fontFamily: AppFontFamily.extraBold,
              color: AppColorManger.textlight,
            ),
            //? filed privat name :
            const LabelTextFormFiled(
              text: AppWordManger.fullName,
              paddingTop: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45.w,
                vertical: 9.h,
              ),
              child: MainTextFormFiled(
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
              ),
            ),
            //? privat number :
            const LabelTextFormFiled(
              text: AppWordManger.phoneNumber,
              paddingTop: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 43.w,
                vertical: 9.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CharacterCityWidget(),
                  Padding(
                    padding: EdgeInsets.only(left: 9.w),
                    child: MainTextFormFiled(
                      inputFormatter: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(8),
                      ],
                      filedWidth: 200.w,
                      onChange: (value) {},
                      textInputType: TextInputType.number,
                      fillColor: AppColorManger.white,
                      borderColor: AppColorManger.borderColor,
                      borderWidht: 1.3.w,
                      contentPaddingVertical: 13.5.h,
                      contentPaddingHorizontal: 30.w,
                    ),
                  ),
                ],
              ),
            ),

            //? birh day  form filed :
            const LabelTextFormFiled(
              text: AppWordManger.birthDay,
              paddingTop: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 45.w,
                vertical: 9.h,
              ),
              child: MainTextFormFiled(
                onChange: (value) {},
                textInputType: TextInputType.name,
                fillColor: AppColorManger.white,
                borderColor: AppColorManger.borderColor,
                borderWidht: 1.3.w,
                contentPaddingVertical: 15.h,
                contentPaddingHorizontal: 27.w,
                readOnly: true,
                controller: controller,
                suffixIcon: Icons.calendar_month_outlined,
                onTap: () async {
                  await selectDate(context, controller);
                },
              ),
            ),
            //? choose gender :
            Padding(
              padding: EdgeInsets.only(right: 10.w, top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderBackWidget(
                    texts: const [AppWordManger.fmeal, AppWordManger.meal],
                    marginRight: 10.w,
                  ),
                  const LabelTypeGenderWidget(),
                ],
              ),
            ),
            SizedBox(height: 33.h),
            //? button save info :
            MainElevatedButton(
              verticalPadding: 15.h,
              horizontalPadding: 65.w,
              raduiseBorder: 18,
              text: AppWordManger.save,
              backgroundColor: AppColorManger.secoundryColor,
              textColor: AppColorManger.white,
              onPreesed: () {},
            ),
            SizedBox(height: 27.h),
          ],
        ),
      ),
    );
  }

//? Select Date :
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (selectedDate != null) {
      controller.text = selectedDate.toString().substring(0, 10);
    }
  }
}
