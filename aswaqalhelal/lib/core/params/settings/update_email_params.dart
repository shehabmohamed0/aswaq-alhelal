class UpdateEmailParams {
  final String newEmail;
  final String currentEmail;
  final String currentPassword;
  UpdateEmailParams({
    required this.newEmail,
    required this.currentEmail,
    required this.currentPassword,
  });
}
