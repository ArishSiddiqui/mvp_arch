const List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

extension DateExtension on DateTime {
  String toNamedSuffixFormat() {
    String day = this.day.toString();
    String suffix = _getDaySuffix(this.day);
    String month = months[this.month - 1];
    String year = this.year.toString();

    return "$day$suffix $month $year";
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
