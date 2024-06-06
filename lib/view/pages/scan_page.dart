import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_scanner/bloc/scan/scan_bloc.dart';
import 'package:ticket_scanner/view/widgets/barcode_status/barcode_status_benefit_widget.dart';
import 'package:ticket_scanner/view/widgets/barcode_status/barcode_status_loading_widget.dart';
import 'package:ticket_scanner/view/widgets/barcode_status/barcode_status_widget.dart';
import 'package:ticket_scanner/view/widgets/scan_widget.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ScanBloc>();

    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        final screening = state.screening;
        return Scaffold(
          appBar: AppBar(
            title: Text(screening.name),
          ),
          body: Stack(
            children: [
              ScanWidget(
                onDetected: (barcode) {
                  print(barcode);
                  bloc.add(ScanEvent.checkBarcode(barcode: barcode));
                }
              ),
              BlocBuilder<ScanBloc, ScanState>(
                builder: (context, state) {
                  if (state.barcodeStatus == null && state.isLoading == false) {
                    return const SizedBox();
                  }

                  if (state.isLoading) {
                    return BarcodeStatusLoadingWidget(barcode: state.barcode!);
                  }

                  return Column(
                    children: [
                      BarcodeStatusWidget(
                        barcodeStatus: state.barcodeStatus!,
                        barcode: state.barcode!,
                      ),
                      if (state.barcodeStatus!.benefit != null)
                        BarcodeStatusBenefitWidget(
                          benefit: state.barcodeStatus!.benefit!.displayString,
                        )
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
