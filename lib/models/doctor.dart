class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String imageUrl;
  final double rating;
  final int experience;
  final bool isAvailable;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.imageUrl,
    required this.rating,
    required this.experience,
    this.isAvailable = true,
  });
}
