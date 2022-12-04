class TransactionModel {
  bool isSuccessful;
  String? title;
  String? cause;
  DateTime? createdAt;

  TransactionModel({
    this.title,
    this.cause,
    this.createdAt,
    this.isSuccessful = false,
  });
}
