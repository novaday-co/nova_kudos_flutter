import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/tag_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class UploadImage extends StatefulWidget {
  final String? image;
  final String uploadImageUrl;

  const UploadImage({
    Key? key,
    this.image,
    required this.uploadImageUrl,
  }) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  String? image;
  late FileCubit fileCubit;

  @override
  void initState() {
    image = widget.image;
    fileCubit = FileCubit(
      fileRepository: KiwiContainer().resolve()
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => fileCubit,
      child: BackgroundWidget(
        height: 80,
        width: context.screenWidth,
        borderRadius: 16,
        onTap: () {
          selectPicture();
        },
        child: image != null
            ? Stack(
                alignment: Alignment.center,
                children: [
                  ImageLoaderWidget(
                    imageUrl: image!,
                    boxFit: BoxFit.cover,
                    boxShape: BoxShape.rectangle,
                    width: 90,
                    height: 90,
                    imageType: imageType,
                    hasTag: true,
                    tagAlignment: Alignment.bottomRight,
                    tagWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: TagWidget.rectangle(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          value: context.getStrings.changePicture,
                          padding: 4,
                          textStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<FileCubit,FileState>(
                    builder: (context, state) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: context.screenWidth,
                        height: 80 * (100 - (state.isA<UploadingFileState>()?.progress ?? 0))/100,
                        color: Colors.black.withOpacity(0.1),
                      );
                    },
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    icon: Assets.iconGallery,
                    size: 24,
                    height: 24,
                    width: 24,
                    iconColor: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  const SizedBox(height: 4),
                  TagWidget.rectangle(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    value: context.getStrings.eventPicture,
                    padding: 4,
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
      ),
    );
  }

  ImageType get imageType {
    if (image!.startsWith("http")) {
      return ImageType.network;
    }
    return ImageType.file;
  }

  void selectPicture() async {
    final imagePath = await showAccessMediaPickerSheet(context);
    if (imagePath != null) {
      image = imagePath;
      String? filename = image?.split('/').last;
      setState(() {});
      FormData body = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(imagePath,filename: filename)
      });
      fileCubit.uploadFile(url: widget.uploadImageUrl, data: body);
    }
  }
}
