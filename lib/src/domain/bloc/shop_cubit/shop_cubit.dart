import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/pagination_cubit/pagination_cubit.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/general/pagination_resource_model.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';

class ShopCubit extends PaginationCubit<ShopModel> {
  @override
  Future<void> get({
    RequestType requestType = RequestType.init,
    int pageNumber = 1,
    int pageSize = 20,
  }) async {
    List<ShopModel> shopItems = [
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 5,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 10,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 30,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 45,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 25,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 2,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 2,
      ),
      ShopModel(
        title: 'اعتبار فیدیبو',
        image: "https://loremflickr.com/640/360",
        endAt: DateTime.now(),
        price: 2,
      ),
    ];
    emitLoading(requestType);
    await Future.delayed(const Duration(seconds: 2));
    emitLoaded(
        PaginationResourceModel(
          data: shopItems,
          meta: MetaModel(lastPage: 1, currentPage: 1),
        ),
        requestType);
  }
}
