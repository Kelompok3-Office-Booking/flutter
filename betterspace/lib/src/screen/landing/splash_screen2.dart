import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key? key}) : super(key: key);

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    final providerOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    final providerClient = Provider.of<LoginViewmodels>(context, listen: false);
    if (providerClient.isUserExist == true) {
      Future.delayed(Duration.zero, (){
        providerClient.getProfile();
        providerOffice.fetchAllOffice();
        providerOffice.fetchCoworkingSpace();
        providerOffice.fetchMeetingRoom();
        providerOffice.fetchOfficeRoom();
        providerOffice.fetchOfficeByRecommendation();
      });
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        Provider.of<NavigasiViewModel>(context, listen: false)
            .navigasiToMenuScreen(context);
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        Provider.of<NavigasiViewModel>(context, listen: false)
            .navigasiToOnboardingView(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.whiteColor,
    );
  }
}
