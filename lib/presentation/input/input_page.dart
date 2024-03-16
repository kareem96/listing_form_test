import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_listing_test/presentation/provider/input_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class InputPage extends StatefulWidget {
  const InputPage({
    Key? key,
  }) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late InputProvider _inputProvider;

  _init() {
    _inputProvider = Provider.of<InputProvider>(context, listen: false);
    Future.microtask(() {
      _inputProvider.getListGroup(context);
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
              // Clear text fields
              _inputProvider.identifikasiController.clear();
              _inputProvider.noUrutController.clear();
              // Reset dropdown
              setState(() {
                _inputProvider.selectedGroupName = null;
              });
            },
            icon: Icon(Icons.arrow_back)),
        title: const Text(
          "Input New Form",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<InputProvider>(
          builder: (context, inputProvider, _) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.width,
              child: WillPopScope(
                onWillPop: () async {
                  Navigator.of(context).pop(true);
                  _inputProvider.identifikasiController.clear();
                  _inputProvider.noUrutController.clear();
                  // Reset dropdown
                  setState(() {
                    _inputProvider.selectedGroupName = null;
                  });
                  return true;
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            flex: 1,
                            child: Text(
                              "Nama Bangunan : ",
                            )),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              controller: inputProvider.identifikasiController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your data',
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Expanded(flex: 1, child: Text("No Urut Banana : ")),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextFormField(
                              controller: inputProvider.noUrutController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                              decoration: const InputDecoration(
                                hintText: 'Enter your data',
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text("List Kelompok : "),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonFormField<int>(
                              value: inputProvider.selectedGroupName,
                              decoration: const InputDecoration(
                                hintText: 'Select your data',
                                contentPadding: EdgeInsets.all(8),
                                border: InputBorder.none,
                              ),
                              items: inputProvider.data.map((group) {
                                return DropdownMenuItem<int>(
                                  value: group.id ?? 0,
                                  child: Text(
                                    group.name ?? "",
                                  ),
                                );
                              }).toList(),
                              onChanged: (int? newValue) {
                                setState(() {
                                  inputProvider.selectedGroupName = newValue;
                                  print(newValue.runtimeType);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: const Text("Cancel"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (inputProvider.identifikasiController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a value for Nama Bangunan.'),
                                  ),
                                );
                                return;
                              }
                              if (inputProvider.noUrutController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a value for No Urut Banana.'),
                                  ),
                                );
                                return;
                              }
                              if (inputProvider.selectedGroupName == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a value for List Kelompok.'),
                                  ),
                                );
                                return;
                              }

                              inputProvider.formPost(context);
                              if (inputProvider.isLoaded) {
                                // Clear text fields
                                inputProvider.identifikasiController.clear();
                                inputProvider.noUrutController.clear();
                                // Reset dropdown
                                setState(() {
                                  inputProvider.selectedGroupName = null;
                                });
                                // Navigate back
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Successfully Create Form'),
                                  ),
                                );

                              }
                            },
                            child: const Text("Update"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
