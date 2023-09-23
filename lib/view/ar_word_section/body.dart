part of '../../utils/import/app_import.dart';

class ArWordSection extends StatelessWidget {
  static const String nameRoute = "ArWordSection";
  const ArWordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: Column(children: [
        ArWordCard(
            title: "أقراء الاحرف",
            image: AppImages.arWrite,
            color: Colors.black,
            foterColor: Colors.white),
        ArWordCard(
            title: "أكتب الاحرف",
            image: AppImages.arRead,
            color: Colors.black,
            foterColor: Colors.white)
      ]),
    );
  }
}

class ArWordCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Color foterColor;

  const ArWordCard({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.foterColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 20.r),
      child: SizedBox(
        height: 200.h,
        width: 320.w,
        child: Card(
          color: Colors.white70,
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            // * Image
            Padding(
              padding: EdgeInsets.only(bottom: 47.r),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
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
      ),
    );
  }
}
