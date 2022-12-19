import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bases/locator.dart';

import 'package:flutter_bases/router/router.dart';
import 'package:flutter_bases/services/navigation_services.dart';
import 'package:flutter_bases/ui/layout/main_layout_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setupLocator();
  //*Configurar rutas
  Flurorouter.configureRoutes();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // routes: {
      //   "/stateful": (context) => const CounterPage(),
      //   "/riverpod": (context) => const CounterRiverpodPage(),
      // },
      //onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (context, child) {
        return MainLayoutPage(
          child: child ?? CircularProgressIndicator(),
        );
      },
    );
  }
}
