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

isLogoutSuccess({
  required BuildContext context,
  required String logoutStatusCode,
  required stateOfConnections logoutConnectionState,
}) {
  if (logoutConnectionState != stateOfConnections.isFailed ||
      logoutStatusCode == "200") {
    Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiLogout(context);
  } else {
    dynamic snackbar;
    if (logoutStatusCode == "400") {
      snackbar =
          SnackBar(content: Text("logout error, sesi anda telah berakhir"));
    } else {
      snackbar = SnackBar(
          content: Text("logout error, kesalahan yang tidak diketahui"));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

isRegisterSuccess({
  required stateOfConnections stateOfRegister,
  required BuildContext context,
  required String registerStatus,
}) {
  if (stateOfRegister != stateOfConnections.isFailed) {
    Provider.of<NavigasiViewModel>(context, listen: false)
        .navigasiToLoginScreen(context);
  } else {
    dynamic snackbar;
    if (registerStatus == "400") {
      snackbar = SnackBar(
          content: Text(
              "register gagal, user telah digunakan atau email anda tidak valid"));
    } else {
      snackbar = SnackBar(
          content: Text("register gagal, kesalahan yang tidak diketahui"));
    }
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    return;
  }
}
