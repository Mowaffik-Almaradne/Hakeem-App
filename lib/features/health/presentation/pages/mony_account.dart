// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/entity/decode_token_entity.dart';
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
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.h),
          child: BlocBuilder<GetAllAccountsForPatientCubit,
              GetAllAccountsForPatientState>(
            builder: (context, state) {
              if (state.status == DeafultBlocStatus.loading) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 250.h),
                  child: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
              }
              return Visibility(
                replacement: const EmptyMonyAccountWidget(),
                visible:
                    (state.entities.result.pagedResultDto.items.isNotEmpty) &&
                        (state.entities.result.pushTotalAmount != 0.0 &&
                            state.entities.result.deptTotalAmount != 0.0),
                child: Column(
                  children: [
                    TitlePageWidget(
                      titleText: AppWordManger.finisialAccount,
                      onTap: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                    ),
                    //? Image Account :
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      width: 75.w,
                      height: 75.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: AppColorManger.balckCheck.withOpacity(0.09),
                            offset: const Offset(0, 2),
                          )
                        ],
                        image: const DecorationImage(
                          image: AssetImage(AppPngManger.iconApp),
                        ),
                      ),
                    ),
                    //? NAME :
                    TextUtiels(
                      text: DecodeTokenEntity.getData().name,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 20.sp,
                            color: AppColorManger.textColor2,
                          ),
                    ),
                    //? Number Phone
                    TextUtiels(
                      text: DecodeTokenEntity.getData().phoneNumber,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontSize: 20.sp,
                            color: AppColorManger.lightText,
                          ),
                    ),
                    //? Carad Pymant :
                    Visibility(
                      replacement: CardPymantWidget(
                        mainText: AppWordManger.receivables,
                        costAccount:
                            state.entities.result.deptTotalAmount.toString(),
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
                        mainText: AppWordManger.allCost,
                        margin: EdgeInsets.only(top: 20.h, bottom: 50.h),
                        costAccount:
                            state.entities.result.pushTotalAmount.toString(),
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
