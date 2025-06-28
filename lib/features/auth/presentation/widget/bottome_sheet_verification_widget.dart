import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_verification_code.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/confirm_account/confirm_account_state.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/resend_code_cubit/resend_code_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import 'package:hosptel_app/features/auth/presentation/widget/resend_code_widget.dart';

class BottomeSheetVerifivcationWidget extends StatefulWidget {
  const BottomeSheetVerifivcationWidget({
    Key? key,
    required this.numberPhone,
    required this.fontSizeSubText,
    required this.fontColorSubText,
    required this.fontFamailySubText,
  }) : super(key: key);

  final String numberPhone;
  final double fontSizeSubText;
  final Color fontColorSubText;
  final String fontFamailySubText;

  @override
  State<BottomeSheetVerifivcationWidget> createState() =>
      _BottomeSheetVerifivcationWidgetState();
}

class _BottomeSheetVerifivcationWidgetState
    extends State<BottomeSheetVerifivcationWidget> {
  String code = '';
  Color inActiveColor = AppColorManger.pinColorFiled;
  Color selectColor = AppColorManger.primaryColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: Center(
              child: SvgPicture.asset(
                width: 20.w,
                height: 4.h,
                AppSvgManger.rowBottomeSheet,
              ),
            ),
          ),
          //? This is Icon Back And Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 14.w),
                  child: SvgPicture.asset(
                    width: 30.w,
                    height: 30.h,
                    AppSvgManger.iconArrow,
                  ),
                ),
              ),
              TextUtiels(
                paddingRight: 19.w,
                text: AppWordManger.writeNumber,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: AppFontSizeManger.s24,
                    ),
              ),
            ],
          ),
          TextUtiels(
            paddingRight: 19.w,
            paddingTop: 10.h,
            text: AppWordManger.aCodeHasBeenSentViaTextMessageTo,
            color: AppColorManger.lightColor,
            fontSize: 17.sp,
          ),
          TextUtiels(
            textDirection: TextDirection.ltr,
            text: '+963 ${widget.numberPhone}',
            color: widget.fontColorSubText,
            fontSize: widget.fontSizeSubText,
            fontFamily: widget.fontFamailySubText,
            paddingTop: 10.h,
            paddingRight: 18.w,
          ),
          //? Confirm Code
          PinCodeFiledWidget(
            inActiveColor: inActiveColor,
            selectColor: selectColor,
            onCompleted: (vale) {
              code = vale;
            },
          ),
          BlocConsumer<ConfirmAccountCubit, ConfirmAccountState>(
            listener: (context, state) {
              AuthLogic().listenerConfirmCode(state, context);
            },
            builder: (context, state) {
              if (state.status == DeafultBlocStatus.loading) {
                return const MainLoadignWidget();
              }
              return Center(
                child: MainElevatedButton(
                  horizontalPadding: 90.w,
                  text: AppWordManger.doneVerification,
                  backgroundColor: AppColorManger.primaryColor,
                  textColor: AppColorManger.white,
                  onPreesed: () {
                    setState(() {
                      if (code.isEmpty || code.length < 4) {
                        inActiveColor = AppColorManger.redColor;
                        selectColor = AppColorManger.redColor;
                      }
                    });
                    if (code.isNotEmpty && code.length < 5) {
                      context.read<ConfirmAccountCubit>().confirmAccount(
                            phoneNumber: widget.numberPhone,
                            code: code,
                          );
                    }
                  },
                ),
              );
            },
          ),
          //? Resend Code :
          ResendCodeWidget(
            onTap: () {
              context
                  .read<ResendCodeCubit>()
                  .resendCode(phoneNumber: widget.numberPhone);
            },
          )
        ],
      ),
    );
  }
}
