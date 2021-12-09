class ActionData {
  ActionData({
    required this.stepTravelled,
    required this.stepInfos,
  });

  final List<BaseAction> stepTravelled;
  final List<StepInfo> stepInfos;
}

class StepInfo {
  StepInfo(this.title, this.description);

  final String title;
  final String description;
}

abstract class BaseAction {}

class BuildingAction extends BaseAction {
  BuildingAction(this.buildingName);

  final String buildingName;
}

class RoomAction extends BaseAction {
  RoomAction(this.buildingName, this.roomName);

  final String buildingName;
  final String roomName;
}

final identifyActionDataUsecase = ActionData(
  stepTravelled: [
    BuildingAction('Tòa nhà A'),
    RoomAction('Tòa nhà A', 'Tiếp dân'),
    BuildingAction('Tòa nhà B'),
    RoomAction('Tòa nhà B', 'Kỹ thuật'),
    BuildingAction('Tòa nhà A'),
    RoomAction('Tòa nhà A', 'Tài chính - Kế toán'),
    BuildingAction('Lối ra'),
  ],
  stepInfos: [
    StepInfo(
      'Vào tòa nhà A',
      'Bạn đi vào tòa nhà A xuất trình giấy tờ, để được hướng dẫn. '
          'Bạn phải có giấy xét nghiệm âm tính có hiệu lực trong vòng 24h '
          'và đeo khẩu trang, kiểm tra nhiệt độ để đảm bảo an toàn.',
    ),
    StepInfo(
      'Vào phòng tiếp dân',
      'Đi vào phòng tiếp dân ở tầng một, bạn sẽ được hướng dẫn '
          'làm hồ sơ thủ tục.',
    ),
    StepInfo(
      'Vào tòa nhà B',
      'Đi sang tòa nhà B ở bên tay phải nhà A để tiếp tục làm thủ tục.',
    ),
    StepInfo(
      'Vào phòng kỹ thuật',
      'Tiếp tục vào phòng kĩ thuật ở tầng hai để chụp '
          'ảnh chân dung của căn cước. '
          'Lấy dấu vân tay và điền thông tin của người thân vào hồ sơ. ',
    ),
    StepInfo(
      'Vào tòa nhà A',
      'Quay trở lại nhà A hoàn thành lệ phí thủ tục.',
    ),
    StepInfo(
      'Vào phòng tài chính - kế toán',
      'Lên tầng hai phòng tài chính kế toán để thanh toán tiền thủ tục phí. ',
    ),
    StepInfo(
      'Hoàn thành thủ tục',
      'Bạn đã đăng kí làm thẻ căn cước thành công, thẻ sẽ được gửi về địa chỉ '
          'nhà của bạn trong vòng hai tuần làm việc kể từ hôm nay. '
          'Chào tạm biệt, chúc bạn có một ngày tốt lành!',
    ),
  ],
);

final changeVerifyActionDataUsecase = ActionData(
  stepTravelled: [
    BuildingAction('Tòa nhà A'),
    RoomAction('Tòa nhà A', 'Tiếp dân'),
    BuildingAction('Tòa nhà B'),
    RoomAction('Tòa nhà B', 'Văn phòng - Thống kê'),
    BuildingAction('Tòa nhà A'),
    RoomAction('Tòa nhà A', 'Quản lý đô thị - xây dựng'),
    RoomAction('Tòa nhà A', 'Tài nguyên - môi trường'),
    RoomAction('Tòa nhà A', 'Quản lý đô thị - xây dựng'),
    BuildingAction('Tòa nhà B'),
    RoomAction('Tòa nhà B', 'Tài chính - Kế toán'),
    BuildingAction('Lối ra'),
  ],
  stepInfos: [
    StepInfo(
      'Vào tòa nhà A',
      'Bạn đi vào tòa nhà A xuất trình giấy tờ, để được hướng dẫn. '
          'Bạn phải có giấy xét nghiệm âm tính có hiệu lực trong vòng 24h '
          'và đeo khẩu trang, kiểm tra nhiệt độ để đảm bảo an toàn.',
    ),
    StepInfo(
      'Vào phòng tiếp dân',
      'Đi vào phòng tiếp dân ở tầng một, bạn sẽ được hướng dẫn '
          'làm hồ sơ thủ tục.',
    ),
    StepInfo(
      'Vào tòa nhà B',
      'Đi sang tòa nhà B ở bên tay phải nhà A để tiếp tục làm thủ tục.',
    ),
    StepInfo(
      'Thực hiện phúc tra giấy phép cũ',
      'Bạn phải thực hiện phúc tra giấy phép cũ để xét xem có đủ điều '
          'kiện để đổi sang giấy phép xây dựng mới. '
          'Nếu đủ điều kiện bạn sẽ được cấp một tờ giấy chứng nhận đủ '
          'điều kiện tạm thời. ',
    ),
    StepInfo(
      'Vào tòa nhà A',
      'Quay trở lại tòa nhà A.',
    ),
    StepInfo(
      'Đổi sang giấy phép mới',
      'Mang giấy chứng nhận tạm thời mà bạn vừa có sang phòng "Quản lý đô thị '
          ' - xây dựng" đợi xét duyệt. ',
    ),
    StepInfo(
      'Xin giấy phép về môi trường',
      'Xin giấy phép đủ điều kiện về bảo vệ môi trường và an toàn '
          'trật tự công cộng.',
    ),
    StepInfo(
      'Bổ sung giấy phép môi trường',
      'Quay lại phòng "Quản lý đô thị - xây dựng" để nộp bổ sung giấy phép '
          'môi trường.',
    ),
    StepInfo(
      'Vào tòa nhà B',
      'Sang tòa nhà B hoàn thành lệ phí thủ tục.',
    ),
    StepInfo(
      'Vào phòng tài chính - kế toán',
      'Lên tầng hai phòng tài chính kế toán để thanh toán tiền thủ tục phí. ',
    ),
    StepInfo(
      'Hoàn thành thủ tục',
      'Bạn đã làm thủ tục đổi giấy phép thành công, kết quả sẽ được gửi '
          'cho bạn trong vòng hai tuần làm việc kể từ hôm nay. '
          'Chào tạm biệt, chúc bạn có một ngày tốt lành!',
    ),
  ],
);
