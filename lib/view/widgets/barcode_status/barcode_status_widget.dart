import 'package:flutter/material.dart';
import 'package:ticket_scanner/model/barcode_status/barcode_status.dart';

class BarcodeStatusWidget extends StatelessWidget {
  final BarcodeStatus barcodeStatus;
  final String barcode;

  const BarcodeStatusWidget({
    required this.barcodeStatus,
    required this.barcode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ColoredBox(
      color: barcodeStatus.status.displayColor,
      child: ListTile(
        title: Text('Квиток: $barcode'),
        subtitle: Text(barcodeStatus.description),
        trailing: Icon(barcodeStatus.status.icon),
      ),
    );
  }
}
