import 'package:fluro/fluro.dart';
import 'package:flutter_bases/router/route_handles.dart';
import 'package:flutter_bases/ui/views/counter.view.dart';
import 'package:flutter_bases/ui/views/counter_view_riverpod.dart';
import 'package:flutter_bases/ui/views/view_404.dart';

class Flurorouter {
  static final router = FluroRouter();

  //*Rutas
  static void configureRoutes() {
    router.define(
      "/",
      handler: counterHandler,
      //transitionDuration: const Duration(milliseconds: 500),
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      "/stateful",
      handler: counterHandler,
      //transitionDuration: const Duration(milliseconds: 500),
      transitionType: TransitionType.fadeIn,
    );

    //*RUTAS CON PARAMETROS
    router.define(
      "/stateful/:base",
      handler: counterHandler,
      //transitionDuration: const Duration(milliseconds: 500),
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      "/riverpod",
      handler: riverpodHandler,
      //transitionDuration: const Duration(milliseconds: 500),
      transitionType: TransitionType.fadeIn,
    );
    /////////////////////////////////////////////////////////////////////////
    router.define(
      "/dashboard/users/:userid/:roleid",
      handler: dashboardUserHandler,
      //transitionDuration: const Duration(milliseconds: 500),
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = pageNotFound;
  }
}
