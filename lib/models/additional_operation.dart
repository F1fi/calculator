enum AdditionalOperation{
  clear,
  mirrorValue,
  procent;

  String getString(){
    switch (this) {
      case AdditionalOperation.clear:
        return 'AC';
      case AdditionalOperation.mirrorValue:
        return '+/-';
      case AdditionalOperation.procent:
        return '%';

    }
  }
}