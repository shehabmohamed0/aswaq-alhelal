class FirestorePath {
  FirestorePath._();
  static String user(String uid) => 'users/$uid';
  static String profile(String uid) => 'profiles/$uid';
  static String get profiles => 'profiles';
  static String get items => 'items';
  static String get refGovernates => 'refGovernates';
  static String get refCities => 'refCities';
  static String get refNeighborhoods => 'refNeighborhoods';
  static String get itemsReference => 'items_reference';
  static String item(String itemId) => 'items/$itemId';
  static String addresses(String userId) => 'users/$userId/addresses';
  static String address(String userId, String addressId) =>
      'users/$userId/addresses/$addressId';
  static String userAddresses(String userId) => 'users/$userId/addresses';
  static String userAddress(String userId, String addressId) =>
      'users/$userId/addresses/$addressId';
  static String get orders => 'orders';
  static String order(String orderId) => 'orders/$orderId';
}
