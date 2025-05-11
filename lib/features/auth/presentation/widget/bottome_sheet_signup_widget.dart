import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosptel_app/core/function/deate_function.dart';
import 'package:hosptel_app/core/function/validation_funcation.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/charater_city_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/core/widget/form_filed/text_form_filed_pasword_widget.dart';
import 'package:hosptel_app/features/auth/domin/entities/req/create_account_request_entite.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account_cubit/create_account_cubit.dart';
import 'package:hosptel_app/features/auth/presentation/cubit/create_Account_cubit/create_account_state.dart';
import 'package:hosptel_app/features/auth/presentation/logic/auth_logic.dart';
import 'package:hosptel_app/features/auth/presentation/widget/move_page_text_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/router/app_router.dart';

class BottomeSheetSignUpWidget extends StatelessWidget {
  const BottomeSheetSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyCreateAccount = GlobalKey();
    CreateAccoutRequestEntite request = CreateAccoutRequestEntite();
    TextEditingController controller = TextEditingController();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorManger.whiteColorCard,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Form(
        key: formKeyCreateAccount,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: 12.h,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20.w),
                child: SvgPicture.asset(
                  width: 5.w,
                  height: 3.h,
                  AppSvgManger.rowBottomeSheet,
                ),
              ),
              //? full name filed  :
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: MainTextFormFiled(
                  hintText: AppWordManger.fullName,
                  validator: (value) => VilidationApp().validator(value!),
                  onChange: (value) {
                    request.fullName = value;
                  },
                  textInputType: TextInputType.name,
                  filedWidth: 250.w,
                  filedHeight: 60.h,
                  contentPaddingVertical: 13.h,
                  contentPaddingHorizontal: 27.w,
                ),
              ),
              //? filed mobile phone :
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CharacterCityWidget(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 12.h,
                        left: 10.w,
                      ),
                      child: SizedBox(
                        width: 200.w,
                        height: 60.h,
                        child: MainTextFormFiled(
                          hintText: AppWordManger.pleaseEnterYourPhoneNumber,
                          onChange: (value) {
                            request.phomeNumber = value;
                          },
                          validator: (value) =>
                              VilidationApp().validator(value!),
                          textInputType: TextInputType.phone,
                          contentPaddingVertical: 13.h,
                          contentPaddingHorizontal: 25.w,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //? filed  Paswword :
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: TextFormFiledPassword(
                  hintText: AppWordManger.password,
                  onChange: (value) {
                    request.password = value;
                  },
                  validator: (value) =>
                      VilidationApp().validatorPassword(value: value ?? ''),
                  textInputType: TextInputType.visiblePassword,
                  filedWidth: 275,
                  filedHeight: 60,
                ),
              ),
              //? filed birthDay :
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: MainTextFormFiled(
                  validator: (value) => VilidationApp().validator(value!),
                  readOnly: true,
                  controller: controller,
                  onTap: () async {
                    await selecteDate(context, controller);
                    request.birhdDay = controller.text;
                  },
                  suffixIcon: Icons.calendar_month_outlined,
                  hintText: AppWordManger.birthDay,
                  onChange: (value) {},
                  textInputType: TextInputType.name,
                  filedWidth: 275.w,
                  filedHeight: 60.h,
                  contentPaddingVertical: 13.h,
                  contentPaddingHorizontal: 25.w,
                ),
              ),
              //? choose Gender :
              Padding(
                padding: EdgeInsets.only(
                  right: 6.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderBackWidget(
                      requestEntite: request,
                      texts: const [AppWordManger.fmeal, AppWordManger.meal],
                      marginRight: 10.w,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 22.h),
                      decoration: BoxDecoration(
                        color: AppColorManger.fillColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextUtiels(
                        text: AppWordManger.gander,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 13.sp,
                                  fontFamily: AppFontFamily.tajawalBold,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              //? button for Gust  :
              MainElevatedButton(
                text: AppWordManger.loginGust,
                backgroundColor: AppColorManger.secoundryColor,
                textColor: AppColorManger.white,
                onPreesed: () {
                  context
                      .read<ButtonNavCubit>()
                      .changeIndexButtonNav(2, context);
                },
                horizontalPadding: 80.w,
              ),
              //? button for Create Account  :
              BlocConsumer<CreateAccountCubit, CreateAccountState>(
                listener: (context, state) {
                  AuthLogic().listenerCreateAccount(
                      state, context, request.phomeNumber ?? "");
                },
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                    paddingOut: EdgeInsetsDirectional.only(
                      top: 10.h,
                    ),
                    text: AppWordManger.createAccount,
                    backgroundColor: AppColorManger.primaryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      if (formKeyCreateAccount.currentState!.validate()) {
                        context
                            .read<CreateAccountCubit>()
                            .createAccount(request: request);
                      }
                    },
                  );
                },
              ),
              //? any account go to page login :
              MovPageText(
                movPageText: AppWordManger.login,
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.loginScreenNameRoute,
                  );
                },
                primaryText: AppWordManger.dontHaveAnAccountAlreadyPlease,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
