CLASS zcl_22_ramificacion_cond DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_ramificacion_cond IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Declarations
**************************

    DATA number1 TYPE i.
    DATA number2 TYPE i.

    DATA result TYPE p LENGTH 8 DECIMALS 2.

    DATA op TYPE c LENGTH 1.

* Input Values
**************************

    number1 = -8.
    number2 = 0.

    op = '/'.

* Calculation
**************************

    CASE op.

      WHEN '+'.
        result = number1 + number2.

      WHEN '-'.
        result = number1 - number2.

      WHEN '*'.
        result = number1 * number2.

      WHEN '/'.
        TRY.
            result = number1 / number2.
          CATCH cx_sy_zerodivide.
            out->write( 'No se puede dividir por cero' ).
            RETURN.
        ENDTRY.
        result = number1 / number2.

      WHEN OTHERS.
        out->write( | Operator { op } not defined | ).
        RETURN.
    ENDCASE.

    DATA(output) = |{ number1 } { op } { number2 } = { result }|.

* Output
**************************

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
