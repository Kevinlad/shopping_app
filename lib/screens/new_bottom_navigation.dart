import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/responsive.dart';
import 'package:shopping_app/screens/new_home.dart';
import 'package:shopping_app/screens/new_store.dart';
import 'package:shopping_app/screens/setting_new.dart';
import 'package:shopping_app/screens/whishlist.dart';

class NewBottom extends StatefulWidget {
  // final token;
  NewBottom(
      {
      // required this.token,
      Key? key})
      : super(key: key);

  @override
  _NewBottomState createState() => _NewBottomState();
}

class _NewBottomState extends State<NewBottom> {
  int _currentIndex = 0;
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  List<String> drawerItems = [
    "Home",
    "My Cart",
    "Whislist",
    "Account",
    "Version : 1.0.0"
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: _currentIndex == 0 ? Colors.blue : Colors.grey,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart,
          color: _currentIndex == 1 ? Colors.blue : Colors.grey,
        ),
        label: "Store",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          CupertinoIcons.heart,
          color: _currentIndex == 2 ? Colors.blue : Colors.grey,
        ),
        label: "Wishlist",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: _currentIndex == 3 ? Colors.blue : Colors.grey,
        ),
        label: "Account",
      ),
    ];
  }

  final List<Widget> _screens = [
    const NewHome(),
    const NewStore(),
    const Whishlist(),
    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
            mobile: Scaffold(
              body: PageView(
                controller: _pageController,
                onPageChanged: (newvalue) {
                  setState(() {
                    _currentIndex = newvalue;
                  });
                },
                children: const [
                  NewHome(),
                  NewStore(),
                  Whishlist(),
                  SettingScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.blue,
                items: getBottomNavigationBarItems(),
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
            desktop: Scaffold(
              backgroundColor: Colors.black54,
              body: Row(
                children: [
                  SizedBox(
                    // color: Colors.black87,
                    width: 190,
                    child: Scaffold(
                      body: Drawer(
                        child: ListView.builder(
                          itemCount: drawerItems.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(drawerItems[index]),
                              onTap: () {
                                // _getDrawerTitle(index);
                                _onItemTapped(index);
                                // mNavPoP(context);
                              },
                              selected: _selectedIndex == index,
                              selectedTileColor: Colors.blue.withOpacity(0.6),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _screens[_selectedIndex],
                  ),
                ],
              ),
            )));
  }
}
