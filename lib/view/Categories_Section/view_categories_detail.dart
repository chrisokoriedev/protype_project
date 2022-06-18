import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../custom/styles.dart';
import '../../custom/widget.dart';
import '../../data/categories.dart';
import '../../data/drug.dart';
import '../drug_detail.dart';

class ViewCategoriesDetails extends StatefulWidget {
  const ViewCategoriesDetails({Key? key}) : super(key: key);

  @override
  State<ViewCategoriesDetails> createState() => _ViewCategoriesDetailsState();
}

class _ViewCategoriesDetailsState extends State<ViewCategoriesDetails> {
  var cart = FlutterCart();

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
                              color: whiteColor,
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
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryItem.length,
                        itemBuilder: (context, int index) {
                          Categories connect = categoryItem[index];
                          return Container(
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
                              ));
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textSubHeader('SUPPLEMENTS'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: drugList.length,
                        itemBuilder: (context, int index) {
                          DrugList connect = drugList[index];
                          return GestureDetector(
                            onTap: () => Get.to(DrugDetail(
                              drugPrice: connect.drugPrice,
                              title: connect.title,
                              drugImageAsset: connect.drugImageAsset,
                              drugVolume: connect.drugVolume,
                              drugCategories: connect.drugCategories,
                              id: connect.id,
                            )),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(.25),
                                        offset: const Offset(0, 0),
                                        blurRadius: 30,
                                        spreadRadius: -20)
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 127.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.r),
                                          topRight: Radius.circular(10.r)),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(connect.drugImageAsset),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          connect.title,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              connect.drugCategories,
                                              style: TextStyle(
                                                  color: kTextGreyColor,
                                                  fontSize: 14.sp),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Icon(
                                                Icons.circle,
                                                size: 3.sp,
                                                color: kTextGreyColor
                                                    .withOpacity(0.6),
                                              ),
                                            ),
                                            Text(
                                              connect.drugVolume,
                                              style: TextStyle(
                                                  color: kTextGreyColor,
                                                  fontSize: 14.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          connect.drugPrice,
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
