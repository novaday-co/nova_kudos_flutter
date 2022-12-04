import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class MemberInfoBottomSheet extends StatelessWidget {
  final UserModel userModel;
  final VoidCallback onTapAdmin;
  final VoidCallback onTapSendGift;
  final VoidCallback onTapDelete;

  const MemberInfoBottomSheet({
    Key? key,
    required this.userModel, required this.onTapAdmin, required this.onTapSendGift, required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              TextWidget.bold(
                userModel.name ?? "",
                context: context,
                additionalStyle: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              ImageLoaderWidget.fromNetwork(
                imageUrl: userModel.image ?? "",
                boxShape: BoxShape.circle,
                height: 36,
                width: 36,
              ),
            ],
          ),
          const SizedBox(height: 12,),
          InkWell(
            onTap: onTapAdmin,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  TextWidget.medium(
                    context.getStrings.changeRoleToAdmin,
                    context: context,
                    additionalStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const IconWidget(
                    icon: Assets.iconStar,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onTapSendGift,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  TextWidget.medium(
                    context.getStrings.sendGiftCard,
                    context: context,
                    additionalStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const IconWidget(
                    icon: Assets.iconGiftCard,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: onTapDelete,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  TextWidget.medium(
                    context.getStrings.delete,
                    context: context,
                    additionalStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  const IconWidget(
                    icon: Assets.iconTrash,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
