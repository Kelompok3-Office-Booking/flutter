import 'package:betterspace/src/dummy_data/office_data/office_dummy_models.dart';
import 'package:betterspace/src/dummy_data/user_data/user_models.dart';

class PaymentMethod {
  late String paymentMethodName;
  late double paymentMethodFee;
}

class TransactionDetailModels {
  late String transactionUsedPromoId;
  late double transactionTotalPrice;
  late String transactionStatus;
  late DateTime transactionCreatedAt;
  late DateTime transactionValidationAt;
}

class TransactionModels {
  late String transactionId;
  late UserModel transactionUserData;
  late OfficeModels transactionOfficesModels;
  late TransactionDetailModels transactionDetails;
}
