import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/constants/app_colors.dart';

class CustomAlerts {

  
  static customAlert(String text,){
   Fluttertoast.showToast(msg: text,
   backgroundColor: AppColor.activeColor,
   fontSize: 15.h
   );
  }

 
}
