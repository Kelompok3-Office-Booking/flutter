import 'package:betterspace/src/dummy_data/office_dummy_data.dart';
import 'package:betterspace/src/dummy_data/office_dummy_models.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfficeDetailScreen extends StatefulWidget {
  late String officeID;
  OfficeDetailScreen({super.key, required this.officeID});

  @override
  State<OfficeDetailScreen> createState() => _OfficeDetailScreenState();
}

class _OfficeDetailScreenState extends State<OfficeDetailScreen> {
  List<OfficeModels> listOfDummyOffice = OfficeDataDummy().listOfOfficeModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: AdaptSize.screenWidth * .016,
          right: AdaptSize.screenWidth * .016,
          top: AdaptSize.paddingTop,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image header
            Container(
              height: AdaptSize.screenWidth / 1.3,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage('assets/image_assets/space_image/space1.png'),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        context.read<NavigasiViewModel>().navigasiPop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: AdaptSize.screenHeight * .024,
                        color: MyColor.neutral900,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bookmark_outline,
                        size: AdaptSize.screenHeight * .024,
                        color: MyColor.neutral900,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            /// image bawahnya header
            SizedBox(
              height: AdaptSize.screenWidth / 3.5,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: AdaptSize.pixel8),
                    child: SizedBox(
                      height: AdaptSize.screenWidth / 3.5,
                      width: AdaptSize.screenWidth / 3.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: const Image(
                          image: AssetImage(
                              "assets/image_assets/space_image/space1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            /// text header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.officeID,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  width: AdaptSize.screenWidth / 7.2,
                  height: AdaptSize.screenWidth / 15,
                  decoration: BoxDecoration(
                    color: MyColor.neutral300,
                    border: Border.all(width: 1, color: MyColor.neutral300),
                    borderRadius: BorderRadius.circular(42),
                  ),
                  child: Stack(
                    children: [
                      /// penilaian
                      Positioned(
                        top: AdaptSize.pixel4,
                        bottom: AdaptSize.pixel4,
                        right: AdaptSize.pixel8,
                        left: AdaptSize.pixel6,
                        child: SizedBox(
                          height: AdaptSize.pixel16,
                          width: AdaptSize.pixel34,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: MyColor.starYellow,
                                size: AdaptSize.pixel16,
                              ),
                              Text(
                                "0.0",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: MyColor.neutral900,
                                        fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            /// keterangan lokasi
            Row(
              children: [
                Icon(
                  Icons.domain,
                  color: MyColor.neutral100,
                  size: AdaptSize.screenHeight * .024,
                ),
                SizedBox(
                  width: AdaptSize.screenWidth * .005,
                ),
                Text(
                  "Tebet, South Jakarta",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: MyColor.neutral100),
                ),
              ],
            ),

            /// keterangan jarak lokasi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// location
                IconWithLabel().asrow(
                    usedIcon: Icon(
                      Icons.location_on_outlined,
                      size: AdaptSize.screenHeight * .024,
                    ),
                    labelText: Text("50m",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColor.neutral100,
                            )),
                    spacer: AdaptSize.pixel4),

                /// location 2
                IconWithLabel().asrow(
                    usedIcon: Icon(
                      Icons.location_on_outlined,
                      size: AdaptSize.screenHeight * .024,
                    ),
                    labelText: Text("10m2",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColor.neutral100,
                            )),
                    spacer: AdaptSize.pixel4),

                /// location 3
                IconWithLabel().asrow(
                    usedIcon: Icon(
                      Icons.person_outline,
                      size: AdaptSize.screenHeight * .024,
                    ),
                    labelText: Text("350",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColor.neutral100,
                            )),
                    spacer: AdaptSize.pixel4),

                /// loccation 4
                IconWithLabel().asrow(
                    usedIcon: Icon(
                      Icons.access_time,
                      size: AdaptSize.screenHeight * .024,
                    ),
                    labelText: Text("08:00-11:00",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: MyColor.neutral100,
                            )),
                    spacer: AdaptSize.pixel4),
              ],
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            /// deskripsi
            Text(
              "Description",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyColor.neutral100,
                  fontSize: AdaptSize.dynamicBodyTextMedium,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AdaptSize.pixel8,
            ),
            Text(
              listOfDummyOffice[int.parse(widget.officeID) - 1]
                  .officeDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: MyColor.neutral200),
              overflow: TextOverflow.visible,
              textAlign: TextAlign.justify,
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            Text(
              "Capacity",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyColor.neutral100,
                  fontSize: AdaptSize.dynamicBodyTextMedium,
                  fontWeight: FontWeight.bold),
            ),

            /// list capacity
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: AdaptSize.pixel8),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            /// icon
                            Padding(
                              padding: EdgeInsets.only(right: AdaptSize.pixel8),
                              child: Icon(
                                CupertinoIcons
                                    .rectangle_arrow_up_right_arrow_down_left,
                                color: MyColor.secondary400,
                                size: AdaptSize.screenHeight * .02,
                              ),
                            ),

                            /// text keterangan
                            Text(
                              "Can Accomodate",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: MyColor.neutral200),
                            ),
                            const Spacer(),

                            /// detail person
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "120",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: MyColor.secondary400,
                                            fontSize: AdaptSize.pixel16),
                                  ),
                                  TextSpan(
                                    text: "person",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: MyColor.neutral200),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        dividerWdiget(width: double.infinity, opacity: .1),
                      ],
                    );
                  },
                ),
              ),
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            Text(
              "Facilities",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyColor.neutral100,
                  fontSize: AdaptSize.dynamicBodyTextMedium,
                  fontWeight: FontWeight.bold),
            ),

            /// list fasilitas
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text('Ini nanti tak kerjain'),
            ),
            SizedBox(
              height: AdaptSize.pixel8,
            ),

            Text(
              "Address",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyColor.neutral100,
                  fontSize: AdaptSize.dynamicBodyTextMedium,
                  fontWeight: FontWeight.bold),
            ),

            /// fitur google maps
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text('fitur Google maps'),
            ),

            SizedBox(
              height: AdaptSize.pixel8,
            ),

            Text(
              "Review",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: MyColor.neutral100,
                  fontSize: AdaptSize.dynamicBodyTextMedium,
                  fontWeight: FontWeight.bold),
            ),

            /// review
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text('Fitur ripiu'),
            ),

            /// total harga
            Container(
              height: 100,
              width: double.infinity,
              margin: EdgeInsets.only(top: AdaptSize.pixel8),
              color: Colors.redAccent,
              alignment: Alignment.center,
              child: const Text('total harga'),
            ),
          ],
        ),
      ),
    );
  }
}
