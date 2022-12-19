import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bases/providers/counter_provider.dart';
import 'package:flutter_bases/ui/widgets/custom_icon_button.dart';
import 'package:flutter_bases/ui/widgets/custom_menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//*Provider que regresa un estado 0
final contadorProvider = StateProvider((ref) {
  return 0;
});

class CounterRiverpodView extends ConsumerWidget {
  final String base;
  const CounterRiverpodView({
    super.key,
    required this.base,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contador = ref.watch(contadorProvider);
    final counter = ref.watch(counterProvider(base));
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Contador Riverpod",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          FittedBox(
            child: Text(
              "Contador State Notifier: $contador",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //*Riverpod Contador StateNotifier
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                onPressed: () {
                  //*leer el provider sin escucharlo
                  ref.read(contadorProvider.notifier).state++;
                },
                icon: Icons.add,
                backgroundColor: Colors.greenAccent,
                color: Colors.black,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomIconButton(
                onPressed: () {
                  ref.read(contadorProvider.notifier).state--;
                },
                icon: Icons.remove,
                backgroundColor: Colors.redAccent,
                color: Colors.black,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          const SizedBox(
            height: 20,
          ),
          //*Contador Riverpod ChangeNotifier
          FittedBox(
            child: Text(
              "Contador ChangeNotifier: ${counter.counter}",
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIconButton(
                onPressed: counter.increment,
                icon: Icons.add,
                backgroundColor: Colors.blueAccent,
                color: Colors.black,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomIconButton(
                onPressed: counter.decrement,
                icon: Icons.remove,
                backgroundColor: Colors.orangeAccent,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
