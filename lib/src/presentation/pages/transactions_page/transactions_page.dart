import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateless_widget.dart';

class TransactionsPage extends BaseStatelessWidget<TransactionsCubit> {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  CustomAppbar? appBar(BuildContext context){
    return CustomAppbar(
      hasBackButton: true,
      title: context.getStrings.transactions,
      onPressBack: (){
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return Column();
  }
}
