import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:betterspace/src/widget/widget/default_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppbarWidget(
        contexts: context,
        isCenterTitle: false,
        titles: 'Add Review',
        leadIconFunction: (){
          context.read<NavigasiViewModel>().navigasiPop(context);
        }
      ),
    );
  }
}
