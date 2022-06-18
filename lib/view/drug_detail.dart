import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:protype_project/data/drug.dart';
import 'package:protype_project/view/cart_section/cart_screen.dart';

import '../custom/styles.dart';
import '../custom/widget.dart';

class DrugDetail extends StatefulWidget {
  final int id;
  final String title;
  final String drugCategories;
  final String drugVolume;
  final String drugPrice;
  final String drugImageAsset;

  const DrugDetail(
      {super.key,
      required this.title,
      required this.drugCategories,
      required this.drugVolume,
      required this.drugPrice,
      required this.drugImageAsset,
      required this.id});

  @override
  State<DrugDetail> createState() => _DrugDetailState();
}

class _DrugDetailState extends State<DrugDetail> {
  // final cartController = Get.put(CartController());
  var quantity = 1;
  var price = 350;
  var total = 350;
  var cart = FlutterCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                            textHeader('Pharmacy'),
                          ],
                        ),
                        Badge(
                          badgeColor: kBadgeColor,
                          badgeContent: Text(
                            cart.getCartItemCount().toString(),
                            style: const TextStyle(color: whiteColor),
                          ),
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
                  children: [
                    Center(
                      child: Image.asset(
                        widget.drugImageAsset,
                        // height: 170.h,
                        width: 170.w,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.drugCategories,
                          style: TextStyle(
                              color: kTextGreyColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            '-',
                            style: TextStyle(
                                color: kTextGreyColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Text(
                          widget.drugVolume,
                          style: TextStyle(
                              color: kTextGreyColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: whiteColor,
                                  child: FlutterLogo(),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SOLD BY',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: kTextGreyColor),
                                    ),
                                    Text(
                                      'Emzor Pharmaceuticals',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          color: kTextSubColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: kPrimaryColor,
                                  size: 18.sp,
                                ))
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 93.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: kGreyColor)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity == 1) {
                                            quantity = 1;
                                          } else {
                                            quantity--;
                                            total = total - price;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        size: 18.sp,
                                      )),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text(
                                      quantity.toString(),
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity == 8) {
                                            quantity = 8;
                                          } else {
                                            quantity++;
                                            total = quantity * price;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.add,
                                        size: 18.sp,
                                      )),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Text('₦'),
                                Text(
                                  total.toString(),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'PRODUCT DETAILS',
                          style: TextStyle(
                              color: const Color(0xff8EA5BC),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            medicieComponent(
                                'PACK SIZE',
                                FontAwesomeIcons.capsules,
                                '8 x 12 tablets (96)'),
                            medicieComponent('PRODUCT ID',
                                FontAwesomeIcons.qrcode, 'PRO23648856'),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            medicieComponent('CONSTITUENTS',
                                FontAwesomeIcons.tablets, 'Paracetamol'),
                            medicieComponent(
                                'DISPENSED IN',
                                FontAwesomeIcons.prescriptionBottleMedical,
                                'Packs'),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          '1 pack of Emzor Paracetamol (500mg) contains 8 units of 12 tablets.',
                          style:
                              TextStyle(color: kTextGreyColor, fontSize: 18.sp),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Similar Products',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 210.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: drugList.length,
                              itemBuilder: (context, int index) {
                                DrugList connect = drugList[index];
                                return GestureDetector(
                                  onTap: () => Get.off(DrugDetail(
                                    drugPrice: connect.drugPrice,
                                    title: connect.title,
                                    drugImageAsset: connect.drugImageAsset,
                                    drugVolume: connect.drugVolume,
                                    drugCategories: connect.drugCategories,
                                    id: connect.id,
                                  )),
                                  child: Container(
                                    width: 200.w,
                                    margin: EdgeInsets.only(right: 20.sp),
                                    decoration: BoxDecoration(
                                        color: whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.9),
                                              offset: const Offset(0, 0),
                                              blurRadius: 30,
                                              spreadRadius: -18)
                                        ]),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 127.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.r),
                                                topRight:
                                                    Radius.circular(10.r)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  connect.drugImageAsset),
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
                                                connect.title.capitalizeFirst
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                    padding: const EdgeInsets
                                                            .symmetric(
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
                                                    fontWeight:
                                                        FontWeight.w600),
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
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 100.h,
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 20),
        child: GestureDetector(
          onTap: () {
            cart.addToCart(
              // quantity: quantity,
              productId: widget.id,
              unitPrice: total,
              productDetailsObject: widget.drugImageAsset,
              productName: widget.title,
              uniqueCheck: quantity,
            );
            Get.bottomSheet(
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                    height: 300.h,
                    padding: kDefaultPadding,
                    color: whiteColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.title} has been successfully \n added to cart!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        SizedBox(height: 50.h),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.to(const CartScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff7A08FA),
                                  Color(0xffAD3BFC),
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'VIEW CART',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: whiteColor),
                            )),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                    color: kPrimaryColor, width: 2.0)),
                            child: Center(
                                child: Text(
                              'CONTINUE SHOPPING',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: kPrimaryColor),
                            )),
                          ),
                        )
                      ],
                    )),
              ),
              barrierColor: kPrimaryColor.withOpacity(.1),
              isDismissible: true,
              enableDrag: true,
            );
          },
          child: Container(
            width: 364.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff7A08FA),
                  Color(0xffAD3BFC),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  color: whiteColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Add to cart',
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
