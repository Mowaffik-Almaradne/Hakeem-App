import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/function/validation_funcation.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/forget_password_phone_cubit/forget_password_phone_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetForgetPasswordWidget extends StatelessWidget {
  const BottomeSheetForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    final GlobalKey<FormState> formKeyPhonePassword = GlobalKey();
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColorManger.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Form(
          key: formKeyPhonePassword,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 28.h,
                ),
                child: SvgPicture.asset(
                  width: 20.w,
                  height: 4.h,
                  AppSvgManger.rowBottomeSheet,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextUtiels(
                  paddingRight: 18.w,
                  paddingBottome: 10.h,
                  text: AppWordManger.forgetPassword,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: AppFontSizeManger.s24,
                      ),
                ),
              ),
              //? filed mobile phone :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CharacterCityWidget(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      left: 10.w,
                    ),
                    child: SizedBox(
                      height: 60.h,
                      width: 220.w,
                      child: MainTextFormFiled(
                        validator: (value) => VilidationApp().validator(value!),
                        hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                        onChange: (value) {
                          phoneNumber = value;
                        },
                        textInputType: TextInputType.phone,
                        contentPaddingVertical: 13.h,
                        contentPaddingHorizontal: 27.w,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //? button for login :
              BlocConsumer<ForgetPassswordPhoneCubit, ForgetPasswordPhoneState>(
                listener: (context, state) {
                  AuthLogic()
                      .listenerForgetPasswordPhone(state, context, phoneNumber);
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                    horizontalPadding: 75.w,
                    paddingOut: EdgeInsets.only(top: 30.h),
                    text: AppWordManger.sendCodeForEnsure,
                    backgroundColor: AppColorManger.primaryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      if (formKeyPhonePassword.currentState?.validate() ??
                          false) {
                        context
                            .read<ForgetPassswordPhoneCubit>()
                            .forgetPasswordPhone(phoneNumber: phoneNumber);
                      }
                    },
                  );
                },
              ),
              //? any account go to page Login :
              MovPageText(
                movPageText: AppWordManger.login,
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.loginScreenNameRoute,
                  );
                },
                primaryText: AppWordManger.accountAlradyFind,
              ),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
