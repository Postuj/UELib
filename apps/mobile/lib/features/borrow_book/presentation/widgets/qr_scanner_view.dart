import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/features/borrow_book/presentation/bloc/borrow_book_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QrCodeScannerView extends StatefulWidget {
  const QrCodeScannerView({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerView> createState() => _QrCodeScannerViewState();
}

class _QrCodeScannerViewState extends State<QrCodeScannerView> {
  final _qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) {
      if (result != null) return;

      setState(() {
        result = scanData;
      });
      _handleScannedCode(result!.code);
    });
  }

  void _handleScannedCode(String? code) {
    if (code == null || !isUUID(code, 4)) {
      setState(() {
        result = null;
      });
      return;
    }

    context.read<BorrowBookBloc>().add(BorrowBookScannedEvent(bookId: code));
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
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
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
