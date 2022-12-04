import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/members_cubit/members_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

class MembersCubit extends Cubit<MembersState> {
  MembersCubit() : super(InitMembersState());

  Future<void> getMembers() async {
    emit(const GetMembersState.loading());
    await Future.delayed(const Duration(seconds: 2));
    List<UserModel> list = [
      UserModel(
        name: "محسن نیرومند جلالی",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "امیر محمد جباری",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "فرید فروزان",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "شهریار بیات",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "محسن نیرومند جلالی",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "امیر محمد جباری",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "فرید فروزان",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "شهریار بیات",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "محسن نیرومند جلالی",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "امیر محمد جباری",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "فرید فروزان",
        image: "https://loremflickr.com/640/360",
      ),
      UserModel(
        name: "شهریار بیات",
        image: "https://loremflickr.com/640/360",
      ),
    ];
    emit(GetMembersState.success(list));
  }
}
