import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
 import 'package:maps/app/data/colors.dart';
import 'package:maps/app/data/getx_pages.dart';
import 'package:maps/app/data/globale_controller.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/services/locale_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorageService.init();
  Get.put(GlobalController(), permanent: true);
  // loc screen Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return ScreenUtilInit(
      // design scree dimension
      designSize: const Size(414, 944),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData.light(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.primary
            ),
            textTheme: ThemeData.light().textTheme.apply(
                fontFamily: "Roboto", fontSizeFactor: 1),
          ),
          builder: (context, widget) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: 1,
              ),
              child: widget!,
            );
          },
          title: "maps",
          initialRoute: AppRoutes.splashScreen,
          getPages: [
            ...GetPagesProvider.getPages,
          ],
          debugShowCheckedModeBanner: false,
          locale: Locale("en"),
        );
      },
    );
  }
}
