import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/notification_cubit/notification_state.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/widgets/notification_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/widgets/notification_page_skeleton.dart';

class NotificationPage extends BaseStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState
    extends BaseStatefulWidgetState<NotificationPage, NotificationCubit> {

  @override
  void initState() {
    postFrameCallback(() {
      context.read<NotificationCubit>().getNotification();
    });
    super.initState();
  }


  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      title: context.getStrings.notifications,
      hasBackButton: true,
      onPressBack: (){
        Navigator.pop(context);
      },
    );
  }
  

  @override
  Widget body(BuildContext context) {
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
