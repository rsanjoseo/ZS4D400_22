CLASS zcl_22_struct_prueba DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_struct_prueba IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Definición de una estructura llamada ST_CONNECTION
    " Una estructura agrupa varios campos relacionados en una sola unidad lógica
    TYPES: BEGIN OF st_connection,                           " Inicio de la definición de la estructura

             airport_from_id TYPE /dmo/airport_from_id,     " Campo: Aeropuerto origen
             " TYPE indica el tipo de dato reutilizado del Diccionario SAP

             airport_to_id   TYPE /dmo/airport_to_id,       " Campo: Aeropuerto destino
             " Se reutiliza un tipo estándar definido en /DMO/

             carrier_name    TYPE /dmo/carrier_name,        " Campo: Nombre de la aerolínea
             " Tipo de dato texto para el nombre del carrier

           END OF st_connection.                            " Fin de la estructura ST_CONNECTION

    " Declaración de una variable llamada CONNECTION
    " La variable será de tipo estructura ST_CONNECTION
    DATA connection TYPE st_connection.                     " Reserva memoria para la estructura completa

    " Acceso al componente AIRPORT_FROM_ID de la estructura
    " El operador '-' permite acceder a un campo interno de la estructura
    connection-airport_from_id = 'ABC'.                     " Asigna el código del aeropuerto origen

    " Acceso al componente AIRPORT_TO_ID de la estructura
    connection-airport_to_id   = 'XYZ'.                     " Asigna el código del aeropuerto destino

    " Acceso al componente CARRIER_NAME de la estructura
    connection-carrier_name    = 'My Airline'.              " Asigna el nombre de la aerolínea tiene menú contextual

      endmethod.
ENDCLASS.
