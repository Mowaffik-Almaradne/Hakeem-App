import 'package:flutter/material.dart';
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
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/reset_password_cubit.dart/reset_password_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';

class BottomeSheetResetPassword extends StatelessWidget {
  final InfoForgetPassword data;
  const BottomeSheetResetPassword({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyForgetPassword = GlobalKey();
    String newPassword = '';

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
          key: formKeyForgetPassword,
          child: Padding(
            padding: EdgeInsets.only(left: 17.w, right: 17.w, bottom: 30.h),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        width: 30.w,
                        height: 30.h,
                        AppSvgManger.iconArrow,
                      ),
                    ),
                    TextUtiels(
                      text: AppWordManger.resetPassword,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: AppFontSizeManger.s24,
                          ),
                    ),
                  ],
                ),
                //? Filed New Password :
                Padding(
                  padding: EdgeInsets.only(top: 29.h, right: 21.w, left: 21.w),
                  child: TextFormFiledPassword(
                    hintText: AppWordManger.newPassword,
                    onChange: (value) {
                      newPassword = value;
                    },
                    validator: (value) =>
                        VilidationApp().validatorPassword(value: value ?? ''),
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                //? Filed New Password :
                Padding(
                  padding: EdgeInsets.only(top: 29.h, right: 21.w, left: 21.w),
                  child: TextFormFiledPassword(
                    hintText: AppWordManger.confirmNewPassword,
                    onChange: (value) {},
                    validator: (value) =>
                        VilidationApp().validatorRenEnterPassword(
                      value!,
                      newPassword,
                    ),
                    textInputType: TextInputType.visiblePassword,
                  ),
                ),
                //? Button For Ensure :
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    AuthLogic().listenerResetPassword(state, context);
                  },
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.loading) {
                      return const MainLoadignWidget();
                    }
                    return MainElevatedButton(
                      horizontalPadding: 120.w,
                      raduiseBorder: 13,
                      paddingOut: EdgeInsetsDirectional.only(
                        top: 27.h,
                      ),
                      text: AppWordManger.sure,
                      backgroundColor: AppColorManger.primaryColor,
                      textColor: AppColorManger.white,
                      onPreesed: () {
                        if (formKeyForgetPassword.currentState?.validate() ??
                            false) {
                          context.read<ResetPasswordCubit>().reserPassword(
                                phoneNumber: data.phoneNumber,
                                code: data.code,
                                newPassword: newPassword,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
