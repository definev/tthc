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
    BuildingAction('Tòa nhà chính'),
    RoomAction('Tòa nhà chính', 'Tiếp dân'),
    RoomAction('Tòa nhà chính', 'Kỹ thuật'),
    RoomAction('Tòa nhà chính', 'Tài chính - Kế toán'),
    BuildingAction('Lối ra'),
  ],
  stepInfos: [
    StepInfo(
      'Vào tòa nhà chính',
      'Bạn đi vào tòa nhà chính xuất trình giấy tờ, để được hướng dẫn. '
          'Bạn phải có giấy xét nghiệm âm tính có hiệu lực trong vòng 24h '
          'và đeo khẩu trang, kiểm tra nhiệt độ để đảm bảo an toàn.',
    ),
    StepInfo(
      'Vào phòng tiếp dân',
      'Đi vào phòng tiếp dân ở tầng một, bạn sẽ được hướng dẫn '
          'làm hồ sơ thủ tục.',
    ),
    StepInfo(
      'Vào phòng kỹ thuật',
      'Tiếp tục vào phòng kĩ thuật ở tầng hai để chụp '
          'ảnh chân dung của căn cước. '
          'Lấy dấu vân tay và điền thông tin của người thân vào hồ sơ. ',
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
    BuildingAction('Tòa nhà chính'),
    RoomAction('Tòa nhà chính', 'Tiếp dân'),
    RoomAction('Tòa nhà chính', 'Văn phòng - Thống kê'),
    RoomAction('Tòa nhà chính', 'Quản lý đô thị - xây dựng'),
    RoomAction('Tòa nhà chính', 'Tài nguyên - môi trường'),
    RoomAction('Tòa nhà chính', 'Quản lý đô thị - xây dựng'),
    RoomAction('Tòa nhà chính', 'Tài chính - Kế toán'),
    BuildingAction('Lối ra'),
  ],
  stepInfos: [
    StepInfo(
      'Vào tòa nhà chính',
      'Bạn đi vào tòa nhà chính xuất trình giấy tờ, để được hướng dẫn. '
          'Bạn phải có giấy xét nghiệm âm tính có hiệu lực trong vòng 24h '
          'và đeo khẩu trang, kiểm tra nhiệt độ để đảm bảo an toàn.',
    ),
    StepInfo(
      'Vào phòng tiếp dân',
      'Đi vào phòng tiếp dân ở tầng một, bạn sẽ được hướng dẫn '
          'làm hồ sơ thủ tục.',
    ),
    StepInfo(
      'Thực hiện phúc tra giấy phép cũ',
      'Bạn phải thực hiện phúc tra giấy phép cũ để xét xem có đủ điều '
          'kiện để đổi sang giấy phép xây dựng mới. '
          'Nếu đủ điều kiện bạn sẽ được cấp một tờ giấy chứng nhận đủ '
          'điều kiện tạm thời. ',
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
