import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/borrow_book/presentation/widgets/borrow_book_form.dart';
import 'package:mobile/features/borrow_book/presentation/widgets/qr_scanner_view.dart';

import '../bloc/borrow_book_bloc.dart';

class ScanBookPage extends StatelessWidget {
  const ScanBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<BorrowBookBloc>(),
        child: BlocBuilder<BorrowBookBloc, BorrowBookState>(
          builder: (context, state) {
            if (state is BorrowBookScanningState) {
              return Stack(
                children: const [
                  QrCodeScannerView(),
                ],
              );
            } else if (state is BorrowBookErrorState) {
              return const Center(
                child: Text(
                  'An error occured',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else if (state is BorrowBookLoadingState ||
                state is BorrowBookLoadedState) {
              return AnimatedCrossFade(
                firstChild: const Center(
                  child: CircularProgressIndicator(),
                ),
                secondChild: _buildBorrowBookForm(state),
                crossFadeState: state is BorrowBookLoadingState
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 200),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildBorrowBookForm(BorrowBookState state) {
    if (state is BorrowBookLoadedState) {
      return BorrowBookForm(state: state);
    }
    return const SizedBox();
  }
}
