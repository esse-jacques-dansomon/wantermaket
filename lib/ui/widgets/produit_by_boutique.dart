import 'package:flutter/material.dart';

class ProductByBoutique extends StatelessWidget {
  final int id;
  const ProductByBoutique({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Card(
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:  DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/250?image=$id',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Product avec Nom ${id}', maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, ),),
                    SizedBox(height: 15),
                    const  Text('2.000.000 fcfa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        InkWell(child: Icon(Icons.whatsapp, color: Colors.green,) , onTap: (){},),
                        const SizedBox(width: 5,),
                        InkWell(child: Icon(Icons.phone, color: Colors.green,) , onTap: (){},),
                        const SizedBox(width: 15,),
                        const Text('Conctacter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                        const SizedBox(width: 15,),

                      ],
                    ),
                   ListTile(
                     horizontalTitleGap: 10,
                      contentPadding: const EdgeInsets.only(top: 5, right: 15),
                      leading:  SizedBox(
                        height: 40,
                        child: ClipOval(
                          child: Image.network(
                            'https://picsum.photos/250?image=9',
                            fit: BoxFit.cover,
                        ),),
                      ),
                      trailing:  Icon(Icons.verified, color: Colors.blueAccent,),

                      title: const Text('Boumba boutiq', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
