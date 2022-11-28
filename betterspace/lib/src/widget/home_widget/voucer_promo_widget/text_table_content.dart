import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/widget/widget/divider_widget.dart';
import 'package:flutter/material.dart';

Widget textTableContent({
  TextStyle? titleTextStyle,
  TextStyle? contentTextStyle,
  String? text1,
  text2,
  text3,
  text4,
  text5,
  bool? t5,
}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(
        AdaptSize.screenWidth * .022,
        AdaptSize.screenHeight * .005,
        AdaptSize.screenWidth * .022,
        AdaptSize.screenHeight * .02),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// divider
        Center(
          child: dividerWdiget(
            width: AdaptSize.screenWidth * 0.1,
            opacity: .4,
          ),
        ),

        t5!
            ? Text(
                'Terms and Condition',
                style: titleTextStyle,
              )
            : Text(
                'How To',
                style: titleTextStyle,
              ),

        SizedBox(
          height: AdaptSize.screenHeight * 0.01,
        ),

        ///text content
        Table(
          columnWidths: const {1: FractionColumnWidth(.95)},
          children: [
            TableRow(
              children: [
                Text(
                  '1',
                  style: contentTextStyle,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight * .007),
                  child: Text(
                    text1!,
                    style: contentTextStyle,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '2',
                  style: contentTextStyle,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight * .007),
                  child: Text(
                    text2!,
                    style: contentTextStyle,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '3',
                  style: contentTextStyle,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(bottom: AdaptSize.screenHeight * .007),
                  child: Text(
                    text3!,
                    style: contentTextStyle,
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Text(
                  '4',
                  style: contentTextStyle,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: AdaptSize.screenHeight * .007,
                  ),
                  child: Text(
                    text4!,
                    style: contentTextStyle,
                  ),
                ),
              ],
            ),
            t5
                ? TableRow(
                    children: [
                      Text(
                        '5',
                        style: contentTextStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: AdaptSize.screenHeight * .007,
                        ),
                        child: Text(
                          text5,
                          style: contentTextStyle,
                        ),
                      ),
                    ],
                  )
                : const TableRow(
                    children: [
                      Text(''),
                      Text(''),
                    ],
                  ),
          ],
        ),

        SizedBox(
          height: AdaptSize.screenHeight * 0.15,
        ),
      ],
    ),
  );
}
