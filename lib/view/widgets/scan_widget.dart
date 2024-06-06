import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ticket_scanner/view/widgets/handly_barcode_input.dart';

class ScanWidget extends StatelessWidget {
  final scannerController = MobileScannerController(
    formats: [BarcodeFormat.code128, BarcodeFormat.ean8],
    detectionTimeoutMs: 5000,
  );
  final void Function(String)? onDetected;

  ScanWidget({this.onDetected, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: MobileScanner(
            controller: scannerController,
            onDetect: (barcodes) {
              final barcode = barcodes.barcodes.first.rawValue;
              if (barcode != null && onDetected != null) {
                onDetected!(barcode);
              }
            },
          ),
        ),
        HandlyBarcodeInput(onSubmit: onDetected),
      ],
    );
  }
}
