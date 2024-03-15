import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:urban_culture/config/colors.dart';
import 'package:urban_culture/controller/product_controller.dart';
import 'package:urban_culture/utils/appbar.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgrondcolor,
      appBar: const MyAppBar(title: "Daily Skincare"),
      body: Consumer<ProductController>(
        builder: (context, productController, _) {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: kforegroundcolor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        width: 65,
                        height: 65,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: productController.productList[index].isuploaded
                              ? Lottie.asset("assets/lottie/tick.json",
                                  repeat: false)
                              : Padding(
                                  padding: const EdgeInsets.all(7.8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ktickcolor, width: 1.6),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productController.productList[index].title,
                              style: const TextStyle(
                                  fontFamily: 'Epilogue', fontSize: 16),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              productController.productList[index].subtitle,
                              style: const TextStyle(
                                fontFamily: 'Epilogue',
                                fontSize: 14,
                                color: ktext,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (!productController
                                  .productList[index].isuploaded) {
                                productController.pickAndUploadImage(
                                  productController.productList[index],
                                );
                              }
                            },
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child:
                                  productController.productList[index].uploading
                                      ? const Padding(
                                          padding: EdgeInsets.all(12),
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Image(
                                          image: AssetImage(
                                              'assets/images/camera.jpeg')),
                            ),
                          ),
                          productController.productList[index].isuploaded
                              ? Text(productController.productList[index].time)
                              : const SizedBox(
                                  width: 62,
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
