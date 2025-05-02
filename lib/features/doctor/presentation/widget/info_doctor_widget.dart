import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/class/clipping_path_class.dart';
import 'package:hosptel_app/core/function/luncher_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/svg_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_back_ground.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/doctor/presentation/cubit/about_doctor_cubit/doctor_cubit.dart';
import 'package:hosptel_app/features/home/presentation/widgets/home_primary/info_doctor_widget.dart';
import 'package:hosptel_app/router/app_router.dart';
import 'package:stroke_text/stroke_text.dart';

class InfoDoctorWidget extends StatelessWidget {
  const InfoDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAboutDoctorCubit, GetAboutDoctorState>(
      builder: (context, state) {
        if (state.status == DeafultBlocStatus.error) {
          return GestureDetector(
            onTap: () {
              context.read<GetAboutDoctorCubit>().getAboutDoctor();
            },
            child: TextUtiels(text: state.failureMessage.message),
          );
        } else if (state.status == DeafultBlocStatus.loading) {
          return const LoadingBackGroundWidget();
        }
        final data = state.entitie.result;
        return ClipPath(
          clipper: ClippingClass(),
          child: Container(
            height: 210.h,
            decoration: BoxDecoration(
              color: AppColorManger.primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //? Info Doctor :
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 25.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //? Nmae Doctor :
                      StrokeText(
                        text: data.doctorName,
                        textStyle: TextStyle(
                          fontSize: AppFontSizeManger.s24,
                          fontFamily: AppFontFamily.extraBold,
                          color: AppColorManger.white,
                        ),
                        strokeColor: AppColorManger.secoundryColor,
                        strokeWidth: 4.2,
                        textColor: AppColorManger.white,
                      ),
                      //? specialization Doctor :
                      TextUtiels(
                        text: data.specialization,
                        fontFamily: AppFontFamily.tajawalRegular,
                        color: AppColorManger.offWhite,
                        fontSize: AppFontSizeManger.s12,
                      ),
                      //? Phone Mobile Doctor  :
                      GestureDetector(
                        onTap: () {
                          LuncherHelper().launchPhoneDialer(data.phoneNumber);
                        },
                        child: InfoDoctor(
                          icon: AppSvgManger.iconPhone,
                          text: data.phoneNumber,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context,
                              RouteNamedScreens.postionDoctorNameRoute);
                        },
                        child: InfoDoctor(
                          icon: AppSvgManger.iconLocation,
                          text: data.address,
                        ),
                      ),
                    ],
                  ),
                ),
                //? Image For Doctor :
                Image.network(
                  fit: BoxFit.cover,
                  width: 150.w,
                  height: 210.h,
                  "http://${data.personalImageUrl}",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
