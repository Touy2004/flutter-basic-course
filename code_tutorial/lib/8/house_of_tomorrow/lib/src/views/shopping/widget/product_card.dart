import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/model/product.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/src/services/theme_service.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/themes/component/rating.dart';
import 'package:code_tutoorial/utils/helper/intl_helper.dart';
import 'package:code_tutoorial/8/house_of_tomorrow/lib/utils/route_path.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoutePath.product,
          arguments: product,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.surface,
          boxShadow: context.deco.shadow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            if (product.productColorList.isNotEmpty)
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: product.productColorList.first.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 4),

            /// Name
            Text(
              product.name.toString(),
              style: context.typo.headline4.copyWith(
                fontWeight: context.typo.semiBold,
              ),
            ),
            const SizedBox(height: 4),

            /// Brand
            Text(
              product.brand.toString(),
              style: context.typo.body2.copyWith(
                fontWeight: context.typo.light,
                color: context.color.subtext,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                /// Price
                Expanded(
                  child: Text(
                    IntlHelper.currency(
                      number: product.price,
                      symbol: product.priceUnit,
                    ),
                    style: context.typo.subtitle2,
                  ),
                ),

                /// Rating
                Rating(rating: product.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
