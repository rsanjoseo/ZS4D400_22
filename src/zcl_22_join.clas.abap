CLASS zcl_22_join DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_22_join IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT SINGLE
     " Tabla principal: vuelos (alias 'c' de connect)
     FROM ( /dmo/connect AS c
         " 1er JOIN: unimos aeropuertos para obtener nombre del aeropuerto DE SALIDA
         " Alias 'f' (from) → representa /dmo/airport para el origen
         LEFT OUTER JOIN /dmo/airport AS f
             ON c~airport_from_id = f~airport_id   " condición: id salida = id aeropuerto
     )

     " 2do JOIN: volvemos a unir la MISMA tabla /dmo/airport pero ahora para el DESTINO
     " Alias 't' (to) → representa /dmo/airport para el destino
     " NOTA: misma tabla física, dos alias distintos → dos roles distintos
     LEFT OUTER JOIN /dmo/airport AS t
         ON c~airport_to_id = t~airport_id         " condición: id destino = id aeropuerto

     " Campos que queremos recuperar
     FIELDS
         c~carrier_id,        " aerolínea (ej: 'LH' = Lufthansa)
         c~connection_id,     " número de vuelo (ej: '0400')
         c~airport_from_id,   " código IATA origen (ej: 'FRA')
         c~airport_to_id,     " código IATA destino (ej: 'JFK')
         f~name AS airport_from_name,  " nombre completo del aeropuerto de SALIDA  (viene de alias 'f')
         t~name AS airport_to_name     " nombre completo del aeropuerto de LLEGADA (viene de alias 't')

     " Filtro: solo el vuelo 0400 de Lufthansa
     WHERE c~carrier_id    = 'LH'
       AND c~connection_id = '0400'

     " Declaración inline: ABAP crea la estructura automáticamente
     INTO @DATA(connection_join).

  ENDMETHOD.
ENDCLASS.
