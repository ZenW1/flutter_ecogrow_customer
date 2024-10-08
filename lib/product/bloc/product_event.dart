part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProductEvent extends ProductEvent {
  const FetchProductEvent();
  @override
  List<Object> get props => [];
}

class ProductSearchEvent extends ProductEvent {
  final String keyword;
  ProductSearchEvent({required this.keyword});
  @override
  List<Object> get props => [keyword];
}
