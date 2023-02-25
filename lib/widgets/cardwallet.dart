import 'package:flutter/material.dart';

class CardWallet extends StatelessWidget {
  final String currencyName;
  final String balance;
  final String currencyCode;
  final IconData currencyIcon;
  final Color textColor;
  final Color bgColor;

  const CardWallet({
    super.key,
    required this.currencyName,
    required this.balance,
    required this.currencyCode,
    required this.currencyIcon,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyName,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      balance,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      currencyCode,
                      style: TextStyle(
                        color: textColor.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2.5,
              child: Transform.translate(
                offset: const Offset(0, 8),
                child: Icon(
                  currencyIcon,
                  color: textColor,
                  size: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
