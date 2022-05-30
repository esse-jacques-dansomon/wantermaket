import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: newDrawer(MediaQuery.of(context).size.height),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      'https://picsum.photos/250?image=9',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
              child: Text('Boutiques Exclusives', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ), textAlign: TextAlign.start,),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Card(
                  
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Image.network(
                          'https://picsum.photos/250?image=9',
                          fit: BoxFit.cover,
                        ),
                      ),

                      Text('Boutique No $index', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, ), textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
