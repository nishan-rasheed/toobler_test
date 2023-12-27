import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toobler_test/modules/home/controller/home_controller.dart';
import 'package:toobler_test/modules/home/view/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:toobler_test/utils/constants/app_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController(),)
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context,_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.cWhite,
              appBarTheme:const AppBarTheme(
                backgroundColor: AppColor.appBarColor
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:  HomeScreen(),
          );
        }
      ),
    );
  }
}

