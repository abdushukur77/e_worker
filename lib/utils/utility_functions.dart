import 'package:e_worker/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showSnackbar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(1), topLeft: Radius.circular(1))),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.urbanistSemiBold
            .copyWith(fontSize: 32, color: Colors.white),
      ),
    ),
  );
}

showErrorForRegister(
  String code,
  BuildContext context,
) {
  if (code == 'weak-password') {
    debugPrint('The password provided is too weak.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'email-already-in-use') {
    debugPrint('The account already exists for that email.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Bu e-pochta uchun hisob allaqachon mavjud.",
    );
  }
}

showErrorForLogin(
  String code,
  BuildContext context,
) {
  if (code == 'wrong-password') {
    debugPrint('The password provided is wrong.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Passwordni xato kiritdingiz",
    );
  } else if (code == 'invalid-email') {
    debugPrint('The e-mail is invalid.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Bu e-pochta yaqroqsiz.",
    );
  } else if (code == 'user-disabled') {
    debugPrint('The user is blocked.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Foydalanuvchi bloklangan.",
    );
  } else {
    debugPrint('The user is not found.');
    if (!context.mounted) return;
    showSnackbar(
      context: context,
      message: "Foydalanuvchi topilmadi.",
    );
  }
}

String formatDateTime(String input) {
  // Stringni DateTime formatiga o'girish
  DateTime dateTime = DateTime.parse(input);

  // Kutilgan formatni yaratish
  DateFormat formatter = DateFormat('EEEE, MMMM dd yyyy');
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

void main() {
  String input = '2024-06-01 00:00:00.000';
  String output = formatDateTime(input);
  debugPrint(output); // Output: Saturday, June 01 2024
}

