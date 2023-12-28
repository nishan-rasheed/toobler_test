import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_textstyle.dart';
import '../../../../widgets/common_text.dart';
import '../../model/employee_model.dart';

class EmployeeWidget extends StatelessWidget {
  const EmployeeWidget({
    super.key,
    required this.item,
  });

  final EmployeeModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.cWhite,
        boxShadow: const[
          BoxShadow(
            color: AppColor.backgroundColor,
            spreadRadius: 2,blurRadius: 2
          )
        ]

      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(text:item.name??'',
              textStyle: AppTextStyles.labelLarge,
              ),
              CommonText(text:item.address?.city??'',
              textStyle: AppTextStyles.labelMedium,
              ),
              CommonText(text:item.address?.street ??'',
              textStyle: AppTextStyles.labelMedium,
              ),
            ],
          ),

          CommonText(text: item.phone??'',
          textStyle: AppTextStyles.labelSmallGrey,
          )
        ],
      ),
      );
  }
}
