import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hosptel_app/core/resources/color_manger.dart';
import 'package:hosptel_app/core/resources/font_manger.dart';
import 'package:hosptel_app/core/widget/text_utiles/text_utile_widget.dart';
import 'package:hosptel_app/features/symptom/domain/entities/res/symptom_entitie.dart';
import 'package:hosptel_app/features/symptom/presentation/cubit/diagnosis_cubit.dart';

class SymptomItemWidget extends StatelessWidget {
  const SymptomItemWidget({super.key, required this.item});
  final SymptomItem item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.w,
          child: TextUtiels(
            text: item.name,
            fontFamily: AppFontFamily.tajawalMedium,
            fontSize: 14.sp,
            color: item.select
                ? AppColorManger.primaryColor
                : AppColorManger.colorGrayLight,
          ),
        ),
        Checkbox(
          value: item.select,
          onChanged: (value) {
            item.select = value ?? false;
            context.read<GetAllSymptomCubit>().changeCheck();
          },
        ),
      ],
    );
  }
}
