class Utils {
  static String getWeekDayName(int day) {
    Map<int, String> weekDayMap = {
      1: "Segunda-Feira",
      2: "Terca-Feira",
      3: "Quarta-Feira",
      4: "Quinta_Feira",
      5: "Sexta-Feira",
      6: "Sabado",
      7: "Domingo ",
    };
    return weekDayMap[day] ?? "-";
  }
}
