import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_textstyle.dart';
import '../../../../widgets/common_text.dart';

class DetailTileWidget extends StatelessWidget {
  const DetailTileWidget({
    super.key, required this.title, required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 100.w,
            child: CommonText(text: title,
            textAlign: TextAlign.start,
            textStyle: AppTextStyles.labelMedium.copyWith(color: AppColor.textColorsGrey),
            ),
          ),
          Expanded(
            child: CommonText(text: text,
            textAlign: TextAlign.start,
            textStyle: AppTextStyles.labelMedium,
            ),
          ),
        ],
      ),
    );
  }
}