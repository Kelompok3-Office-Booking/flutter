import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/model/user_data/user_models.dart';

class PaymentMethod {
  late String paymentMethodName;
  late double paymentMethodFee;
  PaymentMethod(
      {required this.paymentMethodName, required this.paymentMethodFee});
}

class TransactionDetailModels {
  late String transactionUsedPromoId;
  late double transactionTotalPrice;
  late String transactionStatus;
  late DateTime transactionCreatedAt;
  late DateTime transactionValidationAt;
  TransactionDetailModels(
      {required this.transactionUsedPromoId,
      required this.transactionTotalPrice,
      required this.transactionStatus,
      required this.transactionCreatedAt,
      required this.transactionValidationAt});
}

class TransactionModels {
  late String transactionId;
  late UserModel transactionUserData;
  late OfficeModels transactionOfficesModels;
  late TransactionDetailModels transactionDetails;

  TransactionModels(
      {required this.transactionId,
      required this.transactionUserData,
      required this.transactionOfficesModels,
      required this.transactionDetails});
}
