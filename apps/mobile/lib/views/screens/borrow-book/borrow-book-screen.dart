import 'package:flutter/material.dart';
import 'package:mobile/views/common/or-separator.dart';
import 'package:mobile/views/screens/borrow-book/widgets/book-prop.dart';

class BorrowBookScreen extends StatefulWidget {
  const BorrowBookScreen({Key? key}) : super(key: key);

  @override
  State<BorrowBookScreen> createState() => _BorrowBookScreenState();
}

class _BorrowBookScreenState extends State<BorrowBookScreen> {
  final Color color = const Color(0xffEADEDE);

  bool _isBorrowed = false;
  bool _isLoading = false;

  void _onBorrowClick() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isBorrowed = true;
      _isLoading = false;
    });

    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isBorrowed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isBorrowed ? "Now it's yours!" : "Got it!",
              style: Theme.of(context).textTheme.headline2,
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              clipBehavior: Clip.hardEdge,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    BookProp(
                      label: 'Title',
                      value: 'Clean code',
                    ),
                    Divider(
                      color: Color(0xffEADEDE),
                    ),
                    BookProp(
                      label: 'Author',
                      value: 'Robert C. Martin',
                    ),
                    Divider(
                      color: Color(0xffEADEDE),
                    ),
                    BookProp(
                      label: 'Published At',
                      value: '01/08/2022',
                    ),
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              crossFadeState: _isLoading
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
              firstChild: Column(
                children: [
                  if (!_isBorrowed)
                    ElevatedButton(
                      onPressed: _onBorrowClick,
                      child: Text(
                        'Borrow',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  if (!_isBorrowed) const OrSeparator(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      _isBorrowed ? 'Home' : 'Cancel',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
              secondChild: const SizedBox(
                width: double.infinity,
                height: 50.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
