import 'package:betterspace/src/utils/enums.dart';
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

isRegisterSuccess({
  required stateOfConnections stateOfRegister,
  required BuildContext context,
  required String registerStatus,
}) {
  if (stateOfRegister != stateOfConnections.isFailed ||
      stateOfRegister != stateOfConnections.isDoingNothing) {
    Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiToLoginScreen(context);
  } else {
    dynamic snackbar;
    if (registerStatus == "400") {
      snackbar =
          SnackBar(content: Text("register gagal, user telah digunakan"));
    } else {
      snackbar = SnackBar(
          content: Text("register gagal, kesalahan yang tidak diketahui"));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    return;
  }
}
