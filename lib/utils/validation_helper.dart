class ValidationHelper {
  // Regex patterns for validation
  static final RegExp _titleRegex = RegExp(r'^[a-zA-Z0-9\s\-_.,]+$');
  static final RegExp _amountRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  static final RegExp _descriptionRegex = RegExp(r'^[a-zA-Z0-9\s\-_.,!?\n]*$');

  // Expense categories
  static const List<String> expenseCategories = [
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Entertainment',
    'Bills & Utilities',
    'Health & Fitness',
    'Travel',
    'Education',
    'Business',
    'Others',
  ];

  // Validate expense title
  static String? validateTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Title is required';
    }
    if (value.trim().length < 3) {
      return 'Title must be at least 3 characters';
    }
    if (value.trim().length > 50) {
      return 'Title must be less than 50 characters';
    }
    if (!_titleRegex.hasMatch(value.trim())) {
      return 'Title contains invalid characters';
    }
    return null;
  }

  // Validate expense amount
  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }
    if (!_amountRegex.hasMatch(value.trim())) {
      return 'Enter a valid amount (e.g., 10.50)';
    }
    double? amount = double.tryParse(value.trim());
    if (amount == null || amount <= 0) {
      return 'Amount must be greater than 0';
    }
    if (amount > 999999.99) {
      return 'Amount is too large';
    }
    return null;
  }

  // Validate expense description
  static String? validateDescription(String? value) {
    if (value != null && value.trim().isNotEmpty) {
      if (value.trim().length > 200) {
        return 'Description must be less than 200 characters';
      }
      if (!_descriptionRegex.hasMatch(value.trim())) {
        return 'Description contains invalid characters';
      }
    }
    return null;
  }

  // Validate category
  static String? validateCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Category is required';
    }
    if (!expenseCategories.contains(value)) {
      return 'Please select a valid category';
    }
    return null;
  }

  // Format amount for display
  static String formatAmount(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  // Get category icon
  static String getCategoryIcon(String category) {
    switch (category) {
      case 'Food & Dining':
        return '🍽️';
      case 'Transportation':
        return '🚗';
      case 'Shopping':
        return '🛍️';
      case 'Entertainment':
        return '🎬';
      case 'Bills & Utilities':
        return '📄';
      case 'Health & Fitness':
        return '💪';
      case 'Travel':
        return '✈️';
      case 'Education':
        return '📚';
      case 'Business':
        return '💼';
      case 'Others':
        return '📝';
      default:
        return '💰';
    }
  }

  // Get category color
  static int getCategoryColor(String category) {
    switch (category) {
      case 'Food & Dining':
        return 0xFFFF6B6B;
      case 'Transportation':
        return 0xFF4ECDC4;
      case 'Shopping':
        return 0xFFFFE66D;
      case 'Entertainment':
        return 0xFF95E1D3;
      case 'Bills & Utilities':
        return 0xFFA8E6CF;
      case 'Health & Fitness':
        return 0xFFFF8B94;
      case 'Travel':
        return 0xFF88D8B0;
      case 'Education':
        return 0xFFB4A7D6;
      case 'Business':
        return 0xFFD4A4EB;
      case 'Others':
        return 0xFFBDBDBD;
      default:
        return 0xFF6C5CE7;
    }
  }
}