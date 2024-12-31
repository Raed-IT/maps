import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:maps/app/data/routes.dart';
import 'package:maps/app/pages/home_screen/home_screen.dart';
import 'package:maps/app/pages/home_screen/home_screen_binding.dart';

class HomePage extends GetPage {
  HomePage()
      : super(
          name: AppRoutes.homeScreen,
          page: () => HomeScreen(),
          binding: HomeScreenBinding(),
        );
}
