import 'package:flutter/material.dart';

import '../../../data/models/body/product.dart';
import '../../../shared/contact_vendor.dart';

class BottomBarVendor extends StatelessWidget {
  const BottomBarVendor({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //whatSapp
          SizedBox(
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),)
                ),
                onPressed: () async {
                  ContactVendor.openWhatsapp(context: context, product: product);
                }, child: Row(
              children: const [
                Icon(Icons.whatsapp, size: 22),
                SizedBox(width: 5,),
                Text('WhatsApp', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
              ],
            )),
          ),

          //phone call
          SizedBox(
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),)
                ),
                onPressed: (){
                  ContactVendor.openPhone(context: context, number: product.boutique?.vendor?.phone?? '');

                }, child: Row(
              children: const [
                Icon(Icons.call_outlined, size: 22),
                SizedBox(width: 5,),
                Text('Appel', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
              ],
            )),
          ),

          //message
          SizedBox(
            height: 35,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),)
                ),
                onPressed: (){
                  ContactVendor.openMessage(context: context, number: product.boutique?.vendor?.phone?? '');

                }, child: Row(
              children: const [
                Icon(Icons.sms_outlined, size: 22),
                SizedBox(width: 5,),
                Text('SMS', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),),
              ],
            )),
          ),
        ],
      ),
    );
  }
}