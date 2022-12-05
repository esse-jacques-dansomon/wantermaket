import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/signaler_provider.dart';
import '../../../basewidgets/loaders/custom_app_loader.dart';

class SignalerVendorBottomSheetModal extends StatefulWidget {
  const SignalerVendorBottomSheetModal({Key? key, required this.vendorId}) : super(key: key);
  final int vendorId;

  @override
  State<SignalerVendorBottomSheetModal> createState() =>
      _SignalerVendorBottomSheetModal();
}

class _SignalerVendorBottomSheetModal extends State<SignalerVendorBottomSheetModal> {
  int raison = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Signaler ce vendeur',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Text('Veuillez nous indiquer la raison de votre signalement',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
          const SizedBox(height: 20,),
          //select reason
          const Text('Raison',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              value: raison,
              items: Provider
                  .of<SignalerProvider>(context, listen: false)
                  .raisonsVendeurs
                  .map((e) =>
                  DropdownMenuItem(
                    value: e.id,
                    child: Text(e.texte),
                  )).toList(),
              onChanged: (value) {
                setState(() {
                  raison = value as int;
                });
              },
            ),
          ),

          const SizedBox(height: 20,),
          Consumer<SignalerProvider>(
            builder: (context, provider, child) {
              switch(provider.status)
              {
                case SignalerStatus.loaded:
                case SignalerStatus.initial:
                  return SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),)
                        ),
                        onPressed: () {
                          provider.signaler(context, id: widget.vendorId.toString(), type: "vendeur", raison: raison.toString());
                        },
                        child: const Text('Signaler', style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),)),
                  );
                case SignalerStatus.loading:
                  return Center(child: CustomAppLoader());
                case SignalerStatus.error:
                  return  SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),)
                        ),
                        onPressed: () {
                          provider.signaler(context, id: widget.vendorId.toString(), type: "vendeur", raison: raison.toString());
                        },
                        child: const Text('error, réessayer', style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),)),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
