import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/ui/basewidgets/loaders/custom_app_loader.dart';

import '../../../data/models/body/product.dart';
import '../../../providers/signaler_provider.dart';
import '../../../shared/contact_vendor.dart';
import 'dart:io' show Platform;

class BottomBarVendor extends StatefulWidget {
  const BottomBarVendor({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<BottomBarVendor> createState() => _BottomBarVendorState();
}

class _BottomBarVendorState extends State<BottomBarVendor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: Platform.isIOS ? 65 : 55,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //whatSapp
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                    onPressed: () async {
                      ContactVendor.openWhatsapp(
                          context: context, product: widget.product);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.whatsapp, size: 22),
                        // SizedBox(width: 5,),
                        // Text('WhatsApp', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                      ],
                    )),
              ),

              //phone call
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black54),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                    onPressed: () {
                      ContactVendor.openPhone(
                          context: context,
                          number: widget.product.boutique?.vendor?.phone ?? '');
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.call_outlined, size: 22),
                        // SizedBox(width: 5,),
                        // Text('Appel', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                      ],
                    )),
              ),

              //message
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                    onPressed: () {
                      ContactVendor.openMessage(
                          context: context,
                          number: widget.product.boutique?.vendor?.phone ?? '');
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.sms_outlined, size: 22),
                        // SizedBox(width: 5,),
                        // Text('SMS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
                      ],
                    )),
              ),

              //report product
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 35,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )),
                    onPressed: () {
                      //show bottom sheet
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SignalerBottomSheetModal(
                                productId: this.widget.product.id!);
                          });
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.report_outlined, size: 22),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Signaler',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SignalerBottomSheetModal extends StatefulWidget {
  const SignalerBottomSheetModal({Key? key, required this.productId})
      : super(key: key);
  final int productId;

  @override
  State<SignalerBottomSheetModal> createState() =>
      _SignalerBottomSheetModalState();
}

class _SignalerBottomSheetModalState extends State<SignalerBottomSheetModal> {
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
              const Text(
                'Signaler le produit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Veuillez nous indiquer la raison de votre signalement',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          //select reason
          const Text(
            'Raison',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
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
              items: Provider.of<SignalerProvider>(context, listen: false)
                  .raisonsProduits
                  .map((e) => DropdownMenuItem(
                        value: e.id,
                        child: Text(e.texte),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  raison = value as int;
                });
              },
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          Consumer<SignalerProvider>(
            builder: (context, provider, child) {
              switch (provider.status) {
                case SignalerStatus.loaded:
                case SignalerStatus.initial:
                  return SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                        onPressed: () {
                          provider.signaler(context,
                              id: widget.productId.toString(),
                              type: "produit",
                              raison: raison.toString());
                        },
                        child: const Text(
                          'Signaler',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        )),
                  );
                case SignalerStatus.loading:
                  return Center(child: CustomAppLoader());
                case SignalerStatus.error:
                  return SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            )),
                        onPressed: () {
                          provider
                              .signaler(context,
                                  id: widget.productId.toString(),
                                  type: "produit",
                                  raison: raison.toString())
                              .then((value) {
                            if (value) Navigator.pop(context);
                          });
                        },
                        child: const Text(
                          'error, réessayer',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        )),
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
