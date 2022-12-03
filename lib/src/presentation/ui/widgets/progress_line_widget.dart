import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/string_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class ProgressLineWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final DateTime startTime;
  final DateTime endTime;
  final VoidCallback? onEnd;
  final String? title;

  const ProgressLineWidget({
    Key? key,
    required this.startTime,
    required this.endTime,
    this.height,
    this.width,
    this.backgroundColor,
    this.onEnd,
    this.title,
  }) : super(key: key);

  @override
  State<ProgressLineWidget> createState() => _ProgressLineWidgetState();
}

class _ProgressLineWidgetState extends State<ProgressLineWidget>
    with AutomaticKeepAliveClientMixin {
  ValueNotifier<double> progressWidth = ValueNotifier(0);
  Timer? timer;
  double width = 0;
  int durationSeconds = 0;
  double widthPerSecond = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      width =
          widget.width ?? (context.findRenderObject() as RenderBox).size.width;
      durationSeconds = widget.endTime.difference(widget.startTime).inSeconds;
      widthPerSecond = width / durationSeconds;
      progressWidth.value = widthPerSecond *
          DateTime.now().difference(widget.startTime).inSeconds;
      startTimer();
    });
  }

  void startTimer() {
    timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      int duration = widget.endTime.difference(DateTime.now()).inSeconds;
      if (duration == 0) {
        progressWidth.value += widthPerSecond;
        widget.onEnd?.call();
        timer.cancel();
      } else {
        progressWidth.value += widthPerSecond;
      }
    });
  }

  String get timeFormat {
    Duration timeDifference = widget.endTime.difference(DateTime.now());
    if (timeDifference.inDays != 0) {
      return "${timeDifference.inDays} ${context.getStrings.days}";
    } else {
      return "${"${timeDifference.inHours}".appendZeroPrefix}:${"${timeDifference.inMinutes % 60}".appendZeroPrefix}:${"${timeDifference.inSeconds % 60}".appendZeroPrefix}";
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Row(
          children: [
            TextWidget.regular(
              context.getStrings.remainingTime,
              context: context,
              additionalStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
              ),
            ),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: progressWidth,
              builder: (context, seconds, child) => TextWidget.regular(
                timeFormat,
                context: context,
                additionalStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color:
                  Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: widget.width,
              height: widget.height ?? 8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
            ValueListenableBuilder<double>(
              valueListenable: progressWidth,
              builder: (context, progress, child) {
                return AnimatedContainer(
                  width: progress,
                  height: (widget.height ?? 8) - 4,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: widget.backgroundColor ??
                        Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
