class Utils {
  static String getWeekDayName(int day) {
    Map<int, String> weekDayMap = {
      1: "seg",
      2: "Ter",
      3: "Quar",
      4: "Quin",
      5: "Sex",
      6: "Sab",
      7: "Dom",
    };
    return weekDayMap[day] ?? "-";
  }
}
