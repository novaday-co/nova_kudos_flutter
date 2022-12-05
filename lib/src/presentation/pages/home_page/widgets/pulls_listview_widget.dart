import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';
import 'package:nova_kudos_flutter/src/presentation/config/routes.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/pull_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class HomePullsListViewWidget extends StatelessWidget {
  const HomePullsListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: TextWidget.semiBold(
                  context.getStrings.pulls,
                  context: context,
                  additionalStyle: const TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.pullsListPage);
                },
                child: TextWidget.regular(
                  context.getStrings.seeAll,
                  context: context,
                  additionalStyle: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            itemBuilder: (context, index) => PullItemWidget(
              pull: PullModel(
                title: "بهترین کارمند سال",
                contributors: 555,
                selectedOption: "محسن جلالی",
                endAt: DateTime.now().add(const Duration(days: 1)),
              ),
              onEnd: () {},
              index: index,
            ),
            addAutomaticKeepAlives: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}
