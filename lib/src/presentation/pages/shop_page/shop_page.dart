import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/grid_shop_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_user_profile.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class ShopPage extends BaseStatelessWidget<ShopCubit> {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            TextWidget.bold(
              context.getStrings.shop,
              context: context,
              additionalStyle: const TextStyle(fontSize: 18),
            ),
            Row(
              children: const [
                Align(
                  alignment: Alignment.centerRight,
                  child: ImageLoaderWidget.fromNetwork(
                    imageUrl: "https://loremflickr.com/640/360",
                    boxShape: BoxShape.circle,
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 155,
            ),
            itemBuilder: (context, index) {
              return GridShopItemWidget(
                shopModel: ShopModel(
                  title: 'اعتبار فیدیبو',
                  image: "https://loremflickr.com/640/360",
                  endAt: DateTime.now(),
                  price: 5,
                ),
                onShopItemClick: () {
                  showKodusDialog(
                    context,
                    (_) => DialogDefaultStyle(
                      title: '',
                      question: '',
                      acceptButtonColor:
                          Theme.of(context).colorScheme.surfaceVariant,
                      onAccept: () async {
                        Navigator.pop(context);
                      },
                      onReject: () {
                        Navigator.pop(context);
                      },
                      acceptButtonText: context.getStrings.titleContinue,
                      child: TextWidget.medium(
                        "بابت اعتبار خرید اکانت فیدیبو 40 سکه از موجودی شما کم میشود",
                        context: context,
                        additionalStyle: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
