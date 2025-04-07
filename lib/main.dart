import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package
import 'package:shop_app/components/add_to_cart_provider.dart';
import 'package:shop_app/components/favorite_provider.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()), // CartProvider
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), // FavoriteProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Flutter Way - Template',
        theme: AppTheme.lightTheme(context),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
