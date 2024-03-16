import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_listing_test/core/resources/model/list_form/list_form_model.dart';
import 'package:form_listing_test/presentation/provider/detail_provider.dart';
import 'package:form_listing_test/presentation/provider/input_provider.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DetailPage extends StatefulWidget {
  final int id;
  final ListFormModel item;
  const DetailPage({super.key, required this.id, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailProvider _detailProvider;

  _init(){
    _detailProvider = Provider.of<DetailProvider>(context, listen: false);
    _detailProvider.identifikasiEditController.text = widget.item.identifikasi ?? '';
    _detailProvider.noUrutEditController.text = widget.item.noUrut.toString() ?? '';
    // _detailProvider.selectedGroupName = widget.item.groupId ?? 0;
    Future.microtask(() {
      _detailProvider.getListGroup(context);
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
              setState(() {
                _detailProvider.selectedGroupName = null;
              });
              Navigator.of(context).pop(true);
            },
            icon: Icon(Icons.arrow_back)
        ),
        title: const Text(
          "Edit Form",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<DetailProvider>(
          builder: (context, provider, _) {
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
                  _detailProvider.identifikasiEditController.text = widget.item.identifikasi ?? '';
                  _detailProvider.noUrutEditController.text = widget.item.noUrut.toString() ?? '';
                  setState(() {
                    _detailProvider.selectedGroupName = null;
                  });
                  return true;
                }, child: Column(

                children: [
                  Row(
                    children: [
                      const Expanded(flex: 1, child: Text("Nama Bangunan : ", )),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            controller: provider.identifikasiEditController,
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
                            controller: provider.noUrutEditController,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
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
                            value: provider.selectedGroupName,
                            decoration: const InputDecoration(
                              hintText: 'Select your data',
                              contentPadding: EdgeInsets.all(8),
                              border: InputBorder.none,
                            ),
                            items: provider.data.map((group) {
                              return DropdownMenuItem<int>(
                                value: group.id ?? 0,
                                child: Text(
                                  group.name ?? "",
                                ),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                provider.selectedGroupName = newValue;
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
                          child: Text("Cancel"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (provider.identifikasiEditController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a value for Nama Bangunan.'),
                                ),
                              );
                              return;
                            }
                            if (provider.noUrutEditController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a value for No Urut Banana.'),
                                ),
                              );
                              return;
                            }
                            if (provider.selectedGroupName == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select a value for List Kelompok.'),
                                ),
                              );
                              return;
                            }
                            provider.postEdit(context, widget.id);
                            if (provider.isLoaded) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Successfully Edit Form'),
                                ),
                              );
                            }
                          },
                          child: Text("Update"),
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
