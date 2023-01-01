import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_state.freezed.dart';


abstract class FileState {}

class FileInitState extends FileState {}

@freezed
class UploadFileState extends FileState {
  const factory UploadFileState.loading(int progress) = UploadingFileState;

  const factory UploadFileState.success() = SuccessUploadingFileState;

  const factory UploadFileState.failed(String? error) =
  FailedUploadingRequestState;
}
