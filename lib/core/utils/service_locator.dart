import 'package:ecommerce/core/networking/dio_helper.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:ecommerce/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/repo/auth_repo.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/repo/cart_repo.dart';
import 'package:ecommerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce/features/home_screen/repo/home_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();

  // Dio Helper
  sl.registerSingleton<DioHelper>(dio);

  // Storage Helper

  sl.registerLazySingleton(() => StorageHelper());

  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));

  sl.registerLazySingleton(() => HomeRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => CartRepo(sl<DioHelper>()));
  // Cubit
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory(() => ProductCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CartCubit(sl<CartRepo>()));
}
