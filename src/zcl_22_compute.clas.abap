CLASS zcl_22_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA number1 TYPE i VALUE -3.
  DATA number2 TYPE i VALUE 5.
  DATA resultado TYPE p DECIMALS 2.

* DATA(resultado) = number1 / number2. " Con definición en línea se redondea el resultado
  resultado = number1 / number2.
  DATA(salida) = |{ number1 } / { number2 } = { resultado }|.

  out->write( salida ).

  ENDMETHOD.
ENDCLASS.
