CLASS zcl_22_11_instances DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ZCL_22_11_INSTANCES IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA conexion TYPE REF TO lcl_connection.
    DATA conexiones TYPE TABLE OF REF TO lcl_connection.

    conexion = NEW #( ).

    conexion->carrier_id = 'LH'.
    conexion->connection_id = '0400'.

    APPEND conexion TO conexiones.

    conexion = NEW #( ).

    conexion->carrier_id = 'AA'.
    conexion->connection_id = '0017'.

    APPEND conexion TO conexiones.

    conexion = NEW #( ).

    conexion->carrier_id = 'SQ'.
    conexion->connection_id = '0001'.

    APPEND conexion TO conexiones.

  ENDMETHOD.
ENDCLASS.
