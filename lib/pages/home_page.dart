import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/widgets/coffee_card.dart';
import 'package:coffee_shop_app/widgets/promo_title.dart';
import 'package:coffee_shop_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kDarkSecondaryColor,
                      Color(0xFF161616),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SmallText(text: 'Location'),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const RegularText(
                            text: 'Bilzen, Tanjungbalai',
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/icons/drop-down-arrow.svg',
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: kDarkSecondaryColor,
                                borderRadius: BorderRadius.circular(kRadius12),
                              ),
                              child: TextField(
                                style: const TextStyle(
                                  color: kGreyColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search coffee',
                                  hintStyle: const TextStyle(
                                    color: kGreyColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                  ),
                                  icon: SvgPicture.asset(
                                    'assets/icons/search.svg',
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: kBrownColor,
                              borderRadius: BorderRadius.circular(kRadius12),
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/filter.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 140,
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(vertical: 24),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(kRadius16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/banner-promo.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(kRadius8),
                                color: kPromoColor,
                              ),
                              child: const RegularText(
                                text: 'Promo',
                                color: Colors.white,
                                isBold: true,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Column(
                              children: [
                                PromoTitle(
                                  text: 'Buy one get',
                                  widthText: 200,
                                ),
                                PromoTitle(
                                  text: 'one FREE',
                                  widthText: 155,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      buildCoffeeSelectedTag('All Coffee'),
                      buildCoffeeTag('Machiato'),
                      buildCoffeeTag('Latte'),
                      buildCoffeeTag('Americano'),
                      buildCoffeeTag('Americano'),
                      buildCoffeeTag('Americano'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 310,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 160 / 240,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const Center(
                        child: CoffeeCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildCoffeeSelectedTag(String name) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: kBrownColor,
        borderRadius: BorderRadius.circular(kRadius6),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: RegularText(
        text: name,
        color: Colors.white,
        isBold: true,
      ),
    );
  }

  buildCoffeeTag(String name) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: kGreyLightColor,
        borderRadius: BorderRadius.circular(kRadius6),
      ),
      child: RegularText(text: name),
    );
  }
}
