import 'package:flutter/cupertino.dart';
import 'package:form_listing_test/core/resources/repositories/repository.dart';

import '../../core/resources/model/list_form/list_form_model.dart';
import '../../core/utils/enum_state.dart';

class HomeProvider with ChangeNotifier {
  final Repository repository;

  HomeProvider({required this.repository});

  List<ListFormModel> _data = [];
  List<ListFormModel> get data => _data;

  String? _error;
  String? get error => _error;

  RequestState _listFormState = RequestState.Empty;
  RequestState get listFormState => _listFormState;
  // List Form
  bool get isLoading => _listFormState == RequestState.Loading;
  bool get isError => _listFormState == RequestState.Error;
  bool get isLoaded => _listFormState == RequestState.Loaded;

  Future<void> getListForm(BuildContext context) async {
    _listFormState = RequestState.Loading;
    notifyListeners();
    final result = await repository.doGetListForm();
    result.fold((failure) {
      _listFormState = RequestState.Error;
      notifyListeners();
    }, (success) {
      _listFormState = RequestState.Loaded;
      _data = success.response?.data ?? [];
      notifyListeners();
    });
  }
}
