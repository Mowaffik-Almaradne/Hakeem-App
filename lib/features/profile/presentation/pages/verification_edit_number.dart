import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_verification_code.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/resend_code_cubit/resend_code_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/widget/resend_code_widget.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/confirm_edit_phone_number_cubit/confirm_edit_phone_number_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/profile_logic.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/bacground_profile.dart';

class VerficationEditNumber extends StatefulWidget {
  const VerficationEditNumber({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerficationEditNumber> createState() => _VerficationEditNumberState();
}

Color inActiveColor = AppColorManger.pinColorFiled;
Color selectColor = AppColorManger.primaryColor;

class _VerficationEditNumberState extends State<VerficationEditNumber> {
  @override
  Widget build(BuildContext context) {
    String code = '';
    return BlocBuilder<ResendCodeCubit, ResendCodeState>(
      builder: (context, state) {
        return MainBackGround(
          mainBody: SingleChildScrollView(
            child: Column(
              children: [
                //? Back Ground Verification My Number :
                BackGroundProfile(
                  phoneNumber: widget.phoneNumber,
                  textBackGround: AppWordManger.editMyNumber,
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextUtiels(
                    paddingRight: 17.w,
                    paddingBottome: 11.h,
                    text: AppWordManger.writeNumber,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 22.sp,
                        ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextUtiels(
                    paddingRight: 17.w,
                    paddingBottome: 18.h,
                    text: AppWordManger.aCodeisSentViaTextMessageTo,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 16.sp,
                        ),
                  ),
                ),
                //?Api :
                Align(
                  alignment: Alignment.centerRight,
                  child: TextUtiels(
                    paddingBottome: 3.h,
                    text: '+963 ${widget.phoneNumber}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16.sp,
                        ),
                    paddingRight: 18.w,
                  ),
                ),
                //? Edit Number :
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                        widget.phoneNumber,
                      );
                    },
                    child: TextUtiels(
                      text: AppWordManger.editNumber,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 16.sp,
                          ),
                      paddingRight: 18.w,
                      paddingBottome: 30.h,
                    ),
                  ),
                ),
                PinCodeFiledWidget(
                  inActiveColor: inActiveColor,
                  selectColor: selectColor,
                  onCompleted: (vale) {
                    code = vale;
                  },
                ),
                //? Button For sure character :
                BlocConsumer<ConfirmEditPhoneNumberCubit,
                    ConfirmEditPhoneNumberState>(
                  listener: (context, state) => ProfileLogic()
                      .listenerConfirmEditPhoneNumber(
                          context: context, state: state),
                  builder: (context, state) {
                    if (state.status == DeafultBlocStatus.loading) {
                      return const MainLoadignWidget();
                    }
                    return MainElevatedButton(
                      horizontalPadding: 90.w,
                      verticalPadding: 11.h,
                      text: AppWordManger.codeNumber,
                      backgroundColor: AppColorManger.secoundryColor,
                      textColor: AppColorManger.white,
                      onPreesed: () {
                        setState(() {
                          if (code.isEmpty || code.length < 4) {
                            inActiveColor = AppColorManger.redColor;
                            selectColor = AppColorManger.redColor;
                          }
                        });
                        if (code.isNotEmpty && code.length < 5) {
                          context
                              .read<ConfirmEditPhoneNumberCubit>()
                              .confirmEditPhoneNumber(
                                  phoneNumber: widget.phoneNumber, code: code);
                        }
                      },
                    );
                  },
                ),
                //? Dont Recive Any Code Number :
                ResendCodeWidget(
                  onTap: () {
                    context
                        .read<ResendCodeCubit>()
                        .resendCode(phoneNumber: widget.phoneNumber);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
