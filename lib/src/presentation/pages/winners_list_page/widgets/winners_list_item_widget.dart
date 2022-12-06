import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/winners_list_page/widgets/user_winner_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class WinnersListItemWidget extends StatelessWidget {
  const WinnersListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      isBordered: true,
      horizontalPadding: 12,
      verticalPadding: 9,
      borderRadius: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.semiBold(
            'پر تلاش ترین همکار',
            context: context,
            additionalStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => const UserWinnerWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          )
        ],
      ),
    );
  }
}
