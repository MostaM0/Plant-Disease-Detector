import 'package:hive/hive.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String label;

  @HiveField(1)
  late String possibleCauses;

  @HiveField(2)
  late String possibleSolution;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late DateTime dateTime;

  Disease({required this.label, required this.imagePath}) {
    dateTime = DateTime.now();

    switch (label) {
      case "Angular Leaf Spot":
        possibleCauses =
            "A fungal plant disease caused by the pathogen Phaeoisariopsis griseola. It affects bean plants, leading to the development of characteristic angular lesions on the leaves. The disease spreads through spores and can be exacerbated by humid and wet conditions. It can lead to reduced plant vigor and yield losses in bean crops.";
        possibleSolution =
            "To manage Angular Leaf Spot disease in bean plants, consider rotating crops, using resistant varieties, spacing plants for airflow, applying fungicides, removing debris, controlling irrigation, using mulch, timing planting, vigilant monitoring, and integrating pest management approaches.";
        break;

      case "Bean Rust":
        possibleCauses =
            "Primarily caused by fungal pathogens belonging to the Uromyces genus, specifically Uromyces appendiculatus and Uromyces phaseoli. These fungi infect bean plants and lead to the development of rust-like pustules on the leaves. The disease spreads through wind-dispersed spores and can be favored by humid conditions. It often occurs in areas with high humidity and moderate temperatures, creating an environment conducive to fungal growth and infection.";
        possibleSolution =
            "To address Bean Rust disease, implement crop rotation, opt for resistant bean varieties, ensure proper plant spacing, apply fungicides, remove infected plant material, manage irrigation, utilize mulch, time plantings appropriately, conduct regular monitoring, and adopt integrated pest management strategies.";
        break;

      case "Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }
}
