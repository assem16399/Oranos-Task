import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oranos/features/profile/presentation/screens/profile_tab.dart';
import 'package:oranos/features/wallet/presentation/screens/wallet_tab.dart';

import '/features/favorites/presentation/screens/favorites_tab.dart';
import '/features/home/presentation/screens/home_tab.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final _tabs = [
    const HomeTab(),
    const FavoritesTab(),
    const WalletTab(),
    const ProfileTab(),
  ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FractionallySizedBox(
          heightFactor: 0.4,
          child: CircleAvatar(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                'https://react.semantic-ui.com/images/avatar/large/elliot.jpg',
              ),
            ),
          ),
        ),
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'FacebookSans',
            ),
            children: [
              TextSpan(
                text: 'Oranos',
              ),
              TextSpan(text: '.', style: TextStyle(color: Color(0xff16919B))),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search_icon.svg'))
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/home_icon.svg',
              height: 25,
            ),
            icon: SvgPicture.asset('assets/icons/home_icon.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/star_icon.svg',
              height: 25,
            ),
            icon: SvgPicture.asset('assets/icons/star_icon.svg'),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/wallet_icon.svg',
              height: 25,
            ),
            icon: SvgPicture.asset('assets/icons/wallet_icon.svg'),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              height: 25,
            ),
            icon: SvgPicture.asset('assets/icons/profile_icon.svg'),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
