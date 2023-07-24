import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_app_bloc/features/home/models/home_product_data_model.dart';

import '../bloc/cart_bloc.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget(
      {super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹${productDataModel.price}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveFromCartEvent(
                            productDataModel: productDataModel));
                      },
                      icon: const Icon(Icons.shopping_bag)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
