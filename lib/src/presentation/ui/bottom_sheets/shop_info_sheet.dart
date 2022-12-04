import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/bottom_sheet_item.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class ShopInfoBottomSheet extends StatelessWidget {
  final ShopModel shopModel;
  final Function() onTapEdit;
  final Function() onTapDelete;

  const ShopInfoBottomSheet({
    Key? key,
    required this.shopModel,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.bold(
            shopModel.title ?? "",
            context: context,
            additionalStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          TextWidget.regular(
            sprintf(context.getStrings.phTimeLeft,
                [shopModel.endAt?.differenceFromNow(context)]),
            context: context,
            additionalStyle: const TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget.regular(
                sprintf(context.getStrings.phPerson, [8]),
                context: context,
                additionalStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.tertiary),
              ),
              TextWidget.regular(
                sprintf(context.getStrings.phPerson, [10]),
                context: context,
                additionalStyle: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: LinearProgressIndicator(
              value: 0.8,
              color: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          const SizedBox(height: 32),
          BottomSheetItem(
            onTap: onTapEdit,
            title: 'ویرایش',
            icon: Assets.iconEdit,
          ),
          BottomSheetItem(
            onTap: onTapDelete,
            title: 'حذف',
            icon: Assets.iconTrash,
          ),
        ],
      ),
    );
  }
}
