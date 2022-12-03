import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class RowMembersPictures extends StatefulWidget {
  final List<String> images;
  final int length;
  final double itemWidth;
  final double itemHeight;

  const RowMembersPictures({
    Key? key,
    required this.images,
    required this.length,
    this.itemWidth = 24,
    this.itemHeight = 24,
  }) : super(key: key);

  @override
  State<RowMembersPictures> createState() => _RowMembersPicturesState();
}

class _RowMembersPicturesState extends State<RowMembersPictures> with AutomaticKeepAliveClientMixin {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startAnimation = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: widget.itemHeight,
      child: Stack(
        alignment: Alignment.centerRight,
        children: list(context),
      ),
    );
  }

  List<Widget> list(BuildContext context) {
    List<Widget> list = [];
    if (widget.images.length > widget.length) {
      list.add(
        AnimatedPositioned(
          duration: Duration(milliseconds: widget.length * 300),
          right: startAnimation ? widget.length * (widget.itemWidth * .72) : 0,
          child: Container(
            height: widget.itemWidth,
            width: widget.itemWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            child: Center(
              child: TextWidget.semiBold(
                "${widget.images.length - widget.length}+",
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
    for (int index = widget.length - 1; index >= 0; index--) {
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
