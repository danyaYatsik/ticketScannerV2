import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_bloc.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_event.dart';
import 'package:ticket_scanner/bloc/just_check/just_check_state.dart';
import 'package:ticket_scanner/view/widgets/barcode_status/barcode_status_loading_widget.dart';
import 'package:ticket_scanner/view/widgets/just_check_result_widget.dart';
import 'package:ticket_scanner/view/widgets/scan_widget.dart';

class JustCheckPage extends StatelessWidget {
  const JustCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<JustCheckBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Архiв вiйни'),
      ),
      body: Stack(
        children: [
          ScanWidget(
            onDetected: (barcode) => bloc.add(JustCheckEvent(barcode)),
          ),
          BlocBuilder<JustCheckBloc, JustCheckState>(
            builder: (context, state) {
              if (state.result == null && state.isLoading == false) {
                return const SizedBox();
              }

              if (state.isLoading) {
                return BarcodeStatusLoadingWidget(barcode: state.barcode!);
              }

              return JustCheckResultWidget(state.barcode!);
            },
          ),
        ],
      ),
    );
  }
}
