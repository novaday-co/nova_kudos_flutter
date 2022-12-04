import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/skeleton_widget.dart';

class MembersPageSkeletonLoading extends StatelessWidget {
  const MembersPageSkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: 15,
      child: ListView.separated(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SkeletonWidget.circular(
                width: 36,
                height: 36,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: SkeletonWidget.rectangular(
                  width: context.screenWidth,
                  height: 18,
                ),
              ),
            ],
          ),
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(
          color: Theme.of(context).colorScheme.outline,
          height: 0,
        ),
        itemCount: 20,
      ),
    );
  }
}
