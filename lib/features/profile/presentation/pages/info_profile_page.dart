import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/function/deate_function.dart';
import 'package:hosptel_app/core/function/helper_function.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/button/main_elevated_button.dart';
import 'package:hosptel_app/core/widget/form_filed/main_form_filed.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/profile/domain/entities/res/patient_profile_entitiey.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/get_Patient_Profile_cubit/get_patient_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/cubit/updata_patient_profile_cubit/updata_patient_profile_cubit.dart';
import 'package:hosptel_app/features/profile/presentation/logic/profile_logic.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/gender_back_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/header_info_profile_widget.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_text_form_filed.dart';
import 'package:hosptel_app/features/profile/presentation/widgets/label_type_gender_widget.dart';

class InfoProfilePage extends StatelessWidget {
  const InfoProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller;
    MainPatientProfile request;
    return MainBackGround(
      //? Back Groung Profile And Image :
      mainBody: BlocBuilder<GetPatientProfileCubit, GetPatientProfileState>(
        builder: (context, state) {
          //? For Object :
          final data = state.entitey.result;
          //? For Data :
          controller = TextEditingController(
            text: formatDate(
              data.birthDate ?? DateTime.now(),
            ),
          );
          //? For Updata :
          request = MainPatientProfile(
            fullName: data.fullName,
            gender: data.gender,
            id: data.id,
            phoneNumber: data.phoneNumber,
            birthDate: data.birthDate,
          );
          if (state.status == DeafultBlocStatus.loading) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: const MainLoadignWidget(),
            );
          }
          return Column(
            children: [
              //? Header Profile
              const HeaderInfoProfileWidget(),
              SizedBox(height: 8.42.h),
              TextUtiels(
                text: data.fullName,
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
                paddingTop: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45.w,
                  vertical: 9.h,
                ),
                child: MainTextFormFiled(
                  initialValue: data.fullName,
                  onChange: (value) {
                    request.fullName = value;
                  },
                  textInputType: TextInputType.name,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  contentPaddingVertical: 15.h,
                  contentPaddingHorizontal: 27.w,
                ),
              ),
              //? Phone Number :
              const LabelTextFormFiled(
                text: AppWordManger.phoneNumber,
                paddingTop: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45.w,
                  vertical: 9.h,
                ),
                child: MainTextFormFiled(
                  initialValue: data.phoneNumber,
                  readOnly: true,
                  textInputType: TextInputType.name,
                  fillColor: AppColorManger.white,
                  borderColor: AppColorManger.borderColor,
                  borderWidht: 1.3.w,
                  contentPaddingVertical: 15.h,
                  contentPaddingHorizontal: 27.w,
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
                    await selecteDate(context, controller);
                    request.birthDate =
                        DateTime.tryParse(controller.text) ?? DateTime.now();
                  },
                ),
              ),
              //? choose gender :
              Padding(
                padding: EdgeInsets.only(
                  right: 10.w,
                  top: 10.h,
                  left: 10.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GenderBackWidget(
                      requestProfile: request,
                      selectIndex: data.gender,
                      texts: const [AppWordManger.fmeal, AppWordManger.meal],
                      marginRight: 10.w,
                    ),
                    const LabelTypeGenderWidget(),
                  ],
                ),
              ),
              //? button save info :
              BlocConsumer<UpdataPatientProfileCubit,
                  UpdataPatientProfileState>(
                listener: (context, state) => ProfileLogic()
                    .listenerProfileInfo(context: context, state: state),
                builder: (context, state) {
                  if (state.status == DeafultBlocStatus.loading) {
                    return const MainLoadignWidget();
                  }
                  return MainElevatedButton(
                    verticalPadding: 15.h,
                    paddingOut: EdgeInsets.only(top: 34.h),
                    horizontalPadding: 65.w,
                    raduiseBorder: 18,
                    text: AppWordManger.save,
                    backgroundColor: AppColorManger.secoundryColor,
                    textColor: AppColorManger.white,
                    onPreesed: () {
                      context
                          .read<UpdataPatientProfileCubit>()
                          .updataPatientProfile(request: request);
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
