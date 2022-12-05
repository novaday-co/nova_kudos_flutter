import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/progress_line_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class PullItemWidget extends StatelessWidget {
  final PullModel pull;
  final int index;
  final VoidCallback onEnd;
  final Color? backgroundColor;
  final bool enableAction;
  final VoidCallback? onDelete;

  const PullItemWidget({
    Key? key,
    required this.pull,
    required this.index,
    required this.onEnd,
    this.onDelete,
    this.backgroundColor,
    this.enableAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      direction: Axis.horizontal,
      closeOnScroll: true,
      enabled: enableAction,
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.18,
        dragDismissible: false,
        children: [
          SlidableAction(
            onPressed: (_) {
              onDelete?.call();
            },
            icon: Icons.delete_outline_sharp,
            foregroundColor: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(16),
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            flex: 1,
          ),
        ],
      ),
      child: BackgroundWidget(
        height: 80,
        backgroundColor:
            backgroundColor ?? context.getColorByIndex(index).withOpacity(0.1),
        borderRadius: 15,
        verticalPadding: 8,
        horizontalPadding: 16,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextWidget.semiBold(
                    pull.title ?? "",
                    context: context,
                    additionalStyle: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Visibility(
                  visible: pull.selectedOption != null,
                  child: TextWidget.medium(
                    sprintf(
                      context.getStrings.phYourVote,
                      [pull.selectedOption],
                    ),
                    context: context,
                    additionalStyle: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProgressTimeLineWidget(
                      startTime:
                          DateTime.now().subtract(const Duration(seconds: 30)),
                      endTime: DateTime.now().add(const Duration(seconds: 120)),
                      onEnd: onEnd,
                      backgroundColor: context.getColorByIndex(index),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextWidget.medium(
                      sprintf(
                        context.getStrings.phPersonContributors,
                        [pull.contributors],
                      ),
                      context: context,
                      textAlign: TextAlign.end,
                      additionalStyle: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
