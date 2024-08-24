import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String cardSubtitle;
  final String price;
  final String raiting;

  const CoffeeCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.cardSubtitle,
    required this.price,
    required this.raiting,
  });

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160,
        height: 240,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kRadius16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius12),
                  child: Image.network(
                    widget.imageUrl,
                    width: 144,
                    height: 128,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: 51,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(125, 49, 49, 49),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          topRight: Radius.circular(kRadius12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star-filled.svg',
                            width: 12,
                            height: 12,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.raiting,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            RegularText(
              text: widget.name,
              size: 16,
              isBold: true,
            ),
            const SizedBox(height: 6),
            SmallText(
              text: widget.cardSubtitle,
              color: kDarkSecondaryColor,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RegularText(
                  text: '\$ ${widget.price}',
                  size: 18,
                  isBold: true,
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: kBrownColor,
                    borderRadius: BorderRadius.circular(kRadius8),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
