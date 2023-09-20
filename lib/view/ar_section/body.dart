part of '../../utils/import/app_import.dart';

class ErSection extends StatelessWidget {
  static const String nameRoute = "ErSection";
  const ErSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 45.r),
          child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LearnArCard(
                    title: "الاحرف",
                    image: AppImages.arLetters,
                    color: Colors.black26,
                    foterColor: Colors.white),
                LearnArCard(
                    title: "الكلمات",
                    image: AppImages.arWords,
                    color: Colors.black26,
                    foterColor: Colors.white),
                LearnArCard(
                    title: "الجمل",
                    image: AppImages.arSentences,
                    color: Colors.black26,
                    foterColor: Colors.white),
                LearnArCard(
                    title: "الارقام",
                    image: AppImages.arNumbers,
                    color: Colors.black26,
                    foterColor: Colors.white)
              ]),
        ),
      ),
    );
  }
}

class LearnArCard extends StatelessWidget {
  final String title;
  final String image;
  final Color color;
  final Color foterColor;

  const LearnArCard({
    super.key,
    required this.title,
    required this.image,
    required this.color,
    required this.foterColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      child: SizedBox(
        height: 160.h,
        width: 280.w,
        child: Card(
          color: Colors.white70,
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.r))),
          child: Stack(alignment: Alignment.bottomCenter, children: [
            // * Image
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Image.asset(
                image,
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
