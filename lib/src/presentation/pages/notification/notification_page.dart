import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/notification/widgets/notification_list_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';

class NotificationPage extends BaseStatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context) {
    return const CustomAppbar(
      title: 'اطلاعیه ها',
      hasBackButton: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return const NotificationListWidget();
  }
}
