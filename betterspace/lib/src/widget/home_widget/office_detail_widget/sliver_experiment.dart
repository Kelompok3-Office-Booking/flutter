import 'package:betterspace/src/utils/adapt_size.dart';
import 'package:betterspace/src/utils/colors.dart';
import 'package:betterspace/src/widget/widget/icon_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sliver_Experiment extends StatefulWidget {
  const Sliver_Experiment({super.key});

  @override
  State<Sliver_Experiment> createState() => _Sliver_ExperimentState();
}

class _Sliver_ExperimentState extends State<Sliver_Experiment> {
  @override
  Widget build(BuildContext context) {
    AdaptSize.size(context: context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverAppBar(), SliverToBoxAdapter(child: Container())],
      ),
    );
  }
}
