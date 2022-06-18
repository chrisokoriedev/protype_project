import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protype_project/custom/styles.dart';
import 'package:protype_project/view/cart_section/cart_screen.dart';
import 'package:protype_project/view/pharmacy.dart';
import 'package:protype_project/view/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var cart=FlutterCart();
  int _selectedIndex = 2;
  static const List<Widget> _screen = [
    HomePage(),
    HomePage(),
    Pharmacy(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen.elementAt(_selectedIndex),
      floatingActionButton: InkWell(
        onTap: ()=>Get.to(const CartScreen()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 135.w,
              height: 43.h,
              decoration: BoxDecoration(
                  border: Border.all(color: whiteColor, width: 3.0),
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xffFE806F),
                      Color(0xffE5366A),
                    ],
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: whiteColor,
                      size: 20.sp,
                    ),
                  ),
                  Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: const BoxDecoration(
                          color: Color(0xffF2C94C), shape: BoxShape.circle),
                      child:  Center(
                          child: Text(
                        cart.getCartItemCount().toString(),
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      )))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Pharmacy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 13.sp,
        unselectedFontSize: 12.sp,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: kPrimaryColor,
        iconSize: 25,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
