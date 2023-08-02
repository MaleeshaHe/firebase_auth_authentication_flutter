class Errorm {
  String? errorId;
  String? errorName;
  String? errorType;

  Errorm({
    required this.errorId,
    required this.errorName,
    required this.errorType,
  });

  factory Errorm.fromJson(Map<String, dynamic> map) {
    return Errorm(
      errorId: map["errorId"],
      errorName: map["errorName"],
      errorType: map["errorType"],
    );
  }
}
