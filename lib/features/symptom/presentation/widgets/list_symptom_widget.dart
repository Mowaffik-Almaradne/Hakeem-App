import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/enum_manger.dart';
import 'package:hosptel_app/core/resources/word_manger.dart';
import 'package:hosptel_app/core/widget/empty_data/empty_text_widget.dart';
import 'package:hosptel_app/core/widget/pagination/list_view_pagination.dart';
import 'package:hosptel_app/features/reservation/domain/entities/req/create_appoinment_request.dart';
import 'package:hosptel_app/features/reservation/presentation/widgets/reservation_now/reservation_summary/choose_type_symptoms.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';
import 'package:hosptel_app/features/symptom/presentation/cubit/diagnosis_cubit.dart';
import 'package:hosptel_app/features/symptom/presentation/widgets/item_symptom_widget.dart';

class SymptomLitsItem extends StatelessWidget {
  const SymptomLitsItem({super.key, required this.request});
  final CreateAppoinmentRequest request;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllSymptomCubit, GetAllSymptomState>(
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
              visible: state.itemsList.isNotEmpty,
              replacement: Padding(
                padding: EdgeInsets.symmetric(vertical: 75.h),
                child: const EmptyTextWidget(
                  text: AppWordManger.noSymptomsAvailableAtThisTime,
                ),
              ),
              child: Expanded(
                child: ListViewWithPagenationWidget<SymptomItem>(
                  haseReachedMax: state.haseReachedMax,
                  item: state.itemsList,
                  padding: EdgeInsets.symmetric(vertical: 17.h),
                  shrinkWrap: true,
                  loading: state.status == DeafultBlocStatus.loading,
                  reFrach: state.isRefresh,
                  scrollDirection: Axis.vertical,
                  childListView: (item, index) {
                    return SymptomItemWidget(
                      item: item,
                    );
                  },
                  onNotification: (paginationEntite) {
                    context
                        .read<GetAllSymptomCubit>()
                        .getAllSymptom(paginationEntite: paginationEntite);
                  },
                ),
              ),
            ),
            Visibility(
              visible: state.itemsList.isNotEmpty,
              child: ButtonDoneAndCancle(
                isShow: state.itemsList.isNotEmpty,
                onTapForDone: () {
                  state.addSymptom.clear();
                  for (var element in state.itemsList) {
                    if (element.select == true) {
                      context.read<GetAllSymptomCubit>().addIteamSymptom(
                            iteam: SymptomItem(
                              id: element.id,
                              name: element.name,
                            ),
                          );
                    }
                  }

                  request.appointmentSymptoms = List.from(state.addSymptom);
                  context.read<GetAllSymptomCubit>().visibile();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
