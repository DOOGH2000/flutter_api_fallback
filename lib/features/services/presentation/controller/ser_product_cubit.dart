import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_fallback/features/services/data/model/ser_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../data/repo/ser_base_repo.dart';

part 'ser_product_state.dart';

class SerProductCubit extends Cubit<SerProductState> {
  SerProductCubit() : super(ProductInitial());

  static SerProductCubit get(BuildContext context) => BlocProvider.of(context);
  List<ProductModel>? productsData;

  Future<bool> getProducts(SerBaseRepo repo) async {
    emit(ProductLodingState());

    final result = await repo.getProducts();

    final bool state = result.fold((failure) {
      emit(SerError(message: failure.errMessage));
      return false;
    }, (products) {
      productsData = products;
      emit(SerSuccess());
      return true;
    });
    return state;
  }
}



// Future<void> getProducts() async {
//   emit(ProductLodingState());
//
//   final primaryResult = await _primaryRepo.getProducts();
//   final bool success = primaryResult.fold(
//         (failure) async {
//       emit(SerError(message: failure.errMessage));
//       final secondaryResult = await _secondaryRepo.getProducts();
//       return secondaryResult.fold(
//             (failure) {
//           emit(SerError(message: failure.errMessage));
//           return false;
//         },
//             (products) {
//           productsData = products;
//           emit(SerSuccess(productsData));
//           return true;
//         },
//       );
//     },
//         (products) {
//       productsData = products;
//       emit(SerSuccess(productsData));
//       return true;
//     },
//   );
// }
// }
