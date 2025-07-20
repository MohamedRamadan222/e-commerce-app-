import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/networking/api_endpoints.dart';
import 'package:ecommerce/features/home_screen/models/products_model.dart';

import '../../../core/networking/dio_helper.dart';
import '../models/categories_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.products,
      );
      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);
        return Right(products);
      } else {
        return Left("Something Went Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductsCategories(
    String catName,
  ) async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint:
            "${ApiEndpoints.products}/${ApiEndpoints.catProducts}/$catName",
      );
      if (response.statusCode == 200) {
        List<ProductsModel> products = productsModelFromJson(response.data);
        return Right(products);
      } else {
        return Left("Something Went Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategories() async {
    try {
      final response = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.categories,
      );
      if (response.statusCode == 200) {
        List<String> categories = categoriesModelFromJson(response.data);
        categories.insert(0, 'All');
        return Right(categories);
      } else {
        return Left("Something Went Wrong");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
