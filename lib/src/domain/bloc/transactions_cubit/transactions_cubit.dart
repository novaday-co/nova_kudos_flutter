import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/transaction_model/transaction_model.dart';

class TransactionsCubit extends Cubit<TransactionsState> {

  TransactionsCubit() : super(TransactionsInitState());

  Future<void> getTransactions() async {
    emit(const GetTransactionsState.loading());
    await Future.delayed(const Duration(seconds: 2));
    List<TransactionModel> list = [
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: true,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: true,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: true,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: false,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: false,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: true,
      ),
      TransactionModel(
        title: "انتقال ۵۰ سکه به شهریار بیات",
        cause: "بابت کارت تشکر",
        createdAt: DateTime.now(),
        isSuccessful: false,
      ),
    ];
    emit( GetTransactionsState.success(list));

  }
}