import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppbarWidget(
        context: context,
        titles: Text(
          'Email',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: AdaptSize.pixel16,
              ),
        ),
        titleSpacer: AdaptSize.pixel16,
        leadingIcon: IconButton(
          onPressed: () {
            context.read<NavigasiViewModel>().navigasiPop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColor.darkColor,
            size: AdaptSize.pixel16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
        ),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: MyColor.neutral800,
                    child: Padding(
                      padding: EdgeInsets.all(AdaptSize.pixel16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.email_outlined),
                          SizedBox(
                            height: AdaptSize.pixel8,
                          ),
                          Text(
                            'ErickCahya@gmail.com',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: AdaptSize.screenHeight * .016,
                                    ),
                          ),
                          SizedBox(
                            height: AdaptSize.pixel8,
                          ),
                          Text(
                            'All your transaction & account security information will be sent to this email.',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: AdaptSize.screenHeight * .014,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
