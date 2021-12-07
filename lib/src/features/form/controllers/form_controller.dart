import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tthc/src/features/form/models/tthc_form.dart';
import 'package:tthc/src/features/form/repositories/form_remote.dart';

final formControllerProvider =
    StateNotifierProvider<FormController, AsyncValue<List<TTHCForm>>>((ref) {
  return FormController(ref.read);
});

class FormController extends StateController<AsyncValue<List<TTHCForm>>> {
  FormController(this._read) : super(const AsyncValue.loading()) {
    _read(formRemoteProvider).getForms().then((value) {
      state = AsyncValue.data(value);
    });
  }

  final Reader _read;
}
