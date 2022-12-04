import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_kudos_flutter/src/domain/model/transaction_model/transaction_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

part 'transactions_state.freezed.dart';


abstract class TransactionsState{}

class TransactionsInitState extends TransactionsState{

}

@freezed
class GetTransactionsState extends TransactionsState with _$GetTransactionsState {
  const factory GetTransactionsState.loading() =
  LoadingGetTransactionsState;

  const factory GetTransactionsState.success(List<TransactionModel> transactions) =
  SuccessGetTransactionsState;

  const factory GetTransactionsState.failed(String? error) =
  FailedGetTransactionsState;
}
