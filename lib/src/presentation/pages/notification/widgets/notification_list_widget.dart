import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/notification/notification_model.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/widgets/notification_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/widgets/notification_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';

class NotificationListWidget extends StatefulWidget {
  const NotificationListWidget({Key? key}) : super(key: key);

  @override
  State<NotificationListWidget> createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {
  @override
  void initState() {
    postFrameCallback(() {
      context.read<NotificationCubit>().getNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      borderRadius: 16,
      backgroundColor: Colors.white,
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationRequestState) {
            return state.when(
              loading: () => const NotificationPageSkeleton(),
              success: (notifications) => ListView.builder(
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationItemWidget(
                    notificationModel: notifications[index],
                  );
                },
              ),
              failed: (error) => const SizedBox.shrink(),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
