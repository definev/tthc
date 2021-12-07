class TTHCForm {
  TTHCForm({
    required this.fullName,
    required this.userAddress,
    required this.identityCard,
    required this.tenThuTuc,
    required this.maSo,
    required this.state,
  });
  factory TTHCForm.fromJson(Map<String, dynamic> json) => TTHCForm(
        fullName: json['fullName'] as String,
        userAddress: json['userAddress'] as String,
        identityCard: json['identityCard'] as String,
        tenThuTuc: json['tenThuTuc'] as String,
        maSo: json['maSo'] as String,
        state: json['state'] as String,
      );

  final String fullName;
  final String userAddress;
  final String identityCard;
  final String tenThuTuc;
  final String maSo;
  final String state;

  TTHCForm copyWith({
    String? fullName,
    String? userAddress,
    String? identityCard,
    String? tenThuTuc,
    String? maSo,
    String? state,
  }) =>
      TTHCForm(
        fullName: fullName ?? this.fullName,
        userAddress: userAddress ?? this.userAddress,
        identityCard: identityCard ?? this.identityCard,
        tenThuTuc: tenThuTuc ?? this.tenThuTuc,
        maSo: maSo ?? this.maSo,
        state: state ?? this.state,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fullName': fullName,
        'userAddress': userAddress,
        'identityCard': identityCard,
        'tenThuTuc': tenThuTuc,
        'maSo': maSo,
        'state': state,
      };
}
