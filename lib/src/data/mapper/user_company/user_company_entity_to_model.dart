import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_collection.dart';
import 'package:nova_kudos_flutter/src/data/entity/user_company/user_company_entity.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/account_detail_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/user_company/user_company_model.dart';

extension UserCompanyCollectionMapper on UserCompanyCollection {
  get mapToModel {
    return AccountDetailModel(
      userDefaultCompanyModel: defaultUserCompany!.mapToModel
    );
  }
}

extension UserCompanyEntityMapper on UserCompanyEntity{
  get mapToModel{
    return UserCompanyModel(
      companyId: companyId,
      companyName: companyName,
      companyAvatar: companyAvatar,
      userName: userName,
      userLastName: userLastName,
      avatar: avatar,
      jobPosition: jobPosition,
      currencyAmount: currencyAmount,
      coinAmount: currencyAmount,
    );
  }
}
