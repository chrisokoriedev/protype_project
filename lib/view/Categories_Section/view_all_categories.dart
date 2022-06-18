import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../custom/styles.dart';
import '../../custom/widget.dart';
import '../../data/categories.dart';
import 'view_categories_detail.dart';

class ViewAllCategories extends StatefulWidget {
  const ViewAllCategories({Key? key}) : super(key: key);

  @override
  State<ViewAllCategories> createState() => _ViewAllCategoriesState();
}

class _ViewAllCategoriesState extends State<ViewAllCategories> {
  var cart= FlutterCart();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130.h,
              padding: kDefaultPadding,
              decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  image: DecorationImage(
                      image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          textHeader('Categories'),
                        ],
                      ),
                      Badge(
                        badgeColor: kBadgeColor,
                        badgeContent: Text(cart.getCartItemCount().toString(),style: TextStyle(color: whiteColor),),
                        child: Icon(
                          Icons.shopping_cart_checkout_rounded,
                          color: whiteColor,
                          size: 25.sp,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.4,
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryItem.length,
                        itemBuilder: (context, int index) {
                          Categories connect = categoryItem[index];
                          return GestureDetector(
                            onTap: ()=>Get.to(const ViewCategoriesDetails()),
                            child: Container(
                                width: 150.w,
                                height: 100.h,
                                margin: EdgeInsets.only(right: 16.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  image: DecorationImage(
                                    image: AssetImage(connect.imageAsset),
                                    colorFilter: const ColorFilter.mode(
                                        Colors.black38, BlendMode.darken),
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    connect.title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.sp),
                                  ),
                                )),
                          );
                        }),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
