class Dua {
  final int? id;
  final String arabicText;
  final String bengaliTranslation;
  final String englishTranslation;
  final String transliteration;
  final String category;
  final String? audioUrl;
  final List<String> tags;

  Dua({
    this.id,
    required this.arabicText,
    required this.bengaliTranslation,
    required this.englishTranslation,
    required this.transliteration,
    required this.category,
    this.audioUrl,
    this.tags = const [],
  });

  // Convert Dua object to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'arabic_text': arabicText,
      'bengali_translation': bengaliTranslation,
      'english_translation': englishTranslation,
      'transliteration': transliteration,
      'category': category,
      'audio_url': audioUrl,
      'tags': tags.join(','), // Store as comma-separated string
    };
  }

  // Create Dua object from database Map
  factory Dua.fromMap(Map<String, dynamic> map) {
    return Dua(
      id: map['id'] as int?,
      arabicText: map['arabic_text'] as String? ?? '',
      bengaliTranslation: map['bengali_translation'] as String? ?? '',
      englishTranslation: map['english_translation'] as String? ?? '',
      transliteration: map['transliteration'] as String? ?? '',
      category: map['category'] as String? ?? '',
      audioUrl: map['audio_url'] as String?,
      tags: map['tags'] != null && map['tags'].toString().isNotEmpty
          ? map['tags'].toString().split(',')
          : [],
    );
  }

  // Create a copy of Dua with updated fields
  Dua copyWith({
    int? id,
    String? arabicText,
    String? bengaliTranslation,
    String? englishTranslation,
    String? transliteration,
    String? category,
    String? audioUrl,
    List<String>? tags,
  }) {
    return Dua(
      id: id ?? this.id,
      arabicText: arabicText ?? this.arabicText,
      bengaliTranslation: bengaliTranslation ?? this.bengaliTranslation,
      englishTranslation: englishTranslation ?? this.englishTranslation,
      transliteration: transliteration ?? this.transliteration,
      category: category ?? this.category,
      audioUrl: audioUrl ?? this.audioUrl,
      tags: tags ?? this.tags,
    );
  }

  // Convert to JSON (useful for debugging)
  Map<String, dynamic> toJson() => toMap();

  // Create from JSON
  factory Dua.fromJson(Map<String, dynamic> json) => Dua.fromMap(json);

  @override
  String toString() {
    return 'Dua{id: $id, bengaliTranslation: $bengaliTranslation, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Dua && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}