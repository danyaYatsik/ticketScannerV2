import 'package:flutter/material.dart';
import 'package:ticket_scanner/model/screening/screening.dart';

class ScreeningWidget extends StatelessWidget {
  final Screening screening;

  const ScreeningWidget(this.screening, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          screening.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          screening.description,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}
