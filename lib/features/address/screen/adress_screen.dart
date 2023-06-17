import 'package:amazon_clone_nodejs/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_nodejs/constants/global_variables.dart';
import 'package:amazon_clone_nodejs/constants/utils.dart';
import 'package:amazon_clone_nodejs/features/address/service/address_services.dart';
import 'package:amazon_clone_nodejs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pay/pay.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  AddressScreen({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController flatController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityTownController = TextEditingController();

  final _addressFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    flatController.dispose();
    streetController.dispose();
    pinCodeController.dispose();
    cityTownController.dispose();
  }

  String addressToBeUsed = "";
  List<PaymentItem> paymentItems = [];
  final AddressServices addressServices = AddressServices();
  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(context: context, address:addressToBeUsed);
      
      // addressServices.placeOrder(
      //   context: context,
      //   address: addressToBeUsed,
      //   totalSum: double.parse(widget.totalAmount),
      // );
    }
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatController.text.isNotEmpty ||
        streetController.text.isNotEmpty ||
        pinCodeController.text.isNotEmpty ||
        cityTownController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatController.text}, ${streetController.text}, ${cityTownController.text} - ${pinCodeController.text}';
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
    print(addressToBeUsed);
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              Form(
                  key: _addressFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: flatController,
                          hintText: "Flat , House Number , Building"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: streetController,
                          hintText:
                              "Area , Colony , Street , Sector , Village"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: pinCodeController, hintText: "PinCode"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: cityTownController,
                          hintText: "Town / City"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              GooglePayButton(
                width: double.infinity,
                onPressed: () => payPressed(address),
                paymentConfigurationAsset: 'gpay.json',
                onPaymentResult: onGooglePayResult,
                paymentItems: paymentItems,
                height: 50,
                // style: GooglePayButtonStyle.black,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15),
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        )));
  }
}
