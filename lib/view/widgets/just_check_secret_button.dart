import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ticket_scanner/main.dart';

class SecretPageButton extends StatelessWidget {
  final Widget child;

  const SecretPageButton({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        SerialTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<SerialTapGestureRecognizer>(
            SerialTapGestureRecognizer.new, (SerialTapGestureRecognizer instance) {
          instance.onSerialTapDown = (SerialTapDownDetails details) {
            if (details.count == 3) Navigator.pushNamed(context, secretRoute);
          };
        })
      },

      child: child,
    );
  }
}
