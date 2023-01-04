import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/domain/repository/file_repository/file_repository.dart';

class FileCubit extends BaseCubit<FileState> {
  final FileRepository fileRepository;

  FileCubit({
    required this.fileRepository,
  }) : super(FileInitState());

  Future<void> uploadFile(
      {required String url, CancelToken? cancelToken,data}) async {
    await safeCall(
      apiCall:  fileRepository.upload(
        url: url,
        bodyParameters: data,
        cancelToken: cancelToken,
        onSendProgress: (count, total) {
          // print(((count / total)) * 100);
          emit(UploadFileState.loading((count / total) * 100));
        },
      ),
      onData: (status, result) {
        print("======================onData=========================");
        emit(const UploadFileState.success());
      },
      onError: (error) {
        print("======================error=========================");
        emit(UploadFileState.failed(error));
      },
    );
  }
}
