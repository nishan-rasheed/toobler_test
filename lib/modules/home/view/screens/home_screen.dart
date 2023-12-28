import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toobler_test/modules/employee_detail/view/screens/employee_detail_screen.dart';
import 'package:toobler_test/modules/home/controller/home_controller.dart';
import 'package:toobler_test/modules/home/view/widgets/employee_widget.dart';
import 'package:toobler_test/modules/home/view/widgets/loading_builder_widget.dart';
import 'package:toobler_test/utils/constants/app_textstyle.dart';
import 'package:toobler_test/utils/constants/custom_print.dart';
import 'package:toobler_test/widgets/common_text.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import '../widgets/city_filter_widget.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

 

  @override
  Widget build(BuildContext context) {
    return 
    Consumer<HomeController>(
      builder: (context, homeValue, child) => 
      Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CommonText(text: 'Employees',
            textStyle: AppTextStyles.headingStyle,),
          ),
          body:CustomRefreshIndicator(
          onRefresh: () async{
          await homeValue.getAllEmployees();
         homeValue.chooseCity(0);
         _controller.jumpTo(0);
          },
          offsetToArmed: 150.h,
          builder: (BuildContext context, Widget child, IndicatorController controller) {
                return LoadingBuilderWidget(controller: controller, child: child);
          },
            child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10.h),
                  child:ListView(
                      children: [
                        SizedBox(
                          height: 40.h,
                          child: ListView.separated(
                            controller: _controller,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: homeValue.employeeCityList?.length??0,
                            separatorBuilder: (BuildContext context, int index) {
                              return 10.horizontalSpace;
                            },
                            itemBuilder: (BuildContext context, int index) {
                              var item = homeValue.employeeCityList?[index];
                              return InkWell(
                                onTap: () {
                                  homeValue.chooseCity(index);
                                  homeValue.filterEmployeeByCity(item??'');
                                  customPrint(item??'');
                                },
                                child: CityFilterWidget(city:item??'',index: index,));
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
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailScreen(item: item,),));
                              },
                              child: EmployeeWidget(item: item));
                          },
                        ),
                      ],
                    ),
                ),
          ),
             ),
    );
  }
}




