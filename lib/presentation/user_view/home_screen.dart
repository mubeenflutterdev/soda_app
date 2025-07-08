// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/models/product_model.dart';
import 'package:soda_bar/presentation/user_view/details_screen.dart';
import 'package:soda_bar/provider/feature_provider/categories_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/widgets/card/dashboard_component.dart';
import 'package:soda_bar/widgets/card/product_dashboard_component.dart';
import 'package:soda_bar/widgets/shimmer/shimmer_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'Cola',
    'Pepsi',
    'Sprite',
    '7Up',
    'RootBeer',
    'Fanta',
    'Dew',
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });

    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    final categoriesProvider = Provider.of<CategoriesProvider>(
      context,
      listen: false,
    );

    // Fetch only if not already loaded
    if (productProvider.products.isEmpty) {
      productProvider.getProducts(context);
    }
    if (categoriesProvider.categoriesList.isEmpty) {
      categoriesProvider.getCategories(context);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; // Preserve state

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required when using AutomaticKeepAliveClientMixin

    final productProvider = Provider.of<ProductProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Section
              DashBoardComponent(),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "All Flavours",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              /// Scrollable Custom Tab Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_tabs.length, (index) {
                      final isSelected = _tabController.index == index;
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: GestureDetector(
                          onTap: () {
                            _tabController.animateTo(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.buttonBackGround
                                  : AppColors.greyColor,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              /// Tab Content Area
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: TabBarView(
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: _tabs.map((tab) {
                    return _buildTabContent(productProvider, tab);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(ProductProvider provider, String categoryName) {
    final List<ProductModel> products = provider.products
        .where(
          (product) =>
              product.category?.toLowerCase() == categoryName.toLowerCase(),
        )
        .toList();

    if (provider.isLoading == true) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ShimmerBox(height: 40, width: 60),
      );
    } else if (products.isEmpty) {
      return Center(child: Text('No products found'));
    }

    return Padding(
      padding: EdgeInsets.all(10.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.656,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsScreen(product: product),
                ),
              );
            },
            child: ProductDasboard(
              img: product.image ?? '',
              name: product.name ?? '',
              price: product.price ?? 0,
            ),
          );
        },
      ),
    );
  }
}
