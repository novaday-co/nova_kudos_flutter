import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'file_state.freezed.dart';

abstract class BaseFileState {}

@freezed
class UploadFileState extends BaseFileState with _$UploadFileState {
  const factory UploadFileState.loading(double progress) = UploadingFileState;

  const factory UploadFileState.success() = SuccessUploadingFileState;

  const factory UploadFileState.failed(String? error) =
  FailedUploadingFileState;
}

@freezed
class DownloadFileState extends BaseFileState with _$DownloadFileState {
  const factory DownloadFileState.loading(double progress) = DownloadingFileState;

  const factory DownloadFileState.success() = SuccessDownloadingFileState;

  const factory DownloadFileState.failed(String? error) =
  FailedDownloadingFileState;
}

@freezed
class SelectImageFileState extends BaseFileState with _$SelectImageFileState {
  const factory SelectImageFileState.select(File imageFile) = SelectedImageFileState;
}
