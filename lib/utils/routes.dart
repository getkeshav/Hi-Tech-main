import 'package:firebase_auth/firebase_auth.dart';

class MyRoutes{
   static String loginRoute = "/login";  // using static we don't need to initialize 
   //the object again and again to access it, also it only takes memory one time
   static String homeRoute = "/home";
   static String homeDetailsRoute = "/detail";
   static String CartRoute ="/cart";
}

