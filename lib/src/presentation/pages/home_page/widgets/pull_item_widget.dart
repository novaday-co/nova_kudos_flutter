import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/progress_line_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class PullItemWidget extends StatelessWidget {
  final Pull pull;
  final int index;
  final VoidCallback onEnd;

  const PullItemWidget({
    Key? key,
    required this.pull,
    required this.index,
    required this.onEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      height: 80,
      backgroundColor: context.getColorByIndex(index).withOpacity(0.1),
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
                  "${context.getStrings.yourChoice} ${pull.selectedOption}",
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
                  child: ProgressLineWidget(
                    startTime: DateTime.now(),
                    endTime:
                        DateTime.now().add(const Duration(seconds: 60)),
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
                    "${pull.contributors} ${context.getStrings.personContributors}",
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
    );
  }
}
