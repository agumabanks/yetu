
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../util/app_constants.dart';
import '../../api/api_client.dart';

// import '../../common/util/app_constants.dart';
// import '../api/api_client.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});


  Future<Response> getProductsList22() async {
    return await apiClient.getDataSoko(AppConstants.productUrisoko);
  }



  //   Future<Response> getReviewedItemList() async {
  //   return await apiClient.getData(AppConstants.productUri);
  // }


  Future<Response> getTaxiBannerList() async {
    return await apiClient.getData(AppConstants.taxiBannerUri);
  }

  Future<Response> getFeaturedBannerList() async {
    return await apiClient.getData('${AppConstants.bannerUri}?featured=1');
  }

}