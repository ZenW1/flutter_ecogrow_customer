import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo repo;
  ProductBloc(this.repo) : super(const ProductState()) {
    on<FetchProductEvent>(_fetchProductList);
    on<ProductSearchEvent>(_searchProduct);
  }

  List<ProductModel> listData = [];

  Future<void> _fetchProductList(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductInitial());
    try {
      final res = await repo.getProductList();
      listData.addAll(res.data!);
      emit(ProductLoaded(data: res));
    } catch (e) {
      emit(ProductFailure(message: e.toString()));
    }
  }

  Future<void> _searchProduct(
      ProductSearchEvent event, Emitter<ProductState> emit) async {
    if (listData.isNotEmpty) {
      listData.where((element) => element.productName!.toLowerCase().contains(event.keyword.toLowerCase()));
    } else {
      final res = await repo.getProductList();
      listData.addAll(res.data!);
      listData.where((element) => element.productName!.toLowerCase().contains(event.keyword.toLowerCase()));
    }
    emit(ProductLoaded(data: ProductResponseModel(data: listData)));
  }
}
