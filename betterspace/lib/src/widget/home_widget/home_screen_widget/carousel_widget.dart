import 'package:betterspace/src/model/data/promo_data.dart';
import 'package:betterspace/src/model/promo_model.dart';
import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget carouselWidget(){
  return SizedBox(
    height: AdaptSize.screenHeight * .139,
    width: double.infinity,
    child: CarouselSlider.builder(
      itemCount: promo.length,
      itemBuilder: (context, index, img) {
        final PromoModel promotion = promo[index];
        return Padding(
          padding: const EdgeInsets.only(
            left: 2.5,
            right: 2.5,
          ),
          child: Image.asset(
            promotion.imagePromo,
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: .62,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    ),
  );
}