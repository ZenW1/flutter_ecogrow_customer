import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0, indexCount: 0));

  // int? get currentIndex => state.currentIndex;
  int? get indexCount => data.length > 3 ? 3 : data.length;
  int? get currentIndex =>
      state.currentIndex! > indexCount! ? indexCount : state.currentIndex;

  ScrollController scrollController = ScrollController();

  Future<void> controllerListener() async {
    scrollController.addListener(() {
      // scrollController.position.viewportDimension.w;
      if (scrollController.position.pixels > indexCount! * 1.0) {
        emit(
          HomeState(
            currentIndex: currentIndex! + 1 > indexCount!
                ? indexCount
                : currentIndex! + 1,
            indexCount: indexCount,
          ),
        );
      } else {
        emit(
          HomeState(
            currentIndex: currentIndex! - 1 <= 0 ? 0 : currentIndex,
            indexCount: indexCount,
          ),
        );
      }
    });
  }

  List<HomeProductTodayModel> data = [
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'ត្រកូន',
      price: '2500',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://qiksmartsg.com/cdn/shop/products/Screenshot2021-09-15at7.04.41PM.png?v=1631704019',
      title: 'ស្លឹកតើយ',
      price: '2500',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZe0atpWl7sCJxAX4Qrqwed6OF4zHdg--CRA&s',
      title: 'វ៉ាន់ស៊ុយ',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://tokke.kesspay.io/cache/large/product_detail/47829/cc80cad2ceed1472e726b35890e201ba15e7d4ab.jpg',
      title: 'សណ្ដែកកួរ',
      price: '500',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
  ];

// void onPageChangedIndex(int index) {
//   emit(HomeState(currentIndex: index));
// }
}

class HomeProductTodayModel {
  const HomeProductTodayModel({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.weight,
  });

  final String imageUrl;
  final String title;
  final String price;
  final String weight;
}
