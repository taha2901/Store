part of 'store_cubit.dart';

@immutable
sealed class StoreState {}

class StoreInitial extends StoreState {}

class StoreLoaded extends StoreState {}

class StoreSuccess extends StoreState {
  List<ProductModel> products;

  StoreSuccess({required this.products});
}

class StoreFailure extends StoreState {
  String errMessage;

  StoreFailure({required this.errMessage});
}
