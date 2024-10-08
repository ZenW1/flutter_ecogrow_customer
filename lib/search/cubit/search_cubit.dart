import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ecogrow_customer/data/model/product_response_model.dart';
import 'package:flutter_ecogrow_customer/product/bloc/product_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.productBloc) : super(const SearchState());

  final ProductBloc productBloc;
  final TextEditingController searchController = TextEditingController();

  Future<void> searchProduct(String keyword) async {
    emit(SearchLoading());
    productBloc..add(ProductSearchEvent(keyword: keyword));
    final data = productBloc.listData;
    emit(SearchLoaded(data: data));
  }
}
