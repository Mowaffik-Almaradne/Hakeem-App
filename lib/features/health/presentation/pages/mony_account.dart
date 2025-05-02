// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/png_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/loading_back_ground.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/health/presentation/cubit/get_all_accounts_for_patient_cubit/get_all_accounts_for_patient_cubit.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/card_pymant_widget.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/empty_account_mony.dart';
import 'package:hosptel_app/features/health/presentation/widgets/mony_account/info_mony_account.dart';

class MonyAccountPage extends StatelessWidget {
  const MonyAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: RefreshIndicator(
        onRefresh: () async {
          context
              .read<GetAllAccountsForPatientCubit>()
              .getAllAccountsForPatient(isRefresh: true);
        },
        child: SingleChildScrollView(
          child: BlocBuilder<GetAllAccountsForPatientCubit,
              GetAllAccountsForPatientState>(
            builder: (context, state) {
              return Visibility(
                replacement: const EmptyMonyAccountWidget(),
                visible: state.entities.result != null,
                child: Column(
                  children: [
                    TitlePageWidget(
                      titleText: AppWordManger.finisialAccount,
                      onTap: () => Navigator.pop(context),
                      paddingBottome: 15.h,
                    ),
                    //? Image Account :
                    Image.asset(
                      width: 100.w,
                      height: 100.h,
                      AppPngManger.imageProfile,
                    ),
                    //? NAME :
                    TextUtiels(
                      text: 'لمى الطويل',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 20.sp,
                            color: AppColorManger.textColor2,
                          ),
                    ),
                    //? Number Phone
                    TextUtiels(
                      text: '0935059855',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 20.sp,
                            color: AppColorManger.lightText,
                          ),
                    ),
                    //? Carad Pymant :
                    Visibility(
                      replacement:
                          CardPymantWidget(entity: state.entities.result),
                      visible: state.status == DeafultBlocStatus.loading,
                      child: LoadingBackGroundWidget(
                        height: 75,
                        margin: EdgeInsets.only(
                          bottom: 20.h,
                          right: 25.w,
                          top: 25.h,
                          left: 25.w,
                        ),
                      ),
                    ),
                    //? Detailes :
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextUtiels(
                        paddingRight: 21.w,
                        paddingTop: 28.5.h,
                        text: AppWordManger.details,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              fontSize: 20.sp,
                              color: AppColorManger.textColor2,
                            ),
                      ),
                    ),
                    //? Card Detailse :
                    const InfoMonyAccountWidget(),
                    //? Cost Full :
                    Visibility(
                      replacement: CardPymantWidget(
                        margin: EdgeInsets.only(top: 20.h, bottom: 50.h),
                        entity: state.entities.result,
                      ),
                      visible: state.status == DeafultBlocStatus.loading,
                      child: LoadingBackGroundWidget(
                        height: 75,
                        margin: EdgeInsets.only(
                          bottom: 20.h,
                          right: 25.w,
                          top: 25.h,
                          left: 25.w,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
