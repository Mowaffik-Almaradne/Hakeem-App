import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/shared/shared_pref.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/cubit/button_nav_cubit.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/general_setting/presentation/cubit/general_setting_cubit.dart';
import 'package:hosptel_app/router/app_router.dart';

class TitlePageWidget extends StatelessWidget {
  const TitlePageWidget(
      {super.key,
      required this.titleText,
      this.onTap,
      this.isGeneralSeetings = true,
      this.paddingBottome,
      this.padding});
  final String titleText;
  final void Function()? onTap;
  final double? paddingBottome;
  final EdgeInsetsGeometry? padding;
  final bool isGeneralSeetings;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            top: 56.h,
            bottom: paddingBottome ?? 56.h,
          ),
      //? Arrow And Text :
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap ??
                () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNamedScreens.homeScreenNameRoute,
                  );
                  context
                      .read<ButtonNavCubit>()
                      .changeIndexButtonNav(2, context);
                },
            child: SvgPicture.asset(
              AppSvgManger.iconArrow,
              width: 30.w,
              height: 30.h,
            ),
          ),
          Visibility(visible: isGeneralSeetings, child: const Spacer()),
          TextUtiels(
            paddingRight: 30.w,
            text: titleText,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 20.sp,
                ),
          ),
          Visibility(
            visible: !isGeneralSeetings,
            child: BlocConsumer<GeneralSettingCubit, GeneralSettingState>(
              listener: (context, state) {
                if (state.status == DeafultBlocStatus.done) {
                  AppSharedPreferences.cashGeneralSetting(
                      isDisplayAttachments:
                          state.entity.result.isDisplayAttachments,
                      isDisplayPrescription:
                          state.entity.result.isDisplayPrescription,
                      isDisplaySessions: state.entity.result.isDisplaySessions,
                      isDisplayAccounts: state.entity.result.isDisplayAccounts);
                }
              },
              builder: (context, state) {
                if (state.status == DeafultBlocStatus.loading) {
                  return const CircularProgressIndicator();
                }

                return InkWell(
                  onTap: () {
                    context.read<GeneralSettingCubit>().getGeneralSetting();
                  },
                  child: Icon(
                    size: 30.w,
                    Icons.refresh,
                    color: AppColorManger.primaryColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
