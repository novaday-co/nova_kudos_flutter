import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class MemberItemWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback onPress;
  final VoidCallback onLongPress;

  const MemberItemWidget({
    Key? key,
    required this.user,
    required this.onPress,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      borderRadius: 0,
      verticalPadding: 8,
      horizontalPadding: 8,
      onTap: onPress,
      onLongPress: onLongPress,
      child: Row(
        children: [
          ImageLoaderWidget.fromNetwork(
            imageUrl: user.image ?? "",
            boxShape: BoxShape.circle,
            height: 36,
            width: 36,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: TextWidget.medium(
              user.name ?? "",
              context: context,
              additionalStyle: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
