import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
part 'file_state.freezed.dart';

abstract class BaseFileState {}

@freezed
class UploadFileState extends BaseFileState {
  const factory UploadFileState.loading(double progress) = UploadingFileState;

  const factory UploadFileState.success() = SuccessUploadingFileState;

  const factory UploadFileState.failed(String? error) =
  FailedUploadingRequestState;
}
