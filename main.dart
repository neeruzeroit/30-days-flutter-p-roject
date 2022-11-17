import 'package:flutter/material.dart';
import 'package:flutter_new_app/core/store.dart';
import 'package:flutter_new_app/pages/cart_page.dart';
import 'package:flutter_new_app/pages/login_page.dart';
import 'package:flutter_new_app/pages/utilies/routes.dart';
import 'package:flutter_new_app/pages/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';

void main() {
  runApp(VxState(
    store: MyStore(cart: 'CartModel()', catalog: 'CatalogModel()'),
     child: const MyApp(),
     ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
