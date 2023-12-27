import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:toobler_test/modules/home/controller/home_controller.dart';
import 'package:toobler_test/modules/home/model/employee_model.dart';
import 'package:toobler_test/modules/home/view/widgets/employee_widget.dart';
import 'package:toobler_test/utils/constants/app_colors.dart';
import 'package:toobler_test/utils/constants/app_textstyle.dart';
import 'package:toobler_test/utils/constants/custom_print.dart';
import 'package:toobler_test/widgets/common_text.dart';

import '../widgets/city_filter_widget.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> items = ['one', 'two', 'three', 'four', 'five'];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context,listen: false).getAllEmployees();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
  //   RefreshIndicator(
  // triggerMode: RefreshIndicatorTriggerMode.anywhere,
  // onRefresh: () async {
  //   await Future.delayed(Duration(milliseconds: 1500));
  //   customPrint('hshshsshshs');
  // },
  //     child:
       Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CommonText(text: 'Employees',
          textStyle: AppTextStyles.headingStyle,),
        ),
        body:Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: Consumer<HomeController>(
                builder: (context, homeValue, child) => 
                 ListView(
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: homeValue.employeeCityList.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return 10.horizontalSpace;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var item = homeValue.employeeCityList[index];
                          return InkWell(
                            onTap: () {
                              homeValue.chooseCity(index);
                              homeValue.filterEmployeeByCity(item);
                              customPrint(item);
                            },
                            child: CityFilterWidget(city:item,index: index,));
                        },
                      ),
                    ),
                    20.verticalSpace,
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: homeValue.employeeFilterList.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return 10.verticalSpace;
                      },
                      itemBuilder: (BuildContext context, int index) {
                        var item = homeValue.employeeFilterList[index];
                        return EmployeeWidget(item: item);
                      },
                    ),
                  ],
                ),
              ),
            ),
           );
    // );
  }
}


