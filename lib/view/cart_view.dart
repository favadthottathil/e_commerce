import 'package:e/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartContrller>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<CartContrller>(builder: (context, provider, _) {
        return ListView.builder(
          itemCount: provider.cartList.length,
          itemBuilder: (context, index) {
            var cart = provider.cartList[index];

            var count = provider.cartData[cart];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const CircleAvatar(),
                title: Text(cart.name),
                subtitle: Text(cart.price.toString()),
                trailing: SizedBox(
                  width: 40,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          cartController.removeToCart(cart);
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 5),
                      Text((count ?? 0).toString())
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
