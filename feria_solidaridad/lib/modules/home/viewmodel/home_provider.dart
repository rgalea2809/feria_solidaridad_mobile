// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:feria_solidaridad/modules/home/model/home_data_response.dart';
import 'package:feria_solidaridad/modules/home/model/images_response.dart';
import 'package:feria_solidaridad/modules/home/viewmodel/services/home_service.dart';
import 'package:feria_solidaridad/modules/home/viewmodel/services/images_service.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  HomeServiceType homeService;
  ImagesServiceType imagesService;

  HomeProvider({
    required this.homeService,
    required this.imagesService,
  });

  HomeDataResponseData? homeData;
  List<ImagesData> images = [];
  bool isLoading = false;

  Future<void> fetchHomeData() async {
    setLoadingState(true);

    HomeDataResponse response = await homeService.fetchHomeInformation();
    homeData = response.data;

    ImagesResponse imagesResponse = await imagesService.getAllImages();
    images = imagesResponse.data;

    setLoadingState(false);
  }

  void setLoadingState(bool state) {
    isLoading = state;
    notifyListeners();
  }
}
