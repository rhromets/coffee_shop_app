import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeDetailPage extends StatelessWidget {
  const CoffeeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 100,
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset('assets/icons/arrow-left.svg'),
                            const RegularText(
                              text: 'Detail',
                              isBold: true,
                              size: 16,
                            ),
                            SvgPicture.asset('assets/icons/heart.svg'),
                          ],
                        ),
                        const SizedBox(height: 26),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(kRadius16),
                          child: Image.asset(
                            'assets/images/coffee-2.png',
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const RegularText(
                          text: 'Caffe Mocha',
                          isBold: true,
                          size: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(text: 'Ice/Hot'),
                            Row(
                              children: [
                                SuperiorityTag(
                                    iconPath: 'assets/icons/bike.png'),
                                SizedBox(width: 12),
                                SuperiorityTag(
                                    iconPath: 'assets/icons/bean.png'),
                                SizedBox(width: 12),
                                SuperiorityTag(
                                    iconPath: 'assets/icons/milk.png'),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/star-filled.svg',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            const RegularText(
                              text: '4.8',
                              size: 16,
                              isBold: true,
                            ),
                            const SizedBox(width: 4),
                            const SmallText(
                              text: '(230)',
                              height: 1.6,
                            ),
                          ],
                        ),
                        const DividerHorizontal(
                          horizontalMargin: 20,
                          verticalMargin: 16,
                        ),
                        const RegularText(
                          text: 'Description',
                          size: 16,
                          isBold: true,
                        ),
                        const SizedBox(height: 8),
                        const SmallText(
                          text:
                              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                          size: 14,
                          height: 1.4,
                        ),
                        const RegularText(
                          text: 'Read More',
                          color: kBrownColor,
                          isBold: true,
                        ),
                        const SizedBox(height: 24),
                        const RegularText(
                          text: 'Size',
                          size: 16,
                          isBold: true,
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          children: [
                            ChoiceCoffeeSize(text: 'S'),
                            SizedBox(width: 20),
                            ChoiceCoffeeSize(
                              text: 'M',
                              isSelected: true,
                            ),
                            SizedBox(width: 20),
                            ChoiceCoffeeSize(text: 'L'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kRadius16),
                    topRight: Radius.circular(kRadius16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(
                          text: 'Price',
                          size: 14,
                          height: 1.4,
                        ),
                        RegularText(
                          text: '\$ 4.53',
                          color: kBrownColor,
                          isBold: true,
                          size: 18,
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 220,
                      decoration: BoxDecoration(
                        color: kBrownColor,
                        borderRadius: BorderRadius.circular(kRadius16),
                      ),
                      child: const RegularText(
                        text: 'Buy Now',
                        color: Colors.white,
                        size: 16,
                        isBold: true,
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
