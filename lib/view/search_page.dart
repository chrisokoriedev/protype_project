import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:protype_project/data/drug.dart';

import '../custom/styles.dart';
import '../custom/widget.dart';
import 'drug_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchString = '';
  List<DrugListII> drugData = drugListII;

  void searchBarMethod(String query) {
    final suggestion = drugListII.where((element) {
      final bookTitle = element.title.toLowerCase();
      setState(() => searchString = query);
      final inputType = query.toLowerCase();
      return bookTitle.contains(inputType);
    }).toList();
    setState(() => drugData = suggestion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 189.h,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: whiteColor,
                              )),
                          textHeader('Pharmacy'),
                        ],
                      ),
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
                    child: TextFormField(
                      style: TextStyle(
                          color: whiteColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                      onChanged: searchBarMethod,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: whiteColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 4.h),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                              color: whiteColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                          filled: true,
                          fillColor: whiteColor.withOpacity(0.2),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.r))),
                    ),
                  )
                ],
              ),
            ),
            drugData.isNotEmpty
                ? Padding(
                    padding: kDefaultPadding,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.7,
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 20,
                        ),
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: drugData.length,
                        itemBuilder: (context, index) {
                          final connect = drugData[index];
                          return GestureDetector(
                            onTap: () => Get.to(DrugDetail(
                              drugPrice: connect.drugPrice,
                              title: connect.title,
                              drugImageAsset: connect.drugImageAsset,
                              drugVolume: connect.drugVolume,
                              drugCategories: connect.drugCategories, id: connect.id,
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
                  )
                : Container(
                    padding: kDefaultPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        Image.asset('assets/404.png'),
                        Text(
                          'No result found for "$searchString"'
                              .capitalize
                              .toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20.sp),
                        )
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
