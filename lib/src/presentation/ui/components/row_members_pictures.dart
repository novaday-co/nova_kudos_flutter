import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowMembersPictures extends StatefulWidget {
  final List<String> images;
  final int maxLength;
  final double itemWidth;
  final double itemHeight;

  const RowMembersPictures({
    Key? key,
    required this.images,
    required this.maxLength,
    this.itemWidth = 24,
    this.itemHeight = 24,
  }) : super(key: key);

  @override
  State<RowMembersPictures> createState() => _RowMembersPicturesState();
}

class _RowMembersPicturesState extends State<RowMembersPictures>
    with AutomaticKeepAliveClientMixin {
  bool startAnimation = false;
  int length = 0;

  @override
  void initState() {
    super.initState();
    if (widget.maxLength > widget.images.length) {
      length = widget.images.length;
    } else {
      length = widget.maxLength;
    }
    postFrameCallback(() {
      startAnimation = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: widget.itemHeight,
      width: (length + 1) * (widget.itemWidth * .75),
      child: Stack(
        alignment: Alignment.centerRight,
        children: list(context),
      ),
    );
  }

  List<Widget> list(BuildContext context) {
    List<Widget> list = [];
    if (widget.images.length > length) {
      list.add(
        AnimatedPositioned(
          duration: Duration(milliseconds: length * 300),
          right:
              startAnimation ? length * (widget.itemWidth * .72) : 0,
          child: Container(
            height: widget.itemWidth,
            width: widget.itemWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Center(
              child: TextWidget.semiBold(
                "${widget.images.length - length}+",
                context: context,
                additionalStyle: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      );
    }
    for (int index = length - 1; index >= 0; index--) {
      list.add(
        AnimatedPositioned(
          duration: Duration(milliseconds: index * 300),
          right: startAnimation ? index * (widget.itemWidth * .7) : 0,
          child: ImageLoaderWidget.fromNetwork(
            imageUrl: widget.images[index],
            height: widget.itemWidth,
            width: widget.itemWidth,
            boxShape: BoxShape.circle,
          ),
        ),
      );
    }
    return list;
  }

  @override
  bool get wantKeepAlive => true;
}
