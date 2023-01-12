import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/create_shop_cubit/create_shop_state.dart';
import 'package:nova_kudos_flutter/src/domain/bloc/general/file_cubit/file_cubit.dart';
import 'package:nova_kudos_flutter/src/presentation/ui/bottom_sheets/media_picker_sheet.dart';

class CreateShopCubit extends FileCubit<CreateShopState> {
  CreateShopCubit() : super(InitCreateShopState());




}
