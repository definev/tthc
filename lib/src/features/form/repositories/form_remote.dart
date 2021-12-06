import 'package:tthc/src/features/form/models/tthc_form.dart';

abstract class FormRemote {
  Future<bool> sendForm(TTHCForm form);
  Future<List<TTHCForm>> getForms();
}

// TODO: implement FormRemote