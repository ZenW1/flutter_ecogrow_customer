part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final ProductResponseModel data;
  ProductLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class ProductRecentLoaded extends ProductState {
  final ProductRecentResponseModel data;
  ProductRecentLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class ProductFailure extends ProductState {
  final String message;
  ProductFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductByCategory extends ProductState {
  final int id;
  ProductByCategory({required this.id});

  @override
  List<Object> get props => [id];
}
