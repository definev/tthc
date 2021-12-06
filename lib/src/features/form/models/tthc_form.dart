import 'dart:convert';

/// Em để tạm như này mấy thông tin trong kế hoạch lúc đầu thôi
///
/// còn anh tùy chỉnh gì thì cứ chỉnh sửa nhé anh Chúc Anh
///
/// Em sử dụng cái data class generator trong vscode để gen đống parse json này
/// anh tham khảo nhé
class TTHCForm {
  const TTHCForm({
    required this.id,
    required this.name,
    required this.identity,
    required this.tthcActionId,
    required this.tthcLocationId,
  });

  factory TTHCForm.fromMap(Map<String, dynamic> map) {
    return TTHCForm(
      id: map['id'] as String,
      name: map['name'] as String,
      identity: map['identity'] as String,
      tthcActionId: map['tthcActionId'] as String,
      tthcLocationId: map['tthcLocationId'] as String,
    );
  }

  factory TTHCForm.fromJson(String source) =>
      TTHCForm.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String identity;
  final String tthcActionId;
  final String tthcLocationId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'identity': identity,
      'tthcActionId': tthcActionId,
      'tthcLocationId': tthcLocationId,
    };
  }

  String toJson() => json.encode(toMap());
}
