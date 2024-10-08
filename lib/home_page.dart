import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/producgDetails.dart';
import 'package:shop_app/productCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> fit = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Woodland',
    'Puma'
  ];

  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = fit[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\n Collection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fit.length,
                itemBuilder: (context, index) {
                  final filter = fit[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilter == filter
                            ? Color.fromRGBO(255, 206, 1, 1)
                            : Color.fromRGBO(245, 247, 249, 1),
                        label: Text(filter),
                        labelStyle: TextStyle(fontSize: 16),
                        padding: EdgeInsets.all(15),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Product.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = Product[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return productDetail(product: product);
                        },
                      ));
                    },
                    child: Productcard(
                      title: product['Title']?.toString()??'unkownTitle',
                      Price: product['Price']!=null?product as double:0.0,
                      image: product['imageUrl']?toString()??'asset/Image/Nike.png',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
