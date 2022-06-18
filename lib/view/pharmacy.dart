import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protype_project/custom/styles.dart';
import 'package:protype_project/data/categories.dart';
import 'package:protype_project/data/drug.dart';
import 'package:protype_project/view/Categories_Section/view_all_categories.dart';
import 'package:protype_project/view/drug_detail.dart';

import '../custom/widget.dart';
import 'search_page.dart';

class Pharmacy extends StatelessWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: kGreyColor,
              child: Column(
                children: [
                  Container(
                    height: 189.h,
                    padding: kDefaultPadding,
                    decoration: const BoxDecoration(
                        color: kPrimaryColor,
                        image: DecorationImage(
                            image: AssetImage('assets/bg.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textHeader('Pharmacy'),
                            const Icon(
                              Icons.delivery_dining,
                              color: whiteColor,
                              size: 25,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          height: 40.h,
                          child: GestureDetector(
                            onTap: () => Get.to(const SearchPage()),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  enabled: false,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: whiteColor,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 4.h),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: whiteColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                  filled: true,
                                  fillColor: whiteColor.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: kDefaultPadding,
                    color: kGreyColor,
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 20.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Delivery in ',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              'Lagos, NG',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textSubHeader('CATERGORIES'),
                      TextButton(
                        onPressed: () => Get.to(const ViewAllCategories()),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 130.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryItem.length,
                        itemBuilder: (context, int index) {
                          Categories connect = categoryItem[index];
                          return Container(
                              width: 130.w,
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
                  SizedBox(height: 20.h),
                  textSubHeader('SUGGESTIONS'),
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
                                        color: Colors.grey.withOpacity(0.9),
                                        offset: const Offset(0, 0),
                                        blurRadius: 30,
                                        spreadRadius: -18)
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
                                          connect.title.capitalizeFirst
                                              .toString(),
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
            )
          ],
        ),
      ),
    );
  }
}
