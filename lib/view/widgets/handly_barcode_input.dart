import 'package:flutter/material.dart';

class HandlyBarcodeInput extends StatelessWidget {
  final textController = TextEditingController();
  final void Function(String)? onSubmit;

  HandlyBarcodeInput({super.key, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                    border: OutlineInputBorder(),
                  ),
                  controller: textController,
                ),
              ),
              const SizedBox(width: 5),
              MaterialButton(
                color: Colors.grey[400],
                onPressed: () {
                  if (onSubmit != null) {
                    onSubmit!(textController.text);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Надiслати'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
