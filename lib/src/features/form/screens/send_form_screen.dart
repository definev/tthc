import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/action/screens/action_screen.dart';
import 'package:tthc/src/features/form/controllers/form_controller.dart';
import 'package:tthc/src/features/form/controllers/send_form_controller.dart';
import 'package:tthc/src/features/location/screens/location_screen.dart';

class SendFormScreen extends ConsumerWidget {
  const SendFormScreen({Key? key}) : super(key: key);

  static const routeName = '/form/send-form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(sendFormControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lên lịch hẹn làm thủ tục'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final success = await controller.sendForm(context);
          if (success) {
            ref.refresh(formControllerProvider);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.send_rounded),
        label: const Text('Gửi'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Họ tên'),
                  onChanged: (value) => controller
                      .updateForm(controller.form.copyWith(fullName: value)),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Số chứng minh thư',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.updateForm(
                    controller.form.copyWith(identityCard: value),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 56,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: Text(
                      controller.form.tenThuTuc.isNotEmpty
                          ? 'Thủ tục: ${controller.form.tenThuTuc}'
                          : 'Chọn thủ tục',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      final tthcAction = await Navigator.pushNamed(
                        context,
                        ActionScreen.routeName,
                      );
                      if (tthcAction != null) {
                        controller.updateForm(
                          controller.form.copyWith(
                            tenThuTuc: tthcAction.toString(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 56,
                  width: double.maxFinite,
                  child: OutlinedButton(
                    child: Text(
                      controller.form.userAddress.isNotEmpty
                          ? controller.form.userAddress
                          : 'Chọn địa chỉ',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      final tthcAction = await Navigator.pushNamed(
                        context,
                        LocationScreen.routeName,
                      );
                      if (tthcAction != null) {
                        controller.updateForm(
                          controller.form.copyWith(
                            userAddress: tthcAction.toString(),
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
