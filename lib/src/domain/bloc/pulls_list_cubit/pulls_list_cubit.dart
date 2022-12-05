import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/pulls_list_cubit/pulls_list_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/pull/pull.dart';

class PullsListCubit extends Cubit<PullsListState> {
  PullsListCubit() : super(InitPullsListState());

  Future<void> getPullsList() async {
    emit(const GetPullsListState.loading());
    await Future.delayed(const Duration(seconds: 2));
    List<PullModel> list = [
      PullModel(
        title: "حرفه ای ترین همکارت کیه؟",
        contributors: 234,
        endAt: DateTime.now().add(Duration(hours: 1)),
        startedAt: DateTime.now().subtract(Duration(minutes: 30)),
        selectedOption: "محسن نیرومند جلالی",
      ),
      PullModel(
        title: "حرفه ای ترین همکارت کیه؟",
        contributors: 234,
        endAt: DateTime.now().add(Duration(hours: 1)),
        startedAt: DateTime.now().subtract(Duration(minutes: 30)),
        selectedOption: "محسن نیرومند جلالی",
      ),
      PullModel(
        title: "حرفه ای ترین همکارت کیه؟",
        contributors: 234,
        endAt: DateTime.now().add(Duration(hours: 1)),
        startedAt: DateTime.now().subtract(Duration(minutes: 30)),
        selectedOption: "محسن نیرومند جلالی",
      ),
    ];
    emit(GetPullsListState.success(list));
  }

  Future<void> deletePull(PullModel pullModel) async {
    emit(const DeletePullsListItemState.loading());
    await Future.delayed(const Duration(seconds: 2));
    emit(const DeletePullsListItemState.success());
  }
}
