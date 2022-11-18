import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerView extends StatelessWidget {
  const QrCodeScannerView(
      {Key? key, required this.qrKey, required this.onQRViewCreated})
      : super(key: key);
  final GlobalKey qrKey;
  final void Function(QRViewController) onQRViewCreated;

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderWidth: 15.0,
        borderLength: 70.0,
        borderRadius: 15.0,
        borderColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
