import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/grid_shop_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/shop_page/widgets/shop_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/default_dialog_style.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/dialogs/dialog_function.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/image_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';
import 'package:sprintf/sprintf.dart';

class ShopPage extends BaseStatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShopPageState();
}

class _ShopPageState extends BaseStatefulWidgetState<ShopPage, ShopCubit> {
  @override
  void initState() {
    postFrameCallback(() {
      context.read<ShopCubit>().getShop();
    });
    super.initState();
  }

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
          child: BlocBuilder<ShopCubit, ShopState>(
            builder: (context, state) {
              if (state is GetShopRequestState) {
                return state.when(
                    loading: () => const ShopPageSkeleton(),
                    success: (shopItems) => GridView.builder(
                          shrinkWrap: true,
                          itemCount: shopItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            mainAxisExtent: 155,
                          ),
                          itemBuilder: (context, index) {
                            return GridShopItemWidget(
                              shopModel: shopItems[index],
                              onShopItemClick: () {
                                showKodusDialog(
                                  context,
                                  (_) => DialogDefaultStyle(
                                    title: '',
                                    question: '',
                                    acceptButtonColor: Theme.of(context)
                                        .colorScheme
                                        .surfaceVariant,
                                    onAccept: () async {
                                      Navigator.pop(context);
                                    },
                                    onReject: () {
                                      Navigator.pop(context);
                                    },
                                    acceptButtonText:
                                        context.getStrings.titleContinue,
                                    child: TextWidget.medium(
                                      sprintf(
                                          context.getStrings.phForPurchase, [
                                        shopItems[index].title,
                                        shopItems[index].price,
                                      ]),
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
                    failed: (error) => const SizedBox.shrink());
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
