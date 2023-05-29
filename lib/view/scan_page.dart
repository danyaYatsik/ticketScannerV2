import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/scan/scan_bloc.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        final screening = state.screening;
        return Scaffold(
          appBar: AppBar(
            title: Text(screening.name),
          ),
          body: const Placeholder(),
        );
      },
    );
  }
}
