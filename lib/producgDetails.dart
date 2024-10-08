import 'package:flutter/material.dart';

class productDetail extends StatefulWidget {
  final Map<String,Object> product;
  const productDetail({super.key,required this.product});

  @override
  State<productDetail> createState() => _productDetailState();
}

class _productDetailState extends State<productDetail> {
  int selectredSize=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('details')),

      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.product['title']as String,style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl']as String),
          ),
          const Spacer(flex: 2,),
          Container(
            height:250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(['\$${widget.product['price']}'] as String,
                  style:Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (BuildContext context, int index) {
                      final size =(widget.product['asize']as List<int>) [index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectredSize=size;
                            });
                          },
                          child: Chip(
                            backgroundColor: selectredSize==size?Color.fromRGBO(255, 206, 1, 1):null,
                            label: Text(size.toString()),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(onPressed: (){}, 
                  child: Text("Add to cart",style: TextStyle(color: Colors.black,fontSize: 18),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 206, 1, 1),
                    minimumSize: const Size(double.infinity,50),
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ) ,
    );
  }
}