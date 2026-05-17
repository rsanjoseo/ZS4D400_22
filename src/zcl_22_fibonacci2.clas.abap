CLASS zcl_22_fibonacci2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_fibonacci2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    CONSTANTS recuento TYPE i VALUE 20.
    DATA numeros TYPE TABLE OF i.
    DATA salida TYPE TABLE OF STRING.

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

    " Utilizaré el contador como dice el ejercicio, pero es más lógico utilizar sy-tabix en su lugar
    DATA contador TYPE i.
    LOOP AT numeros INTO DATA(numero).
      " APPEND | El elemento { sy-tabix WIDTH = 4 ALIGN = RIGHT } de la serie de Fibonacci, vale { numero WIDTH = 10 ALIGN = RIGHT } | TO salida.
      contador = contador + 1.
      APPEND | El elemento { contador WIDTH = 4 ALIGN = RIGHT } de la serie de Fibonacci, vale { numero WIDTH = 10 ALIGN = RIGHT } | TO salida.
    ENDLOOP.

    out->write( salida ).

  ENDMETHOD.
ENDCLASS.
