
import 'package:get/get.dart';

import '../../data/api/api_checker.dart';
import '../../data/model/soko/productData.dart';
import '../../data/repository/soko/product_repo.dart';

class ProductsController extends GetxController implements GetxService {
   final ProductRepo productsRepo;
   ProductsController({required this.productsRepo});
   bool _isLoading = false;


  List<Product>? _listAllProducts;
  List<String>? _productsLists;
  List<dynamic>? _productsDataList;

  // getter
    // List<String?>? get bannerImageList => _bannerImageList;
  List<Product>? get listAllProducts => _listAllProducts;


  Future<void> getAllProducts(bool reload, bool notify) async {
    if(reload){
      _listAllProducts = [];
    }

    if(notify){
      update();
    }
if(_listAllProducts == null || reload) {
      Response response = await productsRepo.getProductsList22();
      if (response.statusCode == 200) {
        _listAllProducts = [];
        _listAllProducts!.addAll(ProductMiniResponse.fromJson(response.body).products);
        _isLoading = false;
      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }

  }


  
//   Future<void> getReviewedItemList(bool reload,  bool notify) async {
//     // _reviewedType = type;
//     if(reload) {
//       _listAllProducts = null;
//     }
//     if(notify) {
//       update();
//     }
//     if(_listAllProducts == null || reload) {
//       Response response = await  ProductRepo.getReviewedItemList();
//       if (response.statusCode == 200) {
//         _listAllProducts = [];
//         _reviewedItemList!.addAll(ItemModel.fromJson(response.body).items!);
//         _isLoading = false;
//       } else {
//         ApiChecker.checkApi(response);
//       }
//       update();
//     }
//   }
}