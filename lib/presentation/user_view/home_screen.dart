// ignore_for_file: must_be_immutable

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/models/product_model.dart';
import 'package:soda_bar/presentation/user_view/details_screen.dart';
import 'package:soda_bar/provider/feature_provider/categories_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/widgets/card/dashboard_component.dart';
import 'package:soda_bar/widgets/card/product_dashboard_component.dart';
import 'package:soda_bar/widgets/shimmer/categories_shimmer.dart';
import 'package:soda_bar/widgets/shimmer/product_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CategoriesProvider categoriesProvider = Provider.of<CategoriesProvider>(
      context,
      listen: false,
    );
    categoriesProvider.getCategories(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    productProvider.getProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesProvider = Provider.of<CategoriesProvider>(
      context,
    );
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider.builder(
                  itemCount: 15,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                        return DashBoardComponent();
                      },
                  options: CarouselOptions(
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    autoPlay: true,
                    aspectRatio: 16 / 12,
                    viewportFraction: 1.05,
                  ),
                ),
              ),
              Consumer<CategoriesProvider>(
                builder: (context, categoriesProvider, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: categoriesProvider.isLoading == true
                        ? CategoriesShimmer(itemCount: 2)
                        : ButtonsTabBar(
                            contentCenter: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            buttonMargin: EdgeInsets.symmetric(horizontal: 5),
                            backgroundColor: AppColors.buttonBackGround,
                            borderWidth: 0,
                            borderColor: Colors.black,
                            labelStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: List.generate(
                              categoriesProvider.categoriesList.length,
                              (index) {
                                return Tab(
                                  icon: Icon(Icons.home),
                                  text: categoriesProvider
                                      .categoriesList[index]
                                      .name,
                                );
                              },
                            ),
                          ),
                  );
                },
              ),
              // Use SizedBox with a fixed height for the TabBarView content
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    productProvider.isLoading == true
                        ? ProductShimmer()
                        : ProductPreview(
                            productModel: productProvider.products,
                            category: categoriesProvider.categoriesList[0].name,
                          ),
                    Center(child: Text('hello')),
                    Center(child: Text('hello')),
                    Center(child: Text('hello')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductPreview extends StatelessWidget {
  List<ProductModel> productModel;
  String category;
  ProductPreview({
    super.key,
    required this.productModel,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = productModel;
    final List<ProductModel> filteredList = products
        .where((product) => product.category == category)
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Changed to allow scrolling
        itemCount: filteredList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.67,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              final ProductModel product = ProductModel(
                price: filteredList[index].price,
                image: filteredList[index].image,
                name: filteredList[index].name,
                addedDate: filteredList[index].addedDate,
                categoryId: filteredList[index].categoryId,
                flavor: filteredList[index].flavor,
                id: filteredList[index].id,
                size: filteredList[index].size,
                updatedDate: filteredList[index].updatedDate,
                quantity: filteredList[index].quantity,
                rating: filteredList[index].rating,
                category: filteredList[index].category,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: product),
                ),
              );
            },
            child: ProductDasboard(
              img: filteredList[index].image.toString(),
              name: filteredList[index].name.toString(),
              price: filteredList[index].price,
            ),
          );
        },
      ),
    );
  }
}
