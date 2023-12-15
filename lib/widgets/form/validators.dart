String? requiredField(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return "Please enter a $fieldName.";
  }

  return null;
}
