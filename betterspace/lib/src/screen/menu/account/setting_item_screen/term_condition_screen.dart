import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/transparent_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: transparentAppbarWidget(
          context: context,
          titles: Text(
            'Term & Condition',
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
              color: MyColor.neutral100,
              size: AdaptSize.pixel16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: AdaptSize.pixel16,
            right: AdaptSize.pixel16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Term & Condition Better Space',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: AdaptSize.pixel16),
              ),
              SizedBox(
                height: AdaptSize.pixel8,
              ),
              Text(
                'The following terms of service ("Terms of Service") govern your use of our website ("Site"), our Better Space mobile application ("Desktop Application"), and any related services (together with the Better Space Site and App, "Services ") provided by Better Space. (“we”, “us”, or “Better Space”). By accessing, using, or participating in the Service, you ("you" or "User" agree to be bound by these Terms of Service. We can change, add, or delete parts of these Terms of Service, at any time. If you do not agree with the Terms this Service, you must stop using the Service. The user is a Guest or Employer, as defined below. If we change these Terms of Service, we will post a notification that we have made changes to these Terms of Service on the Site at least 7 days after the changes are posted and will indicate at the bottom of the Terms of Service the date these terms were last revised. Any revisions to these Terms of Service will take effect no earlier than (i) the end of the 7 day period or (ii) the first time you access or use the Service after those changes were posted. If you do not agree to comply with these Terms of Service, you are not authorized to use right, access, or participate in (or continue to use, access, or participate in) the Services.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: AdaptSize.screenHeight * .014),
                textAlign: TextAlign.justify,
              ),
              Text(
                'SERVICES PROVIDED THROUGH ONLINE PLATFORMS THROUGH HOSTS (DEFINED BELOW) CAN LEARN ABOUT AND BOOK WORKSPACES DIRECTLY WITH THE HOSTS. YOU UNDERSTAND AND AGREE THAT BETTER SPACE IS NOT A PARTY TO ANY AGREEMENT MADE BETWEEN THE HOST AND THE GUEST, BETTER SPACE IS NOT A BROKER, AGENT OR GUARANTEE OF REAL ESTATE. WHEN THE GUEST AND THE HOST AGREE TO THE AGREEMENT, THEY DO SO ON THE TERMS OFFERED BY THE HOST AND ACCEPTED OR NEGOTIATED BY THE GUEST, WHICH INCLUDE THE MINIMUM OF THE TERMS OFFERED IN THE HOST LIST. BETTER SPACE HAS NO CONTROL OVER THE CONDUCT OF HOSTS, EMPLOYERS AND GUESTS USING THE SERVICES OR ANY WORKSPACE, AND DISCLAIMS ALL LIABILITY IN THESE TO THE FULLEST EXTENT PERMITTED BY LAW.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: AdaptSize.screenHeight * .014),
                textAlign: TextAlign.justify,
              ),
              Text(
                'These Terms of Service include your release from all claims for damages against us that may arise from your use of the Service. By accessing or using the Service, you agree to this release.',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: AdaptSize.screenHeight * .014),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: AdaptSize.pixel8,
              ),
              Text(
                'Last revised on November 20, 2022',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: AdaptSize.screenHeight * .014),
              ),
              SizedBox(
                height: AdaptSize.pixel8,
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/svg_assets/logo.svg',
                  height: AdaptSize.screenHeight * .08,
                ),
              ),
              SizedBox(
                height: AdaptSize.screenHeight * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}