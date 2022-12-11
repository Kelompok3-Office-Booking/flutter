import 'package:betterspace/src/view_model/navigasi_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

nextScreen(bool isUserExist, BuildContext context) {
  if (isUserExist == true) {
    return Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiToMenuScreen(context);
  } else {
    const snackbars =
        SnackBar(content: Text("login gagal, cek email dan password anda"));
    ScaffoldMessenger.of(context).showSnackBar(snackbars);
    return;
  }
}
