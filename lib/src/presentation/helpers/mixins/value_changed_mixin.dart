mixin ValueChangeChecker<T> {
  T? initialValue;

  void setInitValue(T? value){
    initialValue = value;
  }

  bool isValueChanged(T? newValue){
    print(initialValue);
    print(newValue);
    print(initialValue.toString() != newValue.toString());
    return initialValue.toString() != newValue.toString();
  }
}