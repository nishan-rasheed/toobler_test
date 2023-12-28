import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_assets.dart';

class LoadingBuilderWidget extends StatelessWidget {
  const LoadingBuilderWidget({
    super.key, required this.child, required this.controller,
  });

  final Widget child;
  final IndicatorController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: <Widget>[
        if (!controller.side.isNone)
       Image.asset(AppAssets.loadingImage,
       height: 150.h,width: 1.sw,
       fit: BoxFit.cover,
       ),
        Transform.translate(
          offset: Offset(0, 150.h*controller.value),
          child: child,
          )
         
      ],
    );
  }
}