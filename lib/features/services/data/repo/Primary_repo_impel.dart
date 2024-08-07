import 'package:dartz/dartz.dart';
import 'package:flutter_api_fallback/core/errors/failure.dart';
import 'package:flutter_api_fallback/core/network/remote/end_points.dart';
import 'package:flutter_api_fallback/features/services/data/model/ser_model.dart';
import 'package:flutter_api_fallback/features/services/data/repo/ser_base_repo.dart';

import '../../../../core/network/remote/apis/dio_helper.dart';

class PrimaryRepoImpel implements SerBaseRepo {
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final response = await DioHelper.getData(
        url: PRO,
      );

      print(response.statusCode);
      if (response.statusCode == 200) {
        return Right(ProductModel.fromListOfJson(response.data as List<Map>));
      } else {
        return Left(ServerFailure('Server Error: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(ServerFailure(' Error: ${e.toString()}'));
    }
  }
}
