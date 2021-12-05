class ItemModel {
  dynamic text;
  int type;
  int courseId;
  String qrCode;
  double x, y;
  int fontWight;
  double textSize, height,width;
  int align;
  int color;
  ItemModel(
      {required this.text,
      required this.type,
      required this.color,
      required this.courseId,
      required this.qrCode,
      required this.x,
      required this.y,
      required this.fontWight,
      required this.textSize,
      required this.height,required this.width,
      required this.align});
}
