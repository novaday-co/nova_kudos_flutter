import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextWidget.bold("Settings page",context:context,),
    );
  }
}