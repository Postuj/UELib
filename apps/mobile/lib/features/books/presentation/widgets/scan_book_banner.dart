import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/di/injection.dart';

class ScanBookBanner extends StatelessWidget {
  const ScanBookBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: GestureDetector(
        onTap: () => getIt<AppRouter>().push(const ScanBookRoute()),
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/recomendations.png'),
                fit: BoxFit.cover,
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan book',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Scan book's QR code to borrow it!",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Image(
                    image:
                        Svg('assets/items/book.svg', size: Size(130.0, 130.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
