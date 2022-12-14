import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/bottom_sheet_item.dart';
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
    required this.userModel,
    required this.onTapAdmin,
    required this.onTapSendGift,
    required this.onTapDelete,
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
          const SizedBox(
            height: 12,
          ),
          BottomSheetItem(
            onTap: onTapAdmin,
            title: context.getStrings.changeRoleToAdmin,
            icon: Assets.iconStar,
          ),
          BottomSheetItem(
            onTap: onTapSendGift,
            title: context.getStrings.sendGiftCard,
            icon: Assets.iconGiftCard,
          ),
          BottomSheetItem(
            onTap: onTapDelete,
            title: context.getStrings.delete,
            icon: Assets.iconTrash,
          ),
        ],
      ),
    );
  }
}
