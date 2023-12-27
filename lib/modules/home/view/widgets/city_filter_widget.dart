import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toobler_test/modules/home/controller/home_controller.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_textstyle.dart';
import '../../../../widgets/common_text.dart';

class CityFilterWidget extends StatelessWidget {
  const CityFilterWidget({
    super.key, required this.city, required this.index,
  });

 final String city;
 final int index;

  @override
  Widget build(BuildContext context) {
    return 
    Consumer<HomeController>(
      builder: (context, homeValue, child) => 
       Container(
        constraints: BoxConstraints(
          minWidth: 80.w
        ),
        // width: 100.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10.r),
          color:homeValue.selectedCityIndex==index?AppColor.activeColor:null
        ),
        child: CommonText(text: city,
        textStyle: AppTextStyles.labelMedium.copyWith(
          color: homeValue.selectedCityIndex==index?AppColor.cWhite:null
        ),
        ),
      ),
    );
  }
}