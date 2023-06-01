import 'package:flutter/material.dart';
import 'package:ticket_scanner/view/widgets/scan_widget.dart';

class JustCheckPage extends StatelessWidget {
  const JustCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Просто чек'),
      ),
      body: ScanWidget(),
    );
  }
}
