import 'package:flutter/material.dart';
import 'package:photon/components/snackbar.dart';
import 'package:photon/methods/methods.dart';
import 'package:open_settings_plus/open_settings_plus.dart';
import 'package:photon/views/receive_ui/qr_scan.dart';

class HandleShare {
  BuildContext context;

  HandleShare({required this.context});

  Future<void> onNormalScanTap() async {
    getIP().then((value) async {
      if(!context.mounted) return;
      if (value.isNotEmpty) {
        Navigator.of(context).pushNamed('/receivepage');
      } else {
        Navigator.of(context).pop();
        showSnackBar(
            context, 'Please connect to wifi / hotspot same as that of sender');
        await Future.delayed(
          const Duration(seconds: 2),
        );
        const OpenSettingsPlusAndroid().wifi();
      }
    });
  }

  void onQrScanTap() {
    getIP().then((value) async {
      if(!context.mounted) return;
      if (value.isNotEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const QrReceivePage(),
          ),
        );
      } else {
        Navigator.of(context).pop();
        showSnackBar(
            context, 'Please connect to wifi / hotspot same as that of sender');
        await Future.delayed(
          const Duration(seconds: 2),
        );
        const OpenSettingsPlusAndroid().wifi();
      }
    });
  }
}
