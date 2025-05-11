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
          child: ColoredBox(
            color: AppColorManger.primaryColor.withOpacity(0.4),
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadiusDirectional.only(
                  topStart: Radius.circular(20),
                  topEnd: Radius.circular(25),
                ),
                color: AppColorManger.primaryColor,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.error_outline,
                      color: AppColorManger.redColor,
                    ),
                    fit: BoxFit.fill,
                    width: 160.w,
                    height: 210.h,
                    "http://${data.personalImageUrl}",
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //? Nmae Doctor :
                        StrokeText(
                          text: data.doctorName,
                          textStyle: TextStyle(
                            fontSize: AppFontSizeManger.s20,
                            fontFamily: AppFontFamily.extraBold,
                            color: AppColorManger.white,
                          ),
                          strokeColor: AppColorManger.secoundryColor,
                          strokeWidth: 4.2,
                          textColor: AppColorManger.primaryColor,
                        ),
                        //? specialization Doctor :
                        TextUtiels(
                          text: data.specialization,
                          fontFamily: AppFontFamily.tajawalBold,
                          color: AppColorManger.primaryColor,
                          fontSize: AppFontSizeManger.s12,
                        ),
                        //? Phone Mobile Doctor  :
                        Visibility(
                          visible: data.phoneNumber.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              LuncherHelper()
                                  .launchPhoneDialer(data.phoneNumber);
                            },
                            child: InfoDoctor(
                              icon: AppSvgManger.iconPhone,
                              text: data.phoneNumber,
                            ),
                          ),
                        ),

                        Visibility(
                          visible: data.address.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              //TODO
                              // Navigator.pushNamed(context,
                              //     RouteNamedScreens.postionDoctorNameRoute);
                            },
                            child: InfoDoctor(
                              icon: AppSvgManger.iconLocation,
                              text: data.address,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
