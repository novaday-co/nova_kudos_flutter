import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';

extension UserCompanyModelMapper on UserCompanyModel {
  get mapToEntity {
    return UserCompanyEntity(
      companyId: companyId,
      companyName: companyName,
      companyAvatar: companyAvatar,
      coinAmount: coinAmount,
      currencyAmount: currencyAmount,
      jobPosition: jobPosition,
      avatar: avatar,
      userLastName: userLastName,
      userName: userName,
      phoneNumber: phoneNumber,
    );
  }
}