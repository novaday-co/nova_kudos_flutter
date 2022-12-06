import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

class ProfilePageSkeleton extends StatelessWidget {
  const ProfilePageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SkeletonWidget.circular(
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonWidget.rectangular(
                        width: context.screenWidth, height: 17),
                    const SizedBox(height: 10),
                    const SkeletonWidget.rectangular(width: 100, height: 13)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
          const SkeletonWidget.rectangular(width: 100, height: 17),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  SkeletonWidget.circular(
                    width: 96,
                    height: 96,
                  ),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 50, height: 17),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 30, height: 14),
                ],
              ),
              Column(
                children: const [
                  SkeletonWidget.circular(
                    width: 96,
                    height: 96,
                  ),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 50, height: 17),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 30, height: 14),
                ],
              ),
              Column(
                children: const [
                  SkeletonWidget.circular(
                    width: 96,
                    height: 96,
                  ),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 50, height: 17),
                  SizedBox(height: 4),
                  SkeletonWidget.rectangular(width: 30, height: 14),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SkeletonWidget.rectangular(width: 75, height: 13),
                      SkeletonWidget.rectangular(width: 90, height: 13),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemCount: 8)
        ],
      ),
    );
  }
}
