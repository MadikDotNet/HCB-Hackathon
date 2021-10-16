import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeGenerator extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          QrImage(
            data: 'This is a simple QR code',
            version: QrVersions.auto,
            size: 320,
            gapless: false,
          )
        ],
      ),
    );
  }
}
