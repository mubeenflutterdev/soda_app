import 'package:flutter/widgets.dart';

class CartCounterProvider with ChangeNotifier {
  List cartList = [
    {
      'img':
          "https://nazarjanssupermarket.com/cdn/shop/files/life-star-energy-drink-250ml-nazar-jan-s-supermarket.png?v=1715283098",
      'name': 'Cool berry',
      'brand': "Rolex",
      'price': '\$40',
    },
  ];
  int counter = 0;
  void counterIncrement() {
    counter += 1;
    notifyListeners();
    
  }

  void counterDecrement() {
    
      counter = counter-1;
      notifyListeners();
    
  }
}
