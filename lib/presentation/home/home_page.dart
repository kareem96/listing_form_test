import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_listing_test/core/routes/router_import.gr.dart';
import 'package:form_listing_test/presentation/input/input_page.dart';
import 'package:form_listing_test/presentation/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../../core/utils/loading_shimmer.dart';
import '../detail/detail_page.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  late HomeProvider _homeProvider;

  _init() {
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    Future.microtask(() {
      _homeProvider.getListForm(context);
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    // Remove observer
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // Check if app is resumed
    if (state == AppLifecycleState.resumed) {
      // Fetch the list again
      _homeProvider.getListForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listing Form",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildWidgetList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () async {
          final result = await context.router.push(const InputRoute());
          if (result == true) {
            _homeProvider.getListForm(context); // Refresh list on true result
          }
          /*context.router.push(const InputRoute());*/
        },
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildWidgetList() {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return LoadingShimmer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          );
        } else if (provider.isLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (provider.error != null)
                Center(
                  child: Text(
                    "Error: ${provider.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: provider.data.length,
                  itemBuilder: (context, index) {
                    final data = provider.data[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(data.identifikasi ?? ""),
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      id: data.id,
                                      item: data,
                                    )),
                          );
                          if (result == true) {
                            _homeProvider.getListForm(context); // Refresh list on true result
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
