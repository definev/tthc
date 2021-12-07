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

final oneBuildingUsecaseActionData = ActionData(
  stepTravelled: [
    BuildingAction('Tòa nhà chính'),
    RoomAction('Tòa nhà chính', 'Tiếp dân'),
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
