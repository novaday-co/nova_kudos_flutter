import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/constants/common/assets.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/components/row_user_profile.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: RowUserProfile(
            imageUrl: "https://loremflickr.com/640/360",
            name: "سارا تهرانی",
            jobTitle: "برنامه نویس موبایل",
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        IconWidget(
          icon: Assets.iconNotification,
          size: 24,
          borderColor: Theme.of(context).colorScheme.outline,
          hasBorder: true,
          padding: 10,
          boxShape: BoxShape.circle,
          onPressed: () {},
        )
      ],
    );
  }
}
