

import 'package:get/get.dart';
import 'package:getxpro/screen_booking.dart';
import 'package:getxpro/screen_login.dart';

import 'screen_home.dart';

class RoutesList{
  static final routes =[
   
        GetPage(name: '/home', page: () => ScreenHome()),
                GetPage(name: '/login', page: () => ScreenLogin()),
                                


  ];
}