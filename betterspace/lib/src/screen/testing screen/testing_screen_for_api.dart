import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
import 'package:betterspace/src/view_model/office_viewmodels.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TestingScreenAPI extends StatefulWidget {
  const TestingScreenAPI({super.key});

  @override
  State<TestingScreenAPI> createState() => _TestingScreenAPIState();
}

class _TestingScreenAPIState extends State<TestingScreenAPI> {
  @override
  void initState() {
    final providerClient = Provider.of<LoginViewmodels>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerClient = Provider.of<LoginViewmodels>(context, listen: false);
    final providerClientListen =
        Provider.of<LoginViewmodels>(context, listen: true);

    final providerOffice =
        Provider.of<OfficeViewModels>(context, listen: false);
    final providerOfficeListen =
        Provider.of<OfficeViewModels>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //login panggil method loginGetToken dan masukan parameter
                    providerClient.loginGetToken(
                        userEmail: "abimanyutest23@gmail.com",
                        userPassword: "testtest2");
                  },
                  child: Text("login"),
                ),
                ElevatedButton(
                  onPressed: () {
                    //get profile hanya bisa dipakai ketika user sudah login
                    providerClient.getProfile();
                  },
                  child: Text("get_profile"),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchAllOffice();
                  },
                  child: Text("get office"),
                ),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeById(officeId: 2.toString());
                  },
                  child: Text("get office by id"),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                //logout hanya bisa digunakan ketika user sudah login
                await providerClient.logoutWithTokens();

                //destroy data office hanya bisa digunakan ketika user sudah logout
                await providerOffice.destroyDataWhenlogout();
              },
              child: Text("logout"),
            ),
            Text(providerClient.statusConnection),
            Expanded(
              child: Consumer<LoginViewmodels>(
                builder: ((context, value, child) {
                  return Text(providerClientListen.isUserExist != false
                      ? providerClientListen.userTokens!.accessToken +
                          " user exist"
                      : "-");
                }),
              ),
            ),
            Expanded(
              child: Consumer<LoginViewmodels>(
                builder: ((context, value, child) {
                  if (providerClientListen.isUserExist != false) {
                    if (providerClientListen.apiLoginState ==
                            stateOfConnections.isStart ||
                        providerClientListen.apiLoginState ==
                            stateOfConnections.isLoading) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(providerClientListen.userModels != null
                          ? providerClientListen.userModels!.userEmail
                                  .toString() +
                              " user exist"
                          : "-");
                    }
                  } else {
                    return Text("no data");
                  }
                }),
              ),
            ),
            Expanded(
              child: Consumer<OfficeViewModels>(
                builder: ((context, value, child) {
                  if (providerOfficeListen.isUserExist != false) {
                    return ListView.builder(
                        itemCount:
                            providerOfficeListen.listOfAllOfficeModels.length,
                        itemBuilder: ((context, index) {
                          final dataChunks =
                              providerOfficeListen.listOfAllOfficeModels[index];
                          return Text(dataChunks.officeName);
                        }));
                  } else {
                    return Text("no data");
                  }
                }),
              ),
            ),
            Expanded(
              child: Consumer<OfficeViewModels>(
                builder: ((context, value, child) {
                  if (providerOfficeListen.isUserExist != false &&
                      providerOfficeListen.officeModelById != null) {
                    final modelContain = providerOfficeListen.officeModelById;
                    return Text(modelContain!.officeID.toString());
                  } else {
                    return Text("no data");
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
