class ApiConstants {
  //todo: base
  // static const String baseUrl = 'http://192.168.1.53:8000/api'; // SM house
  static const String baseUrl = 'http://192.168.31.89:8000/api'; // NK house
  // static const String baseUrl = 'http://192.168.184.50:8000/api'; // MY MOBILE

  //todo: auth
  static const String generateOtp = '$baseUrl/request-otp';
  static const String verifyOtp = '$baseUrl/verify-otp';

  //todo: Categories
  static const String category = '$baseUrl/category';
  static const String productCategory = '$baseUrl/categoryProduct';

  //todo: Product
  static const String product = '$baseUrl/productById';
  static const String allProduct = '$baseUrl/products';

  //todo: Address
  static const String addAddress = '$baseUrl/addAddress';
  static const String getAddress = '$baseUrl/getAddress';
  static const String deleteAddress = '$baseUrl/deleteAddress';
  static const String editAddress = '$baseUrl/editAddress';
  static const String makeAddressDefault = '$baseUrl/makeAddressDefault';

  //todo: Recharge
  static const String wallet = '$baseUrl/wallet';
  static const String withdrawnWallet = '$baseUrl/withdrawn';
  static const String rechargeWallet = '$baseUrl/recharge';

  //todo: Order
  static const String orderPlace = '$baseUrl/placeOrder';
  static const String getOrders = '$baseUrl/orders';
}
