import 'package:betterspace/src/services/api_services.dart';
import 'package:betterspace/src/utils/enums.dart';
import 'package:betterspace/src/view_model/login_viewmodel.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                providerClient.loginGetToken(
                    userEmail: "abimanyutest23@gmail.com",
                    userPassword: "testtest2");
              },
              child: Text("login"),
            ),
            ElevatedButton(
              onPressed: () {
                providerClient.getProfile();
              },
              child: Text("get_profile"),
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
          ],
        ),
      ),
    );
  }
}
