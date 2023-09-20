part of '../../../../utils/import/app_import.dart';

class SectionsLearnCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isEN;
  final Color color;
  final Color foterColor;

  const SectionsLearnCard({
    super.key,
    required this.title,
    required this.image,
    required this.isEN,
    required this.color,
    required this.foterColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.r),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        child: Stack(alignment: Alignment.bottomCenter, children: [
          // * Image
          Image.asset(
            image,
            width: isEN ? 380 : 450,
          ),
          // * Foter
          Container(
            color: foterColor,
            width: double.infinity,
            height: 49,
          ),
          // * Title
          Text(title, style: TextStyle(color: color, fontSize: 30.sp)),
        ]),
      ),
    );
  }
}
