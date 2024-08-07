import 'package:dartz/dartz.dart';
import 'package:flutter_api_fallback/features/services/data/model/ser_model.dart';

import '../../../../core/errors/failure.dart';

abstract class SerBaseRepo {
  Future<Either<Failure, List<ProductModel>>> getProducts();
}