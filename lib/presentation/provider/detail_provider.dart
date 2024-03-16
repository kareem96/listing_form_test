import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:form_listing_test/core/resources/model/list_group/list_group_model.dart';
import 'package:form_listing_test/core/resources/repositories/repository.dart';
import 'package:form_listing_test/core/utils/show_loading_dialog.dart';
import '../../core/utils/enum_state.dart';

class DetailProvider with ChangeNotifier {
  final Repository repository;

  DetailProvider({required this.repository});

  List<ListGroupModel> _data = [];
  List<ListGroupModel> get data => _data;

  final postFormFormKey = GlobalKey<FormState>();

  final identifikasiEditController = TextEditingController();
  final noUrutEditController = TextEditingController();
  final idKelompokEditController = TextEditingController();

  String? _error;
  String? get error => _error;

  RequestState _listGroupState = RequestState.Empty;
  RequestState get listGroupState => _listGroupState;

  RequestState _postState = RequestState.Empty;
  RequestState get postState => _postState;

  int? selectedGroupName;
  // List Form
  bool get isLoading => _listGroupState == RequestState.Loading;
  bool get isError => _listGroupState == RequestState.Error;
  bool get isLoaded => _listGroupState == RequestState.Loaded;


  bool get isLoadingPost => _postState == RequestState.Loading;
  bool get isErrorPost => _postState == RequestState.Error;
  bool get isLoadedPost => _postState == RequestState.Loaded;


  Future<void> getListGroup(BuildContext context) async {
    _listGroupState = RequestState.Loading;
    notifyListeners();
    final result = await repository.doGetListGroup();
    result.fold((failure) {
      _listGroupState = RequestState.Error;
      notifyListeners();
    }, (success) {
      _listGroupState = RequestState.Loaded;
      _data = success.response?.data ?? [];
      notifyListeners();
    });
  }

  Future<void> postEdit(BuildContext context, int id) async {
    _postState = RequestState.Loading;
    Dialogs.show(context);
    notifyListeners();
    final result = await repository.doPutDetail(
        id: id,
        identifikasi: identifikasiEditController.text,
        idKelompok: selectedGroupName,
    );
    result.fold((failure) {
      Dialogs.dismiss(context);
      _postState = RequestState.Error;
      notifyListeners();
    }, (success) {
      Dialogs.dismiss(context);
      _postState = RequestState.Loaded;
      notifyListeners();
    });
  }
}