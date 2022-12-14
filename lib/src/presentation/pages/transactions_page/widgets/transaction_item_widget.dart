import 'package:flutter/material.dart';
import 'package:nova_kudos_flutter/src/domain/model/transaction_model/transaction_model.dart';
import 'package:nova_kudos_flutter/src/presentation/helpers/extensions/datetime_extension.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/icon_widget.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/widgets/text_widget.dart';

class TransactionItemWidget extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItemWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconWidget(
              icon: transaction.isSuccessful ? Icons.check : Icons.close,
              size: 15,
              iconColor: transaction.isSuccessful
                  ? Theme.of(context).colorScheme.surfaceVariant
                  : Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.semiBold(
                  transaction.title ?? "",
                  context: context,
                  maxLines: 1,
                  additionalStyle: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextWidget.medium(
                        transaction.cause ?? "",
                        context: context,
                        maxLines: 1,
                        additionalStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TextWidget.regular(
                      transaction.createdAt?.formattedJalaliDateWithTime ?? "",
                      context: context,
                      maxLines: 1,
                      additionalStyle: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
