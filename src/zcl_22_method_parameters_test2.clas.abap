CLASS zcl_22_method_parameters_test2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_method_parameters_test2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

* Create Instance
**********************************************************************
    connection = NEW #( ).
    connection->set_attributes(
        EXPORTING
            i_carrier_id = 'LH'
            i_connection_id = '0400'
    ).

    APPEND connection TO connections.

    connection = NEW #( ).
    connection->set_attributes(
        EXPORTING
            i_carrier_id = 'BA'
            i_connection_id = '001'
    ).

    APPEND connection TO connections.

    connection = NEW #( ).
    connection->set_attributes(
        EXPORTING
            i_carrier_id = 'UA'
            i_connection_id = '0001'
    ).

    APPEND connection TO connections.

* Calling Functional Method
**********************************************************************
    " in a value assignment (with inline declaration for result)
    DATA(result) = connection->get_output( ).

    " in logical expression
    IF connection->get_output( ) IS NOT INITIAL.

      " as operand in a statement
      LOOP AT connection->get_output( ) INTO DATA(line).

      ENDLOOP.

      " to supply input parameter of another method
      out->write( data = connection->get_output( )
      name = ` ` ).

    ENDIF.

  ENDMETHOD.
ENDCLASS.
