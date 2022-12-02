import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/notification/notification_model.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItemWidget({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          ImageLoaderWidget.fromNetwork(
            imageUrl: notificationModel.userProfile ?? '',
            width: 32,
            height: 32,
            boxShape: BoxShape.circle,
          ),
          const SizedBox(width: 8),
          TextWidget.regular(
            notificationModel.text ?? '',
            context: context,
            additionalStyle: const TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 8),
          TextWidget.regular(
            notificationModel.diffTime ?? '',
            context: context,
            additionalStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
