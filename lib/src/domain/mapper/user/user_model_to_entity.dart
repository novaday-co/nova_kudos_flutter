import 'package:nova_kudos_flutter/src/data/entity/user_entity/user_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/user/user_model.dart';

extension UserModelMapper on UserModel {
  get mapToEntity {
    return UserEntity(
      mobileNumber: mobile,
      token: token,
    );
  }
}