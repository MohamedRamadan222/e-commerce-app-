import 'package:ecommerce/features/address/address_screen.dart';
import 'package:ecommerce/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce/features/cart/cubit/cart_cubit.dart';
import 'package:ecommerce/features/home_screen/models/products_model.dart';
import 'package:ecommerce/features/main_screen/main_screen.dart';
import 'package:ecommerce/features/product_screen/product_screen.dart';
import 'package:ecommerce/features/splash_screen/spalsh_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/register_screen.dart';
import '../utils/service_locator.dart';
import 'app_routs.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.registerScreen,
        path: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        name: AppRoutes.mainScreen,
        path: AppRoutes.mainScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<CartCubit>(),
          child: const MainScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.productScreen,
        path: AppRoutes.productScreen,
        builder: (context, state) {
          ProductsModel product = state.extra as ProductsModel;
          return BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: ProductScreen(product: product),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.addressScreen,
        path: AppRoutes.addressScreen,
        builder: (context, state) => const AddressScreen(),

      ),
    ],
  );
}
