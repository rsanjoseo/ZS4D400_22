*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

    METHODS get_output
      RETURNING
        VALUE(r_output) TYPE string_table.

    CLASS-METHODS get_counter
      RETURNING
        VALUE(r_conn_counter) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD get_output.
    r_output = VALUE #( ( |Carrier { carrier_id } has connection { connection_id }| ) ).
  ENDMETHOD.

  METHOD get_counter.
    r_conn_counter = conn_counter.
  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.

    conn_counter += 1.
  ENDMETHOD.

ENDCLASS.
