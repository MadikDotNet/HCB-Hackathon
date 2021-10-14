import 'package:flutter/material.dart';

Future<void> openSuccessDialog(BuildContext context,
        {String message = "Успешно", bool disappear = true}) =>
    _alertDialog(context, message, disappear);

Future<void> openFailureDialog(BuildContext context,
        {String message = "Неверный логин или пароль",
        bool disappear = false}) =>
    _alertDialog(context, message, disappear);

Future<void> _alertDialog(
    BuildContext context, String message, bool disappear) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        if (disappear) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.of(context).pop();
          });
        }

        return AlertDialog(
          content: Text(message),
        );
      });
}
