import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/features/borrow_book/presentation/widgets/qr_scanner_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanBookPage extends StatefulWidget {
  const ScanBookPage({Key? key}) : super(key: key);

  @override
  State<ScanBookPage> createState() => _ScanBookPageState();
}

class _ScanBookPageState extends State<ScanBookPage> {
  final _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          QrCodeScannerView(
            qrKey: _qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
        ],
      ),
    );
  }
}