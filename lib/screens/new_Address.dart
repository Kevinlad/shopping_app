import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/address_model.dart';
import '../provider/address_provider.dart';

class NewAddress extends StatefulWidget {
  const NewAddress({super.key});

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
  final bool selected = false;
  void initState() {
    super.initState();
    // Fetch addresses when the screen is initialized
    Provider.of<AddressProvider>(context, listen: false).fetchAddresses();
  }

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final addresses = addressProvider.addresses;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Address"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  // AddressCard(selectedAddress: true),
                  // AddressCard(selectedAddress: false),
                  for (var address in addresses) AddressCard(address: address)
                ]))),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddAddressScreen()));
            },
            child: const Icon(Icons.add)));
  }
}

class AddressCard extends StatefulWidget {
  AddressCard({super.key, required this.address
      // required this.selectedAddress
      });
  // final bool selectedAddress;
  final AddressModel address;
  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool selectedAddress = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              setState(() {
                selectedAddress = !selectedAddress;
              });
            },
            child: Container(
                // height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: selectedAddress
                        ? Colors.blueGrey.shade200
                        : Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(20),
                child: Stack(children: [
                  Positioned(
                      right: 5,
                      top: 0,
                      child: selectedAddress
                          ? const Icon(Icons.check_circle, color: Colors.black)
                          : const Icon(Icons.check_circle_outline)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.address.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text("+91-910-4363701 ",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey.shade700)),
                        const SizedBox(height: 6),
                        Text(
                            "82349 Timmy Colves , south lamiya ,Maina ,87665, USA",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey.shade700))
                      ])
                ]))));
  }
}

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _phoneNumber, _street, _postalCode, _city, _state, _country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (value) => _name = value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) => _phoneNumber = value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) => _street = value,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Street",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) => _postalCode = value,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "Postal Code",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) => _city = value,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "City",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          onSaved: (value) => _state = value,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              labelText: "State",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (value) => _country = value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: "Country",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          AddressModel newAddress = AddressModel(
                            name: _name!,
                            phoneNumber: _phoneNumber!,
                            street: _street!,
                            postalCode: _postalCode!,
                            city: _city!,
                            state: _state!,
                            country: _country!,
                          );
                          Provider.of<AddressProvider>(context, listen: false)
                              .addAddress(newAddress);
                          _formKey.currentState?.reset();
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                            child: Text("Save",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16))),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
