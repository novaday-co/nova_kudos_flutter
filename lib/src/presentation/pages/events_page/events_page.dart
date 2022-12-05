import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_cubit/events_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/events_page/widgets/event_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';

class EventsPage extends BaseStatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState
    extends BaseStatefulWidgetState<EventsPage, EventsCubit> {
  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: 'ایونت های داوطلبانه',
      onPressBack: () {
        Navigator.pop(context);
      },
      centerTitle: true,
      actions: [
        FloatingActionButton(
          mini: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          child: Center(
            child: IconWidget(
              icon: Icons.add,
              iconColor: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 12,
      itemBuilder: (context, index) => EventItemWidget(
        onEventLongPress: () {},
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
