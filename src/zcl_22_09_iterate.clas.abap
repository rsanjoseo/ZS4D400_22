CLASS zcl_22_09_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_09_iterate IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    CONSTANTS recuento TYPE i VALUE 20.
    DATA numeros TYPE TABLE OF i.

    DO recuento TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numeros.
        WHEN 2.
          APPEND 1 TO numeros.
        WHEN OTHERS.
          APPEND numeros[ sy-index - 1 ] + numeros[ sy-index - 2 ] TO numeros.
      ENDCASE.
    ENDDO.

    out->write( numeros ).

  ENDMETHOD.
ENDCLASS.
