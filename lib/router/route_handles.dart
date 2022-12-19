import 'package:fluro/fluro.dart';
import 'package:flutter_bases/ui/views/counter.view.dart';
import 'package:flutter_bases/ui/views/counter_view_riverpod.dart';
import 'package:flutter_bases/ui/views/view_404.dart';

final counterHandler = Handler(
  handlerFunc: (context, parameters) {
    //**Obtener el valor del parametro */
    // print(parameters["base"]?[0]);

    //**Obtener el valor del parametro si es nullo valor por defecto de 5 */
    String? base = parameters["base"]?[0] ?? "5";

    return CounterView(
      base: base,
    );
  },
);

final riverpodHandler = Handler(handlerFunc: (context, parameters) {
  String? base = parameters["q"]?[0] ?? "10";
  return CounterRiverpodView(
    base: base,
  );
});

final dashboardUserHandler = Handler(handlerFunc: (context, parameters) {
  String? base = parameters["q"]?[0] ?? "10";
  print(parameters);
  return View404();
});

final pageNotFound = Handler(
  handlerFunc: (context, parameters) {
    return View404();
  },
);
