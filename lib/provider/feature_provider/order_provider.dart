import 'package:flutter/widgets.dart';

class OrderProvider with ChangeNotifier {
  List orderList = [
    {
      'img':
          "https://nazarjanssupermarket.com/cdn/shop/files/life-star-energy-drink-250ml-nazar-jan-s-supermarket.png?v=1715283098",
      'titleNotification': 'Cool berry',
      'subTitleNotification': "Rolex",
      'status': 'Pending',
    },
  ];
}
