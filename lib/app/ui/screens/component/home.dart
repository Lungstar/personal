import 'dart:async';

import 'package:flutter/material.dart';
import 'package:solution/app/core/constants/constant.dart';

import '../../../core/utils/nav_widget.dart';
import '../../../core/utils/trivia_card_widget.dart';
import '../../../route/route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    _timer = Timer.periodic(const Duration(seconds: 20), (Timer timer) {
      if (_currentPage < Constants.triviaFacts.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.appTitle),
      ),
      body: ListView(
        children: [
          const NavigateMenuItem(
              title: Constants.houses,
              icon: Icons.house,
              routeName: AppRoutes.houses),
          const NavigateMenuItem(
              title: Constants.spells,
              icon: Icons.spellcheck,
              routeName: AppRoutes.spells),
          const NavigateMenuItem(
              title: Constants.elixirs,
              icon: Icons.local_drink,
              routeName: AppRoutes.elixirs),
          const NavigateMenuItem(
              title: Constants.favorites,
              icon: Icons.favorite,
              routeName: AppRoutes.favorites),
          const NavigateMenuItem(
              title: Constants.quiz,
              icon: Icons.quiz,
              routeName: AppRoutes.quiz),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              Constants.trivia,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(
            height: 120,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: Constants.triviaFacts.length,
              itemBuilder: (context, index) {
                return TriviaCard(trivia: Constants.triviaFacts[index]);
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
