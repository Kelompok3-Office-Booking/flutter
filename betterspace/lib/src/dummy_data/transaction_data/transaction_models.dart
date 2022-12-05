import 'package:betterspace/src/dummy_data/office_data/office_dummy_models.dart';
import 'package:betterspace/src/dummy_data/user_data/user_models.dart';

class TransactionDetailModels {
  late String transactionUsedPromoId;
  late double transactionTotalPrice;
  late String transactionStatus;
}

class TransactionModels {
  late String transactionId;
  late UserModel transactionUserData;
  late OfficeModels transactionOfficesModels;
  late TransactionDetailModels transactionDetails;
}
