class Ticket{
  String title, subtitle;
  int radius;
  List geolocation = [];

  bool isActive;
  String date;
  String time;

  Ticket({
    this.title,
    this.subtitle,
    this.radius,
    this.geolocation,
    this.date,
    this.time
  });
}