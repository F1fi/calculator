enum Operation{
  plus,
  minus,
  multiplication,
  division,
  equal;

  String getSymbol(){
    switch (this) {
      case Operation.plus:
        return '+';
      case Operation.minus:
        return '-';
      case Operation.multiplication:
        return '*';
      case Operation.division:
        return '/';
      case Operation.equal:
        return '=';
    }
  }
}