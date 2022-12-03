import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/home_page/widgets/voluntary_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class HomeVoluntaryEventsListview extends StatelessWidget {
  const HomeVoluntaryEventsListview({Key? key}) : super(key: key);

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
                  context.getStrings.voluntaryEvents,
                  context: context,
                  additionalStyle: const TextStyle(fontSize: 16),
                ),
              ),
              GestureDetector(
                onTap: () {},
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
          height: 100,
          child: ListView.separated(
            itemBuilder: (context, index) => VoluntaryItemWidget(
              index: index,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ],
    );
  }
}
