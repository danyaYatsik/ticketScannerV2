import 'package:flutter/material.dart';

class BarcodeStatusLoadingWidget extends StatelessWidget {
  final String barcode;

  const BarcodeStatusLoadingWidget({required this.barcode, super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        title: Text('Квиток: $barcode'),
        subtitle: const Text('Перевiрка...'),
        trailing: const CircularProgressIndicator(),
        dense: true,
      ),
    );
  }
}
