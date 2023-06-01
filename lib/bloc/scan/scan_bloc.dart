import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_scanner/api/barcode_repository.dart';
import 'package:ticket_scanner/model/barcode_status/barcode_status.dart';
import 'package:ticket_scanner/model/screening/screening.dart';

part 'scan_bloc.freezed.dart';

part 'scan_event.dart';

part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  final _barcodeRepository = BarcodeRepository();
  final audioPlayer = AudioPlayer();

  ScanBloc(Screening screening) : super(ScanState(screening: screening, isLoading: false)) {
    on<ScanEvent>(
      (event, emit) => event.map(
        checkBarcode: (value) => _checkBarcode(event.barcode, emit),
      ),
    );
  }

  void _checkBarcode(String barcode, Emitter<ScanState> emit) async {
    emit(state.copyWith(isLoading: true, barcode: barcode, barcodeStatus: null));
    final barcodeStatus = await _barcodeRepository.checkBarcode(screeningId: state.screening.id, barcode: barcode);
    await Future.delayed(Duration(seconds: 5));
    barcodeStatus.status.when(
      ok: () => audioPlayer.play(AssetSource('sounds/success.mp3')),
      error: () => audioPlayer.play(AssetSource('sounds/failed.mp3')),
      warning: () {},
    );
    emit(state.copyWith(isLoading: false, barcodeStatus: barcodeStatus));
  }
}
