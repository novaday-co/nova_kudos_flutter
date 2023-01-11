import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/file_repository/file_repository.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';

abstract class FileCubit<S extends BaseFileState>
    extends BaseCubit<BaseFileState> {
  FileRepository fileRepository = KiwiContainer().resolve<FileRepository>();

  FileCubit(super.initialState);

  StreamController<double> progressStream = StreamController<double>();

  String parseFileName(File file) {
    return file.path.split('/').last;
  }

  void onSendProgress(int count, int total) {
    progressStream.sink.add(count / total);
  }

  void selectImage(BuildContext context) async {
    if (state is! UploadingFileState) {
      final imagePath = await showAccessMediaPickerSheet(context);
      if (imagePath != null) {
        emit(SelectImageFileState.select(File(imagePath)));
      }
    }
  }

  Future<void> upload(File file) async {}

  Future<void> download() async {}

  emitDownloading() {
    progressStream = StreamController<double>();
    emit(const DownloadFileState.loading(0));
  }

  emitUploading() {
    progressStream = StreamController<double>();
    emit(const UploadFileState.loading(0));
  }

  emitSuccessDownloading() {
    emit(const DownloadFileState.success());
  }

  emitSuccessUploading() {
    emit(const UploadFileState.success());
  }

  emitFailedDownloading(String? error) {
    emit(DownloadFileState.failed(error));
  }

  emitFailedUploading(String? error) {
    emit(UploadFileState.failed(error));
  }

  @override
  Future<void> close() {
    progressStream.close();
    return super.close();
  }
}
