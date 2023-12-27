import 'package:e/controller/cart_controller.dart';
import 'package:e/data/all_data.dart';
import 'package:e/model/data_model.dart';
import 'package:e/view/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ProductDataModel> allData = [];

  @override
  void initState() {
    super.initState();

    allData = ProductData().getAllData();
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartContrller>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('E Commerce App'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  )),
              icon: const Icon(Icons.card_travel_rounded))
        ],
      ),
      body: ListView.builder(
        itemCount: allData.length,
        itemBuilder: (context, index) {
          var product = allData[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const CircleAvatar(),
              title: Text(product.name),
              subtitle: Text(product.price.toString()),
              trailing: SizedBox(
                width: 90,
                child: Row(
                  children: [
                    const Icon(Icons.remove),
                    const SizedBox(width: 5),
                    Consumer<CartContrller>(builder: (
                      context,
                      provider,
                      child,
                    ) {
                      int? item = provider.cartData[product];

                      return Text((item ?? 0).toString());
                    }),
                    const SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        cartController.addToCart(product);

                        cartController.addCartList = product;
                      },
                      child: const Icon(Icons.add),
                    ),
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
