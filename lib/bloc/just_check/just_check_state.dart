import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ticket_scanner/model/just_check_result.dart';

part 'just_check_state.freezed.dart';

@freezed
class JustCheckState with _$JustCheckState {
  const factory JustCheckState({
    required bool isLoading,
    String? barcode,
    JustCheckResult? result,
  }) = _JustCheckState;

  factory JustCheckState.initial() => const JustCheckState(isLoading: false);
}
