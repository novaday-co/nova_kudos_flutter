import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

class ShopPageSkeleton extends StatelessWidget {
  const ShopPageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 155,
      ),
      itemBuilder: (context, index) =>
           SkeletonWidget.rectangular(width: context.screenWidth, height: 155),
    );
  }
}
