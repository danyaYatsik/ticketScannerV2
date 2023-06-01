import 'package:flutter/material.dart';

class BarcodeStatusBenefitWidget extends StatelessWidget {
  final String benefit;

  const BarcodeStatusBenefitWidget({required this.benefit, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        title: const Text('Пiльга:'),
        subtitle: Text(benefit),
        trailing: const Icon(Icons.info_outline),
      ),
    );
  }
}
