import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticket_scanner/preferences.dart';

class SecretPage extends StatelessWidget {
  const SecretPage({super.key});

  @override
  Widget build(BuildContext context) {
    final uuid = Preferences().provideUuid();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Secret Page'),
        ),
        body: GestureDetector(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: uuid));
            scaffoldMessenger.showSnackBar(const SnackBar(
              content: Text("UUID copied to clipboard!"),
            ));
          },
          child: Text('Installation UUID: $uuid'),
        ));
  }
}
