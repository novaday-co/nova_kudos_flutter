import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/profile_cubit/profile_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/achievement/achievement.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitProfileState());

  void getProfileMedal() async {
    emit(const GetProfileRequestState.loading());

    List<Achievement> medals = [
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now().add(const Duration(days: 1)),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.silver,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'نتیجه گرا ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.gold,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'پرتلاش ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'نتیجه گرا ترین',
        medalEnum: MedalEnum.silver,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
      Achievement(
        title: 'با احساس ترین',
        medalEnum: MedalEnum.bronze,
        dateTime: DateTime.now(),
      ),
    ];
    await Future.delayed(const Duration(seconds: 2));
    emit(GetProfileRequestState.success(medals));
  }
}
