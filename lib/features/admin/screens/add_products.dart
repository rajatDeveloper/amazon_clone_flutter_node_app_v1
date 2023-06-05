import 'package:amazon_clone_nodejs/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProducts extends StatefulWidget {
  static const String routeName = "/addProducts";
  AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<String> productsCat = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];
  String category = "Mobiles";
  @override
  void dispose() {
    // TODO: implement dispose
    productNameController.dispose();
    desController.dispose();
    priceController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add product",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: [10, 4],
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_a_photo_outlined,
                            size: 50,
                          ),
                          const Text("Add product image")
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  controller: productNameController,
                  hintText: "Enter Product Name",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  maxLines: 7,
                  controller: desController,
                  hintText: "Enter the description",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: priceController,
                  hintText: "Enter the price",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: quantityController,
                  hintText: "Enter the quantity",
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productsCat.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
