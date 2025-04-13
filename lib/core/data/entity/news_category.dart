enum NewsCategory {
  business,
  entertainment,
  general,
  health,
  science,
  sports,
  technology
}

extension NewsCategoryExtension on NewsCategory {
  String get label {
    switch (this) {
      case NewsCategory.business:
        return 'Business';
      case NewsCategory.entertainment:
        return 'Entertainment';
      case NewsCategory.general:
        return 'General';
      case NewsCategory.health:
        return 'Health';
      case NewsCategory.science:
        return 'Science';
      case NewsCategory.sports:
        return 'Sports';
      case NewsCategory.technology:
        return 'Technology';
    }
  }
}
