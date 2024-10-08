part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  ProductDetailState();
  bool isSelectedOption = false;
  int priceAfterSelection = 0;
  int quantity = 1;
  @override
  List<Object> get props => [isSelectedOption, priceAfterSelection];
}

extension ProductDetailStateCopyWith on ProductDetailState {
  ProductDetailState copyWith({
    bool? isSelectedOption,
    int? priceAfterSelection,
    int? quantity,
  }) {
    return ProductDetailState()
      ..isSelectedOption = isSelectedOption ?? this.isSelectedOption
      ..priceAfterSelection = priceAfterSelection ?? this.priceAfterSelection
      ..quantity = quantity ?? this.quantity;
  }
}

class ProductDetailLoading extends ProductDetailState {
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
