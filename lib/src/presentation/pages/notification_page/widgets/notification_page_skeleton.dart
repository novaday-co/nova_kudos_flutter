import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';
import 'package:skeleton_text/skeleton_text.dart';

class NotificationPageSkeleton extends StatelessWidget {
  const NotificationPageSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Colors.white,
      borderRadius: 16,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                SkeletonWidget.circular(width: 36, height: 36),
                SizedBox(width: 8),
                SkeletonWidget.rectangular(width: 193, height: 17),
                SizedBox(width: 8),
                SkeletonWidget.rectangular(width: 35, height: 13),
              ],
            ),
          );
        },
      ),
    );
  }
}
