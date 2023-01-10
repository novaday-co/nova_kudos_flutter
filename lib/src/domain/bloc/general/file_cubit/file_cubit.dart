import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/base_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';

abstract class FileCubit extends BaseCubit<BaseFileState> {
  FileCubit(super.initialState);

  StreamController streamController = StreamController<int>();

  String parseFileName(File file) => file.path.split('/').last;

  Future<FormData> getFormData(Map<String, dynamic> data) async {
    Map<String, dynamic> fromData = {};
    fromData.forEach((key, value) async {
      if (value is File) {
        data.addEntries([
          MapEntry(
              key,
              await MultipartFile.fromFile(value.path,
                  filename: parseFileName(value)))
        ]);
      }
    });
    return FormData.fromMap(fromData);
  }

  Future<void> upload() async {}

  // Future<void> uploadFile(
  //     {required String url, CancelToken? cancelToken, data}) async {
  //   await safeCall(
  //     apiCall: fileRepository.upload(
  //       url: url,
  //       bodyParameters: data,
  //       cancelToken: cancelToken,
  //       onSendProgress: (count, total) {
  //         // print(((count / total)) * 100);
  //         emit(UploadFileState.loading((count / total) * 100));
  //       },
  //     ),
  //     onData: (result) {
  //       print("======================onData=========================");
  //       emit(const UploadFileState.success());
  //     },
  //     onError: (failedStatus, error) {
  //       print("======================error=========================");
  //       emit(UploadFileState.failed(error));
  //     },
  //   );
  // }

  Future<void> download() async {}

  @override
  Future<void> close() {
    streamController.close();
    return super.close();
  }
}
