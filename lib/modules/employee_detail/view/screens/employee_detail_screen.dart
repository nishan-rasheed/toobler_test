import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toobler_test/utils/constants/app_colors.dart';
import 'package:toobler_test/utils/constants/app_textstyle.dart';
import 'package:toobler_test/widgets/common_text.dart';

import '../../../home/model/employee_model.dart';
import '../widgets/detail_tile_widget.dart';

class EmployeeDetailScreen extends StatelessWidget {
  const EmployeeDetailScreen({Key? key, required this.item, }) : super(key: key);

  final EmployeeModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(centerTitle: true,title: CommonText(text: 'Details',
    textStyle: AppTextStyles.headingStyle,
    ),),
    body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.verticalSpace,
          Center(child: CircleAvatar(radius: 40.r,
          backgroundColor: AppColor.activeColor,
          child:const Icon(Icons.person,color: AppColor.cWhite,),
          )),
          30.verticalSpace,
          CommonText(text: 'Personal Details',
          textStyle: AppTextStyles.labelLarge,
          ),
          10.verticalSpace,
          DetailTileWidget(title: 'Name',text: item.name??'',),
          DetailTileWidget(title: 'User name',text: item.username??'',),
          DetailTileWidget(title: 'Email',text: item.email??'',),
          DetailTileWidget(title: 'Phone',text:item.phone??'',),
          DetailTileWidget(title: 'Website',text:item.website??'',),
          DetailTileWidget(title: 'Company',text:item.company?.name??'',),

          20.verticalSpace,

           CommonText(text: 'Address Information',
          textStyle: AppTextStyles.labelLarge,
          ),
          10.verticalSpace,
          DetailTileWidget(title: 'Street',text: item.address?.street??'',),
          DetailTileWidget(title: 'Suite',text: item.address?.suite??'',),
          DetailTileWidget(title: 'City',text: item.address?.city??'',),
          DetailTileWidget(title: 'zipcode',text: item.address?.zipcode??'',),
        ],
      ),
    ),
    );
  }
}

