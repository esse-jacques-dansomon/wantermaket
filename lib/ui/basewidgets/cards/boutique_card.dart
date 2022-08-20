import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/body/boutique.dart';
import '../../../route/routes.dart';

class BoutiqueCard extends StatelessWidget {
  final Boutique boutique;
  const BoutiqueCard({
    Key? key, required this.boutique,
  }) : super(key: key, );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.vendor, arguments: boutique);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                width: 105,
                child: Padding(
                  padding: const EdgeInsets.only( left: 5),
                  child: Text(boutique.name!.toUpperCase(),overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                    style:const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, ),
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(height: 8,),
              SizedBox(
                width: 90,
                height: 90,
                child: CachedNetworkImage(
                    imageUrl: boutique.profilImage!,
                    placeholder: (context, url) =>  Shimmer.fromColors(baseColor: Colors.grey.shade100, highlightColor: Colors.grey.shade100 ,  child: const SizedBox(height: 100,)),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
