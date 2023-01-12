import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/dart_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/loading_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class UploadImage<C extends FileCubit> extends StatefulWidget {
  final String? image;
  final Widget? tagWidget;
  final double? width;
  final double height;
  final BoxShape? shape;
  final Color? backgroundColor;
  final Alignment? tagAlignment;
  final Widget? nullImageWidget;

  const UploadImage({
    Key? key,
    this.image,
    this.tagWidget,
    this.width,
    required this.height,
    this.shape,
    this.tagAlignment,
    this.nullImageWidget,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState<C>();
}

class _UploadImageState<C extends FileCubit> extends State<UploadImage> {
  String? image;

  C get cubit => context.read<C>();

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, BaseFileState>(
      listenWhen: _listenWhenUploadState,
      listener: _listenToFileCubit,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BackgroundWidget(
            height: widget.height,
            width: widget.width,
            borderRadius: 16,
            shape: widget.shape,
            clipBehaviour: Clip.antiAlias,
            backgroundColor: widget.backgroundColor ?? Colors.transparent,
            onTap: () => cubit.selectImage(context),
            child: Stack(
              children: [
                imageView,
                BlocBuilder<C, BaseFileState>(
                  buildWhen: _buildWhenUploadingProgress,
                  builder: (context, state) {
                    return AnimatedCrossFade(
                      duration: const Duration(milliseconds: 600),
                      crossFadeState: state is UploadingFileState
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox(),
                      secondChild: StreamBuilder<double>(
                        initialData: 0,
                        stream: cubit.progressStream.stream,
                        builder: (context, progress) {
                          return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                height: (progress.data ?? 0) * widget.height,
                                alignment: Alignment.bottomCenter,
                                width: widget.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withOpacity(0.5),
                                  borderRadius:
                                      (widget.shape == BoxShape.circle)
                                          ? null
                                          : BorderRadius.circular(16),
                                ),
                              ),
                              Center(
                                child: Visibility(
                                  visible: progress.data != 1,
                                  replacement: const Loading(),
                                  child: TextWidget.medium(
                                    "${((progress.data ?? 0) * 100).toInt()}%",
                                    context: context,
                                    additionalStyle:
                                        const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: widget.tagAlignment ?? Alignment.bottomCenter,
            child: image == null ? null : widget.tagWidget,
          )
        ],
      ),
    );
  }

  Widget get imageView {
    if (widget.nullImageWidget != null && image == null) {
      return widget.nullImageWidget!;
    }
    return ImageLoaderWidget(
      imageUrl: image ?? "",
      width: widget.width,
      height: widget.height,
      boxShape: widget.shape ?? BoxShape.rectangle,
    );
  }

  bool _buildWhenUploadingProgress(
      BaseFileState previous, BaseFileState current) {
    return current is UploadFileState;
  }

  bool _listenWhenUploadState(BaseFileState previous, BaseFileState current) {
    return current is UploadFileState || current is SelectImageFileState;
  }

  void _listenToFileCubit(BuildContext context, BaseFileState state) {
    state.isA<SelectImageFileState>()?.when(
      select: (imageFile) {
        image = imageFile.path;
        setState(() {});
      },
    );
  }
}
