import 'package:betterspace/src/model/office_models/office_dummy_models.dart';
import 'package:betterspace/src/model/user_data/user_models.dart';
import 'package:betterspace/src/utils/enums.dart';

class TransactionBookingTime {
  late String checkInHour;
  late String checkInDate;
  String? checkOutHour;
  String? checkOutDate;
  DateTime? checkInDateTime;
  DateTime? checkOutDateTime;
  TransactionBookingTime(
      {required this.checkInHour,
      required this.checkInDate,
      this.checkOutHour,
      this.checkOutDate,
      this.checkInDateTime,
      this.checkOutDateTime});
}

class PaymentMenthodModel {
  late String paymentId;
  late String paymentMethodName;
  String? paymentVirtualAccount;
  String? qrGenerateable;
  double? paymentFees;
  PaymentMenthodModel(
      {required this.paymentId,
      required this.paymentMethodName,
      this.paymentVirtualAccount,
      this.qrGenerateable,
      this.paymentFees});
}

class PaymentModels {
  List<PaymentMenthodModel> listOfAvailablePaymentMethod = [];
  PaymentMenthod() {
    listOfAvailablePaymentMethod = [
      PaymentMenthodModel(
          paymentId: "QR",
          paymentMethodName: "QRIS",
          qrGenerateable: "mock%payment%string%for%generated%qr",
          paymentFees: 0),
      PaymentMenthodModel(
          paymentId: "BNI_VA",
          paymentMethodName: "BNI",
          paymentVirtualAccount: "0000199911111",
          paymentFees: 2500),
      PaymentMenthodModel(
          paymentId: "BRI_VA",
          paymentMethodName: "BRI",
          paymentVirtualAccount: "0120199911111",
          paymentFees: 2500),
      PaymentMenthodModel(
          paymentId: "BCA_VA",
          paymentMethodName: "BCA",
          paymentVirtualAccount: "4500199911111",
          paymentFees: 2500),
      PaymentMenthodModel(
          paymentId: "MANDIRI_VA",
          paymentMethodName: "MANDIRI",
          paymentVirtualAccount: "6650199911111",
          paymentFees: 2500),
      PaymentMenthodModel(
          paymentId: "OTHER_VA",
          paymentMethodName: "OTHER",
          paymentVirtualAccount: "3350199911111",
          paymentFees: 5000),
    ];
  }

  PaymentMenthodModel paymentMethodFilters(
      {required String requestedPaymentMethodId}) {
    //filters will return the respected payment method models if the requestedId's is exist on ListOfAvailablePaymentMethod,
    //else it will return the last element of ListOfAvailablePaymentMethod
    PaymentMenthodModel filteredPaymentModel =
        listOfAvailablePaymentMethod.last;
    listOfAvailablePaymentMethod.forEach((element) {
      if (element.paymentId == requestedPaymentMethodId) {
        filteredPaymentModel = element;
      }
    });
    return filteredPaymentModel;
  }
}

class CreateTransactionModels {
  late int transactionTotalPrice;
  late TransactionBookingTime transactionBookingTime;
  late int duration;
  late String paymentMethodName;
  late String selectedDrink;
  late int selectedOfficeId;
  CreateTransactionModels({
    required this.transactionTotalPrice,
    required this.transactionBookingTime,
    required this.duration,
    required this.paymentMethodName,
    required this.selectedDrink,
    required this.selectedOfficeId,
  });
}

class UserTransaction {
  late int bookingId;
  late int bookingDuration;
  late TransactionBookingTime bookingTime;
  late OfficePricing bookingOfficePrice;
  late String Drink;
  late String Status;
  late PaymentMenthodModel paymentMethod;
  late UserModel userData;
  late OfficeModels officeData;
  UserTransaction({
    required this.bookingId,
    required this.bookingDuration,
    required this.bookingTime,
    required this.bookingOfficePrice,
    required this.Drink,
    required this.Status,
    required this.paymentMethod,
    required this.userData,
    required this.officeData,
  });
}
