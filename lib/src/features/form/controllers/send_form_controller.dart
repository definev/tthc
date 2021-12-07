import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tthc/src/features/form/models/tthc_form.dart';
import 'package:tthc/src/features/form/repositories/form_remote.dart';
import 'package:uuid/uuid.dart';

final sendFormControllerProvider =
    ChangeNotifierProvider.autoDispose<SendFormController>((ref) {
  return SendFormController(ref.read);
});

class SendFormController extends ChangeNotifier {
  SendFormController(this._read);
  final Reader _read;

  TTHCForm form = TTHCForm(
    fullName: '',
    userAddress: '',
    identityCard: '',
    tenThuTuc: '',
    maSo: const Uuid().v4(),
    state: const Uuid().v4(),
  );

  void updateForm(TTHCForm form) {
    this.form = form;
    notifyListeners();
  }

  Future<bool> sendForm(BuildContext context) async {
    return _read(formRemoteProvider).sendForm(form);
  }
}
