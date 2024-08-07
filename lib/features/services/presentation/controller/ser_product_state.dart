part of 'ser_product_cubit.dart';

abstract class SerProductState {}

final class ProductLodingState extends SerProductState {}

final class ProductInitial extends SerProductState {}

class SerSuccess extends SerProductState {}

class SerError extends SerProductState {
  final String message;

  SerError({required this.message});
}
