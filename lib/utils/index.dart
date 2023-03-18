String convertDate(String weekday) {
  String result = "";
  switch (weekday) {
    case 'Monday':
      return 'T2';
    case 'Tuesday':
      return 'T3';
    case 'Wednesday':
      return 'T4';
    case 'Thursday':
      return 'T5';
    case 'Friday':
      return 'T6';
    case 'Saturday':
      return 'T7';
    case 'Sunday':
      return 'CN';
  }
  return result;
}
