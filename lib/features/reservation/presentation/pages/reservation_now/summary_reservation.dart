import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/loading/main_loading.dart';
import 'package:hosptel_app/core/widget/main/main_app_bar/back_ground_main/back_ground_main.dart';
import 'package:hosptel_app/core/widget/main/nav_button_main/repeted/titel_pages_widget.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/reservation_now/reservation_summary/button_reservation.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/reservation_now/reservation_summary/card_summary.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/reservation_now/reservation_summary/card_symptoms.dart';
import 'package:hosptel_app/features/symptom/presentation/cubit/diagnosis_cubit.dart';
import 'package:hosptel_app/features/symptom/presentation/widgets/list_symptom_widget.dart';

class SummaryReservationPage extends StatelessWidget {
  const SummaryReservationPage({super.key, required this.request});
  final CreateAppoinmentRequest request;
  @override
  Widget build(BuildContext context) {
    return MainBackGround(
      mainBody: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: BlocBuilder<GetAllSymptomCubit, GetAllSymptomState>(
          builder: (context, state) {
            if (state.status == DeafultBlocStatus.loading &&
                state.itemsList.isEmpty) {
              return Padding(
                padding: EdgeInsets.only(top: 300.h),
                child: const MainLoadignWidget(),
              );
            }

            return Column(
              children: [
                TitlePageWidget(
                  titleText: AppWordManger.detailsReservatio,
                  onTap: () => Navigator.pop(context),
                  paddingBottome: 20.h,
                ),
                //? Card Summary :
                CardSummaryWidget(
                  request: request,
                ),
                CardSymptomsWidget(
                  onTap: () {
                    context.read<GetAllSymptomCubit>().visibile();
                  },
                ),

                //? Chose Tyoe Symptoms
                Visibility(
                  visible: state.visible,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 25.w, right: 25.w, bottom: 27.h),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: AppColorManger.whiteColorCard,
                          border: Border.all(
                            color: AppColorManger.colorBorder,
                            width: 2.w,
                          ),
                          borderRadius: BorderRadius.circular(5.r),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColorManger.balckCheck.withOpacity(0.25),
                              offset: const Offset(4, 4),
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: SymptomLitsItem(
                          request: request,
                        ),
                      ),
                    ),
                  ),
                ),
                //? Button For Continuse Resrvation :
                ButtonReservation(
                  request: request,
                  visible: state.visible,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
