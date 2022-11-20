import 'package:injectable/injectable.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/borrow_book/usecases/borrow_book_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<BorrowBookUsecase>(),
])
import 'borrow_book_test_module.mocks.dart';

@module
abstract class BorrowBookTestModule {
  @testEnv
  BorrowBookUsecase get getBorrowBookUsecase => MockBorrowBookUsecase();
}
