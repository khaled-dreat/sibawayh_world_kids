part of '../../utils/import/app_import.dart';

class HomePage extends StatelessWidget {
  static const String nameRoute = "HomePage";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: SingleChildScrollView(
        child: Column(children: [
          // * EN Section
          SectionsLearnCard(
              title: "تعلم أساسيات اللغة الانجليزية",
              image: AppImages.enLangDepartment,
              isEN: true,
              color: Colors.orange.shade800,
              foterColor: Colors.amber.shade100),
          // * ER Section
          SectionsLearnCard(
            title: "تعلم أساسيات اللغة العربية",
            image: AppImages.arLangDepartment,
            isEN: false,
            color: Colors.yellow.shade100,
            foterColor: Colors.amber.shade900,
          )
        ]),
      ),
    );
  }
}
