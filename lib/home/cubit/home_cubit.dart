import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(currentIndex: 0, indexCount: 0));

  // int? get currentIndex => state.currentIndex;
  int? get indexCount => data.length > 3 ? 3 : data.length;
  int? get currentIndex => state.currentIndex! > indexCount! ? indexCount : state.currentIndex;

  ScrollController scrollController = ScrollController();

  Future<void> controllerListener() async {
    scrollController.addListener(() {
      // scrollController.position.viewportDimension.w;
      if (scrollController.position.pixels > indexCount! * 1.0) {
        emit(
          HomeState(
            currentIndex: currentIndex! + 1 > indexCount! ? indexCount : currentIndex! + 1,
            indexCount: indexCount,
          ),
        );
      } else {
        emit(
          HomeState(
            currentIndex: state.currentIndex! - 1,
            indexCount: indexCount,
          ),
        );
      }
    });
  }

  List<HomeProductTodayModel> data = [
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '2500',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '2500',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
      title: 'Organic Banana',
      price: '3000',
      weight: '1kg',
    ),
    const HomeProductTodayModel(
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMqIGSN5hLJaS_Dao06-7GOob_y7-UghRFsQ&s',
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
