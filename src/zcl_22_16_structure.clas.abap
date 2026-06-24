CLASS zcl_22_16_structure DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_16_structure IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connections TYPE TABLE OF REF TO lcl_connection.

* First Instance
**********************************************************************

    TRY.
      APPEND
        NEW #(
          i_carrier_id    = 'LH'
          i_connection_id = '0400'
        ) TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Second instance
**********************************************************************

    TRY.
      APPEND
        NEW #(
          i_carrier_id    = 'AA'
          i_connection_id = '0017'
        ) TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Third instance
**********************************************************************

    TRY.
      APPEND
        NEW #(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001'
        ) TO connections.

      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

* Output
**********************************************************************

    LOOP AT connections INTO DATA(connection).
      out->write( connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
