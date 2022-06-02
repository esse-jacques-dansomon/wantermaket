import 'package:flutter/material.dart';

class DealDuJour extends StatelessWidget {
  final int id;
  const DealDuJour({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        margin: const EdgeInsets.only(left: 8.0),
        width: MediaQuery.of(context).size.width*0.9,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image:  DecorationImage(
                    image: NetworkImage(
                      'https://picsum.photos/250?image=$id',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text('Deal Du jour', textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Padding(padding: EdgeInsets.only(left: 8, bottom: 8),
                    child: Text(
                      'Mack Book Pro ',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),),
                  Padding(padding: EdgeInsets.only(left: 8),
                    child: Text(
                      '2.000.000 FCFA',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),),
                  ElevatedButton(

                    onPressed: (){
                      print('Deal du jours');
                    },
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.90,
                        child: Center(
                          child: Text('Acheter', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          ),
                        ),
                      ),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
