import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toobler_test/modules/home/view/screens/home_screen.dart';
import 'package:toobler_test/utils/constants/app_colors.dart';

import '../../controller/home_controller.dart';

class SplashScreen extends StatefulWidget {
 const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


   @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1500),() {
     loadApi().whenComplete(() => 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomeScreen(),)),
      );
    } 
    );
   
    super.initState();
  }


  Future loadApi()async{
    await Provider.of<HomeController>(context,listen: false).getAllEmployees();
   
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColor.cWhite,
          backgroundColor: AppColor.activeColor,),),
    );
  }
}