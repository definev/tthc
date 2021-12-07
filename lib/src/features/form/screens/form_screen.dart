import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tthc/src/features/form/controllers/form_controller.dart';
import 'package:tthc/src/features/form/screens/send_form_screen.dart';
import 'package:tthc/src/features/map/controllers/blink_assistant_controller.dart';
import 'package:tthc/src/features/map/models/action_data.dart';
import 'package:tthc/src/features/map/screens/map_screen.dart';

class FormScreen extends ConsumerWidget {
  const FormScreen({Key? key}) : super(key: key);

  static const routeName = '/form';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(formControllerProvider);
    final actionDataController = ref.watch(actionDataProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lên lịch hẹn làm thủ tục'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(formControllerProvider),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (context) => const SendFormScreen(),
            ),
          );
        },
        label: const Text('Lên lịch'),
      ),
      body: controller.map(
        data: (data) {
          final tthcForms = data.value;
          return RefreshIndicator(
            onRefresh: () async {
              ref.refresh(formControllerProvider);
            },
            child: ListView.builder(
              itemCount: tthcForms.length,
              itemBuilder: (context, index) {
                final form = tthcForms[index];
                return ListTile(
                  title: Text(form.fullName),
                  subtitle: Text(form.tenThuTuc),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    if (form.tenThuTuc == 'Chứng minh thư') {
                      actionDataController.state = identifyActionDataUsecase;
                    } else {
                      actionDataController.state =
                          changeVerifyActionDataUsecase;
                    }
                    Navigator.pushNamed(context, MapScreen.routeName);
                  },
                );
              },
            ),
          );
        },
        loading: (_) => const Center(child: CircularProgressIndicator()),
        error: (_) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
