import 'package:flutter/material.dart';
import 'package:random_number_generator/screen/home_screen.dart';
import 'package:random_number_generator/screen/nvg_home_screen.dart';
import 'package:random_number_generator/screen/route_one_screen.dart';
import 'package:random_number_generator/screen/route_two_screen.dart';
import 'package:random_number_generator/screen/route_three_screen.dart';

const HOME_Route = "/";
const Route_Three = "/three";

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      HOME_Route: (context) => NvgHomeScreen(),
      "/one": (context) => RouteOneScreen(),
      "/two": (context) => RouteTwoScreen(),
      "/three": (context) => RouteThreeScreen(),
    },
    )
  );
}
