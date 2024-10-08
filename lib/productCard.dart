import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  final String title;
  final double Price;
  final String image;
  const Productcard({super.key, required this.title,required this.Price,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(216, 214, 253,1), 
        borderRadius: BorderRadius.circular(20)
      ),
      margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(
            height: 5,
          ),
          Text('\$$Price',style: Theme.of(context).textTheme.bodySmall),
          Center(child: Image(image: AssetImage(image),height: 275,))
        ],
      ),
    );
  }
}