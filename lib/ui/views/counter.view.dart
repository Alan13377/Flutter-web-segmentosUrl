import 'package:flutter/material.dart';
import 'package:flutter_bases/ui/widgets/custom_icon_button.dart';
import 'package:flutter_bases/ui/widgets/custom_menu.dart';

class CounterView extends StatefulWidget {
  //**Obtener el valor del parametro */
  final String base;
  const CounterView({super.key, required this.base});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 1;

  //**Asignar el valor del parametro */
  @override
  void initState() {
    //*Verificar si se puede parsear el numero
    if (int.tryParse(widget.base) != null) {
      counter = int.parse(widget.base);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Contador StateFul",
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Contador : $counter",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //*Custom Button
            CustomIconButton(
              onPressed: (() => setState(() {
                    counter = counter + 1;
                  })),
              icon: Icons.add,
              backgroundColor: Colors.greenAccent,
              color: Colors.white,
            ),
            const SizedBox(
              width: 30,
            ),
            //*CustomButton
            CustomIconButton(
              onPressed: (() => setState(() {
                    counter = counter - 1;
                  })),
              icon: Icons.remove,
              backgroundColor: Colors.redAccent,
              color: Colors.white,
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
