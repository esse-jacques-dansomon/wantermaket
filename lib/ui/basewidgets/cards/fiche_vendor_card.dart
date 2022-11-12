import 'package:flutter/material.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/shared/contact_vendor.dart';

import '../../../data/models/body/boutique.dart';

class FicheVendeur extends StatelessWidget {
  final Boutique boutique;

  const FicheVendeur({
    Key? key, required this.boutique,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(boutique.name!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              InkWell(child: const Icon(Icons.close, size: 28, color: AppColors.SECONDARY,),
                onTap: (){
                  Navigator.pop(context);
                },),
            ],
          ),
          const SizedBox(height: 20,),
          const Text('Biographie', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          Text(boutique.bio!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
          const SizedBox(height: 10,),
          //Nom vendeur
          boutique.vendor?.name != '' ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nom vendeur', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text(boutique.vendor!.name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
              const SizedBox(height: 20,),
            ],
          ): Container(),
          //social media
          _getOneSocialMedia(boutique) == true ?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Réseaux Sociaux', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  boutique.facebook != ""  ?
                  _socialMediaButton(asset: "assets/icons/facebook.png", url: boutique.facebook, context: context)  : Container(),

                  const SizedBox(width: 10,),

                  boutique.instagram != ""  ?
                  _socialMediaButton(asset: "assets/icons/instagram.png", url: boutique.instagram, context: context)  : Container(),

                  const SizedBox(width: 10,),
                  boutique.linkedin != ""  ?
                  _socialMediaButton(asset: "assets/icons/linkedin.png", url: boutique.linkedin, context: context) : Container(),
                  const SizedBox(width: 10,),
                  boutique.website != ""  ?
                  _socialMediaButton(asset: "assets/icons/website.png", url: boutique.website, context: context) : Container(),
                ],
              ),
            ],) : Container(),
          //corrdonnees
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              const Text('Coordonnees', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),

              InkWell(
                onTap: (){
                  ContactVendor.openPhone(number :boutique.vendor!.phone!, context: context);

                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.SECONDARY, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.phone, color: AppColors.SECONDARY, size: 18,),
                        SizedBox(width: 5,),
                        Text('Téléphone', overflow: TextOverflow.ellipsis, style: TextStyle( color: AppColors.SECONDARY ,fontSize: 16, fontWeight: FontWeight.w400), textAlign: TextAlign.left, ),
                      ],
                    )),
              ),
              const SizedBox(height: 10,),
              //WHATSAPP BUTTON
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                ),
                onPressed: (){
                  ContactVendor.openWhatsappVendor(boutique :boutique, context: context);
                },
                child: Row(
                  children:  [
                    const Icon(Icons.whatsapp, size: 18,),
                    const SizedBox(width: 5,),
                    Text("WhatsApp", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
              const SizedBox(height: 5,),

              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                ),
                child: Row(
                  children:  [
                    const Icon(Icons.email, size: 18,),
                    const SizedBox(width: 5,),
                    Text(boutique.vendor!.email!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),

            ],
          ),


          //Onpen location in maps
          const SizedBox(height: 5,),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black45),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              ),
              onPressed: (){
                ContactVendor.launchMaps(boutique);
              }, child:Row(
            children: [
              const Icon(Icons.add_location_rounded, size: 18,),
              const SizedBox(width: 5,),
              const Text('Localisation'),
            ],
          ) )

        ],
      ),
    );
  }

  Widget _socialMediaButton({String? url, required String asset, required BuildContext context}){
    return ClipOval(
      child: InkWell(
        onTap: () {
          ContactVendor.openSocialMedia(url: url??"", context:context );
        },
        child: Image.asset(asset, width: 50, height: 50,),
      ),
    );
  }

  bool _getOneSocialMedia(Boutique boutique){
    if(boutique.facebook != ""  || boutique.instagram != ""  || boutique.linkedin != "" || boutique.website != ""){
      return true;
    }
    return false;
  }
}
