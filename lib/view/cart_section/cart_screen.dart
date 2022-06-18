import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../custom/styles.dart';
import '../../custom/widget.dart';
import '../../data/drug.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<DrugList> drugs = [];
  var cart = FlutterCart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: whiteColor,
                            ),
                          ),
                          textHeader('Cart'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.cartItem.length,
                    itemBuilder: (context, index) {
                      var data = cart.cartItem[index];
                      return Container(
                        padding: kDefaultPadding,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: kGreyColor, width: 2.0.w))),
                        width: double.infinity,
                        height: 130.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  data.productDetails,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      data.productName ?? '',
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      'Tablet · 500mg',
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: kTextGreyColor),
                                    ),
                                    SizedBox(height: 5.h),
                                    Row(
                                      children: [
                                        Text(
                                          '₦${data.unitPrice}.00',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: kGreyColor, width: 1.9),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(data.uniqueCheck.toString()),
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cart.deleteItemFromCart(index);
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: kPrimaryColor,
                                        size: 17.sp,
                                      ),
                                      Text(
                                        'Remove',
                                        style: TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 14.sp),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: kDefaultPadding,
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Total: \t',
                  style: TextStyle(fontSize: 18.sp),
                ),
                Text(
                  '₦${cart.getTotalAmount().toString()}',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              width: 180.w,
              height: 52.h,
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
                'CHECKOUT',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: whiteColor,
                    fontSize: 15.sp),
              )),
            )
          ],
        ),
      ),
    );
  }
}
