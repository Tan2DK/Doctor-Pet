import '../../core/data/response/slots_in_day_response.dart';

class SlotsInDayResponseData {
  SlotsInDayResponseData._();
  static List<SlotsInDayResponse> slots = [
    SlotsInDayResponse(
      clinicId: '1',
      date: '2024-03-27',
      listSlotType: [5, 1, 2],
    ),
    SlotsInDayResponse(
      clinicId: '1',
      date: '2024-03-28',
      listSlotType: [3, 7, 4],
    ),
    SlotsInDayResponse(
      clinicId: '1',
      date: '2024-03-29',
      listSlotType: [6, 8, 0],
    ),
  ];
}
