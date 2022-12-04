import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_state.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/context_extensions.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/helper_functions.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/transactions_page/widgets/skeleton_loading.dart';
import 'package:nova_kudos_flutter/src/presentation/pages/transactions_page/widgets/transaction_item_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/app_bar_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/background_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/base_stateful_widget.dart';

class TransactionsPage extends BaseStatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsPageState();
}

class _TransactionsPageState
    extends BaseStatefulWidgetState<TransactionsPage, TransactionsCubit> {

  @override
  void initState() {
    super.initState();
    postFrameCallback((){
      context.read<TransactionsCubit>().getTransactions();
    });
  }

  @override
  CustomAppbar? appBar(BuildContext context) {
    return CustomAppbar(
      hasBackButton: true,
      title: context.getStrings.transactions,
      onPressBack: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<TransactionsCubit,TransactionsState>(
      buildWhen: _buildWhenTransactionsList,
      builder: (context, state) {
        if (state is GetTransactionsState) {
          return state.when(
            loading: () => const TransactionsSkeletonLoading(),
            success: (transactions) => SingleChildScrollView(
              child: BackgroundWidget(
                borderRadius: 16,
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      TransactionItemWidget(transaction: transactions[index]),
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                ),
              ),
            ),
            failed: (error) => const SizedBox(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  bool _buildWhenTransactionsList(TransactionsState previous, TransactionsState current) {
    return current is GetTransactionsState;
  }
}
