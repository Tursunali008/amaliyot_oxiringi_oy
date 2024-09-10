import 'package:flutter/material.dart';

class AppDialogs {
  static bool _isLoading = false;

  static void showLoading(BuildContext context) {
    _isLoading = true;
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    if (_isLoading) {
      Navigator.of(context, rootNavigator: true).pop();
      _isLoading = false;
    }
  }
}
