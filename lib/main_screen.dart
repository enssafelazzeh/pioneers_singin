import 'package:flutter/material.dart';
import 'package:pioneers_singin/model/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int qty = 0;
  // List<String> itemName = ["banana", "strawberres", "mango", "waterMelon"];
  // List<double> price = [
  //   2.0,
  //   3.5,
  // ];
  List<Item> items = [
    Item(
      name: "banana",
      image:
          "https://media.istockphoto.com/id/120492078/photo/banana.jpg?s=1024x1024&w=is&k=20&c=M9KLVNgqLft_btWgSu0iZAmdv2asI11Qel-6fsQK140=",
      price: 6.5,
    ),
    Item(
        name: "strawberres",
        image:
            "https://media.istockphoto.com/id/477834644/photo/fresh-strawberries-background.jpg?s=1024x1024&w=is&k=20&c=YZqMZmEKrD36j67trGOduk9hswwWmB7sTJb4Y1dY46s=",
        price: 1.5),
    Item(
        name: "mango",
        image:
            "https://media.istockphoto.com/id/168370138/photo/mango.jpg?s=1024x1024&w=is&k=20&c=HBXIjdVwjydQmINVBRCxeVivTdejyHsZPgVWLiniGRM=",
        price: 6),
    Item(
        name: "waterMelon",
        image:
            "https://media.istockphoto.com/id/157374780/photo/watermelon.jpg?s=1024x1024&w=is&k=20&c=MAYXAme0vX2TQQA-OqeR_GvLtHyEfbxRoCnBLFUMqE0=",
        price: 8)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("my shoping ")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return tile(context: context, item: items[index]);
                  }),
            ),
            Container(
              height: 80,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20, top: 10),
                child: Row(
                  children: [
                    footer(
                        title: "# of item in cart",
                        value: itemQunty().toString()),
                    // Column(
                    //   children: [
                    //     const Text("# of item in cart"),
                    //     Text(
                    //       "0",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 20),
                    //     )
                    //   ],
                    // ),
                    Expanded(child: Container()),
                    footer(title: "Total", value: itemTotalPrice().toString()),
                    // Column(
                    //   children: [
                    //     Text("TotalPrice"),
                    //     Text("0",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold, fontSize: 20))
                    //   ],
                    // )
                  ],
                ),
              ),
            )
          ],
        )

        //  Column(children: [
        //   tile(
        //       context: context,
        //       itimeImage:
        //           "https://media.istockphoto.com/id/120492078/photo/banana.jpg?s=1024x1024&w=is&k=20&c=M9KLVNgqLft_btWgSu0iZAmdv2asI11Qel-6fsQK140=",
        //       nameItime: "banana",
        //       price: 2.5),
        //   tile(
        //       context: context,
        //       itimeImage:
        //           "https://media.istockphoto.com/id/477834644/photo/fresh-strawberries-background.jpg?s=1024x1024&w=is&k=20&c=YZqMZmEKrD36j67trGOduk9hswwWmB7sTJb4Y1dY46s=",
        //       nameItime: "strawberres",
        //       price: 4.5),
        //   tile(
        //       context: context,
        //       itimeImage:
        //           "https://media.istockphoto.com/id/168370138/photo/mango.jpg?s=1024x1024&w=is&k=20&c=HBXIjdVwjydQmINVBRCxeVivTdejyHsZPgVWLiniGRM=",
        //       nameItime: "mango",
        //       price: 5.50),
        //   tile(
        //       context: context,
        //       itimeImage:
        //           "https://media.istockphoto.com/id/157374780/photo/watermelon.jpg?s=1024x1024&w=is&k=20&c=MAYXAme0vX2TQQA-OqeR_GvLtHyEfbxRoCnBLFUMqE0=",
        //       nameItime: "waterMelon",
        //       price: 9.3)
        // ]),
        );
  }

  int itemQunty() {
    int qty = 0;
    for (var x in items) {
      qty = x.qty + qty;
    }
    return qty;
  }

  double itemTotalPrice() {
    double total = 0;
    for (var x in items) {
      qty = x.qty + qty;
      total = (x.qty * x.price) + total;
    }
    return total;
  }

  Widget footer({required String title, required String value}) {
    return Column(
      children: [
        Text(title),
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
      ],
    );
  }

  Widget tile({required context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                item.image,
                width: 50,
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  children: [Text(item.name), Text("${item.price} JD ")],
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    item.qty += 1;
                    setState(() {});
                  },
                  icon: Icon(Icons.add)),
              Text(item.qty.toString()),
              IconButton(
                  onPressed: () {
                    if (item.qty == 0) {
                      return;
                    }
                    item.qty -= 1;
                    setState(() {});
                  },
                  icon: Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
