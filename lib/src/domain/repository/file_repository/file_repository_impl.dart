import 'dart:io';

import 'package:dio/src/cancel_token.dart';
import 'package:dio/src/options.dart';
import 'package:nova_kudos_flutter/src/data/api/file/file_api.dart';
import 'package:nova_kudos_flutter/src/data/entity/api_response.dart';
import 'package:nova_kudos_flutter/src/data/mapper/api_response_to_result_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/result_model.dart';
import 'package:nova_kudos_flutter/src/domain/repository/file_repository/file_repository.dart';
import 'package:path_provider/path_provider.dart';

class FileRepositoryImpl extends FileRepository {
  final FileApi fileApi;

  FileRepositoryImpl({required this.fileApi});

  @override
  Future<ResultModel> download({
    required String url,
    String? savePath,
    Map<String, dynamic>? queryParameter,
    Map<String, dynamic>? headerParameters,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    Directory tempDir = await getTemporaryDirectory();

    String fileName = url.split("/").last;

    final path = "${tempDir.path}/$fileName";
    if (File(savePath ?? path).existsSync()) {
      return ApiToResultMapper.mapTo<String>(
          response: ApiResponse(data: savePath ?? path, statusCode: 200),
          dataMapper: () => savePath ?? path);
    }

    final response = await fileApi.downloadFile(
      path: url,
      savePath: savePath ?? path,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      headerParameters: headerParameters,
      queryParameter: queryParameter,
    );

    if (response.isSuccess == false) {
      File(path).delete();
    }

    return ApiToResultMapper.mapTo<String>(
      response: response,
      dataMapper: () => response.data,
    );
  }

  @override
  Future<ResultModel> upload(
      {required String url,
      bodyParameters,
      Map<String, dynamic>? queryParameter,
      Map<String, dynamic>? headerParameters,
      ProgressCallback? onSendProgress,
      CancelToken? cancelToken}) async {
    final response = await fileApi.uploadFile(
      path: url,
      bodyParameters: bodyParameters,
      queryParameter: queryParameter,
      headerParameters: headerParameters,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
    return ApiToResultMapper.mapTo(
      response: response,
      dataMapper: () => response.data,
    );
  }
}
