

class CustomError {
  bool error;
  String errorMessage;

  CustomError({
    required this.error,
    required this.errorMessage,
  });

  factory CustomError.fromJson(Map<String, dynamic> json) {
    return CustomError(
    error : json['error'],
    errorMessage : json['errorMessage']);
  }

}