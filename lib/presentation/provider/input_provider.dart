import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_listing_test/core/resources/model/list_group/list_group_model.dart';
import 'package:form_listing_test/core/resources/repositories/repository.dart';
import 'package:form_listing_test/core/utils/show_loading_dialog.dart';
import 'package:form_listing_test/core/utils/validator_helper.dart';

import '../../core/resources/model/list_form/list_form_model.dart';
import '../../core/utils/enum_state.dart';

class InputProvider with ChangeNotifier {
  final Repository repository;

  InputProvider({required this.repository});

  List<ListGroupModel> _data = [];

  List<ListGroupModel> get data => _data;

  final postFormFormKey = GlobalKey<FormState>();
  final identifikasiController = TextEditingController();
  final noUrutController = TextEditingController();
  final idKelompokController = TextEditingController();

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

  void formPost(BuildContext context) async {
    Dialogs.show(context);
    notifyListeners();
    _postState = RequestState.Loading;
    final result = await repository.doPostFrom(
      identifikasi: identifikasiController.text,
      noUrut: int.parse(noUrutController.text),
      idKelompok: selectedGroupName,
    );
    result.fold((failure) {
      _error = failure.message.toString();
      _postState = RequestState.Error;
      Dialogs.dismiss(context);
      notifyListeners();
    }, (success) {
      Dialogs.dismiss(context);
      _postState = RequestState.Loaded;
      log(success.status.toString());
      notifyListeners();
    });
  }
}
