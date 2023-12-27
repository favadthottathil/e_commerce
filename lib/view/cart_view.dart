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
      body: ListView.builder(
        itemCount: cartController.cartData.length,
        itemBuilder: (context, index) {
          

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const CircleAvatar(),
              title: const Text('dhklad'),
              subtitle: const Text('djalkdhkfa'),
              trailing: SizedBox(
                width: 40,
                child: Row(
                  children: [
                    const Icon(Icons.remove),
                    const SizedBox(width: 5),
                    Consumer<CartContrller>(
                      builder: (context,provider,child) {

                        var cart = provider.cartData[index];


                        return Text((cart ?? 0).toString());
                      }
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
