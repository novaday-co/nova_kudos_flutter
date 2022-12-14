import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/shop_cubit/shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/model/shop/shop.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(InitShopState());

  void getShop() async {
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
    emit(const GetShopRequestState.loading());
    await Future.delayed(const Duration(seconds: 3));
    emit(GetShopRequestState.success(shopItems));
  }
}
