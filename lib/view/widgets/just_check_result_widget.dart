import 'package:flutter/material.dart';

class JustCheckResultWidget extends StatelessWidget {
  final String barcode;

  const JustCheckResultWidget(this.barcode, {super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: ListTile(
        title: Text('Квиток: $barcode'),
        subtitle: const Text('Ok'),
        trailing: const Icon(Icons.check),
      ),
    );
  }
}
