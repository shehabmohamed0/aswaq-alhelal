class FirebasePath {
  FirebasePath._();
  static String userAddresses(String userId) => 'users/$userId/addresses';
  static String userAddress(String userId, String addressId) =>
      'users/$userId/addresses/$addressId';
}
