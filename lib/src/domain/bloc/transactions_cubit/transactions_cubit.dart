import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/transactions_cubit/transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {

  TransactionsCubit() : super(TransactionsInitState());
}