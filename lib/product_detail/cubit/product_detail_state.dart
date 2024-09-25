part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailLoaded extends ProductDetailState {
  final ProductDetailResponseModel data;
  ProductDetailLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class ProductFailure extends ProductDetailState {
  final String message;
  ProductFailure({required this.message});

  @override
  List<Object> get props => [message];
}
