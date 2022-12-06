import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

class WinnersListPageSkeleton extends StatelessWidget {
  const WinnersListPageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: 16,
      horizontalPadding: 12,
      verticalPadding: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SkeletonWidget.rectangular(width: 143, height: 16),
          const SizedBox(height: 24),
          Row(
            children: const [
              SkeletonWidget.circular(width: 24, height: 24),
              SizedBox(width: 8),
              SkeletonWidget.rectangular(width: 111, height: 16),
              Spacer(),
              SkeletonWidget.rectangular(width: 40, height: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              SkeletonWidget.circular(width: 24, height: 24),
              SizedBox(width: 8),
              SkeletonWidget.rectangular(width: 111, height: 16),
              Spacer(),
              SkeletonWidget.rectangular(width: 40, height: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              SkeletonWidget.circular(width: 24, height: 24),
              SizedBox(width: 8),
              SkeletonWidget.rectangular(width: 111, height: 16),
              Spacer(),
              SkeletonWidget.rectangular(width: 40, height: 16),
            ],
          ),

        ],
      ),
    );
  }
}
