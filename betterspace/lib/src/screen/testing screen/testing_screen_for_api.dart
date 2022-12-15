import 'package:betterspace/src/model/data/sample_data.dart';
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
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    //logout hanya bisa digunakan ketika user sudah login
                    await providerClient.logoutWithTokens();

                    //destroy data office hanya bisa digunakan ketika user sudah logout
                    await providerOffice.destroyDataWhenlogout();
                  },
                  child: Text("logout"),
                ),
                Spacer(),
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
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeById(officeId: "1");
                  },
                  child: Text("get office by id"),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchCoworkingSpace();
                  },
                  child: Text(
                    "get coworking",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeRoom();
                  },
                  child:
                      Text("get office room", style: TextStyle(fontSize: 10)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchMeetingRoom();
                  },
                  child:
                      Text("get meeting room", style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeByRecommendation();
                  },
                  child: Text(
                    "office by recom",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeByCity(city: "central jakarta");
                  },
                  child: Text("office by city", style: TextStyle(fontSize: 10)),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeByRating(requestedRating: "4");
                  },
                  child: Text("office by rate", style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchOfficeByOfficeTitle(
                        requestedOfficeTitle: "Update Suropati Space");
                  },
                  child: Text(
                    "office by title",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    //fetchOfficeAll hanya bisa digunakan ketika user sudah login
                    providerOffice.fetchNearestOffice(
                        latitudes: "-6.1981045", longitudes: "106.100777");
                  },
                  child: Text("nearest office", style: TextStyle(fontSize: 10)),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
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
                              itemCount: providerOfficeListen
                                  .listOfAllOfficeModels.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfAllOfficeModels[index];
                                return Text(dataChunks.officeName);
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfCoworkingSpace.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfCoworkingSpace[index];
                                return Text(dataChunks.officeType,
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount:
                                  providerOfficeListen.listOfOfficeRoom.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeRoom[index];
                                return Text(dataChunks.officeType,
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount:
                                  providerOfficeListen.listOfMeetingRoom.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfMeetingRoom[index];
                                return Text(dataChunks.officeType,
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfOfficeByRecommendation.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeByRecommendation[index];
                                return Text(
                                    dataChunks.officeStarRating.toString(),
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfOfficeByCity.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeByCity[index];
                                return Text(dataChunks.officeLocation.city,
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfOfficeByRate.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeByRate[index];
                                return Text(
                                    dataChunks.officeStarRating.toString(),
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfOfficeByTitle.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeByTitle[index];
                                return Text(dataChunks.officeName.toString(),
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Consumer<OfficeViewModels>(
                      builder: ((context, value, child) {
                        if (providerOfficeListen.isUserExist != false) {
                          return ListView.builder(
                              itemCount: providerOfficeListen
                                  .listOfOfficeByNearestPosition.length,
                              itemBuilder: ((context, index) {
                                final dataChunks = providerOfficeListen
                                    .listOfOfficeByNearestPosition[index];
                                return Text(
                                    dataChunks.officeLocation.officeLatitude
                                        .toString(),
                                    style: TextStyle(fontSize: 10));
                              }));
                        } else {
                          return Text("no data");
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<OfficeViewModels>(
                builder: ((context, value, child) {
                  if (providerOfficeListen.isUserExist != false &&
                      providerOfficeListen.officeModelById != null) {
                    final modelContain = providerOfficeListen.officeModelById;
                    return Column(
                      children: [
                        Text(modelContain!.officeID.toString()),
                        Text(providerOfficeListen.connectionState.toString())
                      ],
                    );
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
