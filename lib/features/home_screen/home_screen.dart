import 'package:ecommerce/core/routing/app_routs.dart';
import 'package:ecommerce/core/styling/app_colors.dart';
import 'package:ecommerce/core/utils/storage_helper.dart';
import 'package:ecommerce/core/widgets/custom_text_field.dart';
import 'package:ecommerce/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce/features/home_screen/cubit/product_state.dart';
import 'package:ecommerce/features/home_screen/models/products_model.dart';
import 'package:ecommerce/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce/features/home_screen/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/styling/app_styles.dart';
import '../../core/utils/service_locator.dart';
import '../../core/widgets/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCat = "All";

  @override
  void initState() {
    context.read<ProductCubit>().fetchProducts();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sl<StorageHelper>().removeToken();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpace(28),
          SizedBox(
            width: 335.w,
            child: Text(
              'Discover',

              style: AppStyles.black18BoldStyle.copyWith(fontSize: 28.sp),
            ),
          ),
          const HeightSpace(16),
          Row(
            children: [
              CustomTextField(width: 270.w, hintText: "Search for clothes..."),
              WidthSpace(8),
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.search_outlined, color: Colors.white),
              ),
            ],
          ),
          HeightSpace(16),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((cat) {
                      return CategoryItemWidget(
                        categoryName: cat,
                        isSelected: selectedCat == cat ? true : false,
                        onPress: () {
                          setState(() {
                            selectedCat = cat;
                            if (selectedCat == 'All') {
                              context.read<ProductCubit>().fetchProducts();
                            } else {
                              context
                                  .read<ProductCubit>()
                                  .fetchProductCategories(cat);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          HeightSpace(24),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Expanded(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.sp,
                        crossAxisSpacing: 16.sp,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.amber,
                          width: 150.w,
                          height: 120.h,
                        );
                      },
                    ),
                  ),
                );
              }
              if (state is ProductLoaded) {
                List<ProductsModel> products = state.products;
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onRefresh: () async {
                      selectedCat = "All";
                      setState(() {});
                      context.read<ProductCubit>().fetchProducts();
                    },
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 600),
                            child: SlideAnimation(
                              verticalOffset: 200.0,
                              child: FadeInAnimation(
                                child: ProductItemWidget(
                                  title: products[index].title ?? "",
                                  price: products[index].price.toString(),
                                  image: products[index].image ?? "",
                                  onTap: () {
                                    GoRouter.of(context).pushNamed(
                                      AppRoutes.productScreen,
                                      extra: products[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
              return Text('there is an error');
            },
          ),
        ],
      ),
    );
  }
}
