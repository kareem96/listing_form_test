import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_listing_test/core/utils/loading_indicator.dart';

class Dialogs {
  static Future<void> showErrorDialog(BuildContext context, String errorMessage) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                dismiss(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static Future<bool?> showConfirmationDialog(BuildContext context, String message) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(message)),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true); // User chose No
                    },
                    child: const Text('Oke'),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }

  static show(BuildContext context, {bool? dismissible}) {
    return showGeneralDialog(
      context: context,
      barrierLabel: 'Barrier',
      barrierDismissible: kDebugMode,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: const PlatformLoadingIndicator(),
          ),
        );
      },
    );
  }

  static dismiss(BuildContext context) => Navigator.of(context).pop();
}
