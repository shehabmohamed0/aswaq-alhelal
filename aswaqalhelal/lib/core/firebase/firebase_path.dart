class FirebasePath {
  FirebasePath._();
  static String addresses(String userId) => 'users/$userId/addresses';
  static String address(String userId, String addressId) =>
      'users/$userId/addresses/$addressId';
}
