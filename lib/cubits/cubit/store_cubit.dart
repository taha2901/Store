import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/model/product_model.dart';
import 'package:store/services/get_all_products.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

   Future<void> getAllProducts() async {
    try {
      emit(StoreLoaded()); 
      final products = await AllProductsService().getAllProducts();
      emit(StoreSuccess(products: products)); 
    } catch (e) {
      emit(StoreFailure(errMessage: e.toString())); 
    }
  }
}
