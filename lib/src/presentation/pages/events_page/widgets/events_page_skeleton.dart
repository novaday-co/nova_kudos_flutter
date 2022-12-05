import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

class EventsPageSkeleton extends StatelessWidget {
  const EventsPageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        height: 88,
        padding: const EdgeInsets.all(16),
        color: Theme.of(context).colorScheme.onBackground,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SkeletonWidget.rectangular(width: 111, height: 16),
                SkeletonWidget.rectangular(width: 40, height: 16),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: const [
                    SkeletonWidget.circular(width: 24, height: 24),
                    SizedBox(width: 4),
                    SkeletonWidget.rectangular(width: 40, height: 16),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 6 * (24 * .75),
                  height: 24,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: List.generate(
                      6,
                      (index) => Positioned(
                        right: index * (24 * .72),
                        child: const SkeletonWidget.circular(
                            width: 24, height: 24),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
