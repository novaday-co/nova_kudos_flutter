import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_list_cubit/events_list_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/events_list_cubit/events_list_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/events_list_page/widgets/event_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/events_list_page/widgets/events_page_skeleton.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';

class EventsListPage extends BaseStatefulWidget {
  const EventsListPage({Key? key}) : super(key: key);

  @override
  State<EventsListPage> createState() => _EventsPageState();
}

class _EventsPageState
    extends BaseStatefulWidgetState<EventsListPage, EventsListCubit> {
  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: context.getStrings.voluntaryEvents,
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
  void initState() {
    postFrameCallback(() {
      context.read<EventsListCubit>().getEvents();
    });

    super.initState();
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<EventsListCubit, EventsListState>(
      builder: (context, state) {
        if (state is GetEventsRequestState) {
          return state.when(
            loading: () => const EventsPageSkeleton(),
            success: () => ListView.separated(
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context, index) => EventItemWidget(
                onEventLongPress: () {},
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
            failed: (error) => const SizedBox.shrink(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}