import 'dart:convert';
import 'package:coffee_shop_app/constants/constants.dart';
import 'package:coffee_shop_app/fetch_data/coffee.dart';
import 'package:coffee_shop_app/widgets/coffee_card.dart';
import 'package:coffee_shop_app/widgets/promo_title.dart';
import 'package:coffee_shop_app/widgets/widgets.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Coffee> list = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  var url = Uri.https('raw.githubusercontent.com',
      '/rhromets/mock_json_data/main/coffee_fake_api.json');

  Future _fetchData() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          list = (json.decode(response.body) as List)
              .map((data) => Coffee.fromJson(data))
              .toList();
        });
      } else {
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('General Error Exception');
    }
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshIndicatorKey.currentState?.show();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: kDarkSecondaryColor,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
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
                                  borderRadius:
                                      BorderRadius.circular(kRadius12),
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
                              image:
                                  AssetImage('assets/images/banner-promo.png'),
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
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: _fetchData,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          buildCoffeeTag('Espresso'),
                          buildCoffeeTag('Corretto'),
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
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return CoffeeCard(
                            name: list[index].name,
                            price: list[index].price,
                            raiting: list[index].raiting,
                            imageUrl: list[index].imageUrl,
                            cardSubtitle: list[index].cardSubtitle,
                          );
                        },
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
