import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_ecogrow_customer/category/view/category_item_widget.dart';
import 'package:flutter_ecogrow_customer/data/model/category_response_model.dart';
import 'package:flutter_ecogrow_customer/data/repo/product_repo.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.repo) : super(CategoryLoading());

  final ProductRepo repo;

  Future<void> getCategory() async {
    emit(CategoryLoading());
    try {
      final res =  await repo.getCategory();
      emit(CategoryLoaded(categoryResponseModel: res));
    } catch (e) {
      emit(CategoryFailed(message: e.toString()));
    }
  }
}
