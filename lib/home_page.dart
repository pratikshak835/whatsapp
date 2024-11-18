// import 'package:common_jds_flutter/common/custom_inkwell.dart';
// import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:whatsapp/app/colors/app_colors.dart';
// import 'package:whatsapp/app/common/app_bar.dart';
// import 'package:whatsapp/app/common/sidebar.dart';
// import 'package:whatsapp/app/common/strings.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const MyAppBar(),
//       backgroundColor: AppColors.FFE0E0E0,
//       body: Sidebar(
//         widget: Padding(
//           padding: const EdgeInsets.only(left: 70.0, right: 10),
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               color: AppColors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CustomText(
//                     text: Strings.allProducts,
//                     color: AppColors.black,
//                     fontWeight: CustomFontWeight.bold,
//                     size: 24,
//                     isRilFont: true,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: GridView.builder(
//                       padding: const EdgeInsets.all(10),
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 5,
//                         crossAxisSpacing: 16,
//                         mainAxisSpacing: 24,
//                       ),
//                       itemCount: 20,
//                       itemBuilder: (context, index) {
//                         return CustomInkwell(
//                             onTap: () {}, child: const ProductCard());
//                         // return CustomInkwell(
//                         //     onTap: () {}, child: OrderItemCard(index: index));
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OrderItemCard extends StatelessWidget {
//   final int index;
//   const OrderItemCard({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: Colors.blueAccent, // Placeholder color
//       ),
//       child: Center(
//         child: Text(
//           'Item $index',
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProductCard extends StatefulWidget {
//   final String imageUrl;
//   final String productName;
//   final String price;
//
//   const ProductCard({
//     super.key,
//     this.imageUrl =
//         'https://static.nike.com/a/images/t_prod_ss/w_480,c_limit,f_auto,q_auto/d4413d66-0de9-486c-8f43-530963dc2905/women-s-air-jordan-1-high-og-satin-shadow-fd4810-010-release-date.jpg',
//     this.productName = "Air Jordan 1",
//     this.price = "\u{20B9} 8,995",
//   });
//
//   @override
//   _ProductCardState createState() => _ProductCardState();
// }
//
// class _ProductCardState extends State<ProductCard> {
//   double _scale = 1.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() {
//           _scale = 1.05;
//         });
//       },
//       onExit: (_) {
//         setState(() {
//           _scale = 1.0;
//         });
//       },
//       child: AnimatedScale(
//         scale: _scale,
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.easeInOut,
//         child: Container(
//           width: 245,
//           height: 260,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.black54.withOpacity(0.4),
//                 Colors.grey.withOpacity(0.2),
//               ],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//             ),
//           ),
//           child: Stack(
//             children: [
//               // Background image
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(widget.imageUrl),
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               // Overlay for text
//               // Container(
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(12),
//               //     color:
//               //         Colors.black.withOpacity(0.3), // Semi-transparent black
//               //   ),
//               // ),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(12),
//               //     gradient: LinearGradient(
//               //       colors: [
//               //         Colors.white.withOpacity(0.8),
//               //         Colors.grey.withOpacity(0.2)
//               //       ],
//               //       begin: Alignment.bottomCenter,
//               //       end: Alignment.topCenter,
//               //     ),
//               //   ),
//               // ),
//               // Product name and price
//               Positioned(
//                 bottom: 0,
//                 left: 20,
//                 right: 0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: widget.productName,
//                       color: Colors.black54,
//                       size: 18,
//                       fontWeight: CustomFontWeight.bold,
//                       isRilFont: true,
//                     ),
//                     const SizedBox(height: 4),
//                     CustomText(
//                       text: widget.price,
//                       color: Colors.black54,
//                       size: 16,
//                       isRilFont: true,
//                     ),
//                     const SizedBox(height: 8),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:common_jds_flutter/common/app_colors.dart';
import 'package:common_jds_flutter/common/custom_inkwell.dart';
import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/app/api_service.dart';
import 'package:whatsapp/app/app_images/app_images.dart';
import 'package:whatsapp/app/common/app_bar.dart';
import 'package:whatsapp/app/common/sidebar.dart';
import 'package:whatsapp/app/common/strings.dart';
import 'package:whatsapp/app/model/get_product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<GetProduct>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService()
        .fetchProducts('shoes'); // Fetch products for 'shoes' category
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: AppColors.FFE0E0E0,
      body: Sidebar(
        widget: Padding(
          padding: const EdgeInsets.only(left: 70.0, right: 10),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: AppColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: Strings.allProducts,
                    color: AppColors.black,
                    fontWeight: CustomFontWeight.bold,
                    size: 24,
                    isRilFont: true,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: FutureBuilder<List<GetProduct>>(
                      future: futureProducts,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No products found'));
                        }

                        final products = snapshot.data!;

                        return GridView.builder(
                          padding: const EdgeInsets.all(10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return CustomInkwell(
                              onTap: () {
                                // Handle product tap
                              },
                              child: ProductCard(
                                imageUrl: product.image ?? '',
                                productName: product.name ?? 'Unknown',
                                price:
                                    '\u{20B9} ${product.price?.toString() ?? '0'}',
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _scale = 1.05; // Scale up on hover
        });
      },
      onExit: (_) {
        setState(() {
          _scale = 1.0; // Scale down when not hovering
        });
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              // Product image
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.contain,
                    scale: 1,
                    isAntiAlias: true,
                    height: 150,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback images based on specific URLs
                      if (widget.imageUrl
                          .contains("https://search.app/tPxebKCRfgVTe4zY9")) {
                        return Image.asset(
                          AppImages.watch,
                          fit: BoxFit.cover,
                          height: 150,
                          width: double.infinity,
                        );
                      } else if (widget.imageUrl.contains(
                          "https://www.ajio.com/new-balance-two-way-basketball-shoes/p/469633821_blue")) {
                        return Image.asset(
                          AppImages.newBalanceShoes,
                          fit: BoxFit.contain,
                          height: 150,
                          width: double.infinity,
                        );
                      } else if (widget.imageUrl.contains(
                          "https://www.ajio.com/asics-men-gel-kinsei-max-lace-up-running-shoes/p/700216290_grey")) {
                        return Image.asset(
                          AppImages.asicsShoes,
                          fit: BoxFit.contain,
                          height: 150,
                          width: double.infinity,
                        );
                      } else {
                        return const Center(child: Text("No Image Available"));
                      }
                    },
                  ),
                ),
              ),
              // Product details
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.productName,
                      color: AppColors.black,
                      fontWeight: CustomFontWeight.bold,
                      maxLines: 2,
                      size: 14,
                      isRilFont: true,
                    ),
                    const SizedBox(height: 4),
                    CustomText(
                      text: widget.price,
                      color: AppColors.black,
                      fontWeight: CustomFontWeight.medium,
                      size: 14,
                      isRilFont: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
