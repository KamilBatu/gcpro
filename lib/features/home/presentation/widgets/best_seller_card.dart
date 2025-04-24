import 'dart:math';

import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerCard extends StatelessWidget {
  const BestSellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius20,
          gradient: LinearGradient(
            colors: [
              kColorSchemeSeed,
              kColorSchemeSeed.withAlpha(
                (0.75 * 255).round(),
              ),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            ...List.generate(
              8,
              (index) {
                final top = sin(index * pi / 4) * 80 + 40;
                final right = cos(index * pi / 3) * 100 + 160;

                return Positioned(
                  top: top,
                  right: right,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Theme.of(context).colorScheme.surface.withAlpha(50),
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: -20,
              left: 0,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: 120,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface.withAlpha(40),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).today_s_best_seller,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Text(
                    AppLocalizations.of(context).item_x,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const Gap(24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context).view_more,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              right: 20 + 8,
              top: 30,
              child: SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.65,
                  strokeWidth: 12,
                  strokeCap: StrokeCap.round,
                  backgroundColor: Color.fromARGB(29, 255, 255, 255),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            Positioned(
              right: 45 + 10,
              top: 40,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "3,456",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context).etb,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
