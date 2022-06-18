class DrugList {
  final int id;
  final String title;
  final String drugCategories;
  final String drugVolume;
  final String drugPrice;
  final String drugImageAsset;

  const DrugList(this.title, this.drugCategories, this.drugVolume,
      this.drugPrice, this.drugImageAsset, this.id);
}

const drugList = [
  DrugList(
      'paracetamol', 'Tablet', '500mg', '₦350.00', 'assets/paracetamol.jpg', 1),
  DrugList(
      'doliprane', 'Capsule', '500mg', '₦350.00', 'assets/Doliprane.png', 2),
  DrugList('paracetamol', 'Tablet', '500mg', '₦350.00',
      'assets/ParacetamolII.png', 3),
  DrugList(
      'ibuprofen', 'Tablet', '500mg', '₦350.00', 'assets/Ibuprofen.png', 4),
  DrugList('panadol', 'Tablet', '500mg', '₦350.00', 'assets/panadol.png', 5),
  DrugList(
      'ibuprofen', 'Tablet', '500mg', '₦350.00', 'assets/IbuprofenII.png', 6),
];

class DrugListII {
  final int id;
  final String title;
  final String drugCategories;
  final String drugVolume;
  final String drugPrice;
  final String drugImageAsset;

  const DrugListII(
      {required this.id,
      required this.title,
      required this.drugCategories,
      required this.drugVolume,
      required this.drugPrice,
      required this.drugImageAsset});
}

const drugListII = [
  DrugListII(
      id: 1,
      title: 'paracetamol',
      drugCategories: 'Tablet',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/paracetamol.jpg'),
  DrugListII(
      id: 2,
      title: 'doliprane',
      drugCategories: 'Capsule',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/Doliprane.png'),
  DrugListII(
      id: 3,
      title: 'paracetamol',
      drugCategories: 'Tablet',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/ParacetamolII.png'),
  DrugListII(
      id: 4,
      title: 'ibuprofen',
      drugCategories: 'Tablet',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/Ibuprofen.png'),
  DrugListII(
      id: 5,
      title: 'panadol',
      drugCategories: 'Tablet',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/panadol.png'),
  DrugListII(
      id: 6,
      title: 'ibuprofen',
      drugCategories: 'Tablet',
      drugVolume: '500mg',
      drugPrice: '₦350.00',
      drugImageAsset: 'assets/IbuprofenII.png'),
];
