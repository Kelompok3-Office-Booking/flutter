import 'package:betterspace/src/model/transaction_model/transaction_models.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/transaction_view_model.dart';
import 'package:betterspace/src/widget/widget/button_widget.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentMetodScreen extends StatelessWidget {
  final String officeId;
  final TransactionFormModels checkoutForms;

  const PaymentMetodScreen({
    Key? key,
    required this.officeId,
    required this.checkoutForms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfPaymentModels = PaymentModels().listOfAvailablePaymentMethod;
    ValueNotifier<int> radPaymentVal = ValueNotifier<int>(0);
    final transactionsMethod =
        Provider.of<TransactionViewModel>(context, listen: false);
    print("calculated price : " +
        (checkoutForms.transactionTotalPrice).toString());

    return Scaffold(
      appBar: defaultAppbarWidget(
          contexts: context,
          leadIconFunction: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          },
          isCenterTitle: false,
          titles: 'Payment Method'),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: AdaptSize.screenWidth * .016,
            right: AdaptSize.screenWidth * .016,
            bottom: AdaptSize.screenHeight * .024,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),
              Text(
                'Choice Payment Method',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: AdaptSize.pixel16,
                      color: MyColor.neutral300,
                    ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// qris method
              Card(
                color: MyColor.neutral900,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan QR Code',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: AdaptSize.pixel16,
                              color: MyColor.neutral100,
                            ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/image_assets/qris_payment.png',
                            height: AdaptSize.screenHeight * .03,
                          ),
                          SizedBox(
                            width: AdaptSize.screenWidth * .016,
                          ),
                          Text(
                            'QRIS (Dana, OVO, Gopay,etc)',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontSize: AdaptSize.pixel14,
                                      color: MyColor.neutral100,
                                    ),
                          ),
                          const Spacer(),

                          /// qris value
                          ValueListenableBuilder<int>(
                            valueListenable: radPaymentVal,
                            builder: ((context, values, child) {
                              return Radio<int>(
                                activeColor: Colors.deepPurple.shade600,
                                value: 0,
                                groupValue: values,
                                onChanged: ((value) {
                                  radPaymentVal.value = value!;
                                }),
                              );
                            }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: AdaptSize.screenHeight * .016,
              ),

              /// transfer atm method
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: MyColor.neutral900,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer ATM / M-Banking',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: AdaptSize.pixel16,
                              color: MyColor.neutral100,
                            ),
                      ),
                      SizedBox(
                        height: AdaptSize.screenWidth / 1000 * 800,
                        width: double.infinity,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: listOfPaymentModels.length - 1,
                            itemBuilder: (context, index) {
                              int formattedIndex = index + 1;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        listOfPaymentModels[formattedIndex]
                                            .paymentMethodImageSlug,
                                        height: AdaptSize.screenHeight * .03,
                                        width: AdaptSize.screenHeight * .05,
                                      ),
                                      SizedBox(
                                        width: AdaptSize.screenWidth * .016,
                                      ),
                                      Text(
                                        listOfPaymentModels[formattedIndex]
                                            .paymentMethodName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(
                                              fontSize: AdaptSize.pixel14,
                                              color: MyColor.neutral100,
                                            ),
                                      ),
                                      const Spacer(),

                                      ///bank transfer value
                                      ValueListenableBuilder<int>(
                                        valueListenable: radPaymentVal,
                                        builder: ((context, values, child) {
                                          return Radio<int>(
                                            activeColor:
                                                Colors.deepPurple.shade600,
                                            value: formattedIndex,
                                            groupValue: values,
                                            onChanged: ((value) {
                                              radPaymentVal.value = value!;
                                            }),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                  dividerWdiget(
                                      width: double.infinity, opacity: .1)
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: AdaptSize.pixel30,
              ),

              buttonWidget(
                onPressed: () {
                  print(radPaymentVal.value);
                  context.read<NavigasiViewModel>().navigasiToPaymentDetail(
                        context: context,
                        officeId: officeId,
                        bookingForm: CreateTransactionModels(
                            transactionTotalPrice:
                                checkoutForms.transactionTotalPrice,
                            transactionBookingTime:
                                checkoutForms.transactionBookingTime,
                            duration: checkoutForms.duration,
                            paymentMethodName:
                                listOfPaymentModels[radPaymentVal.value]
                                    .paymentMethodName,
                            selectedDrink: checkoutForms.selectedDrink,
                            selectedOfficeId: checkoutForms.selectedOfficeId),
                        paymentMethodIndex: radPaymentVal.value,
                      );
                },
                sizeWidth: double.infinity,
                sizeheight: AdaptSize.screenHeight / 14,
                borderRadius: BorderRadius.circular(10),
                backgroundColor: MyColor.secondary400,
                child: Text(
                  'Continue Payment',
                  style: Theme.of(context).textTheme.button!.copyWith(
                        color: MyColor.neutral900,
                        fontSize: AdaptSize.pixel14,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
