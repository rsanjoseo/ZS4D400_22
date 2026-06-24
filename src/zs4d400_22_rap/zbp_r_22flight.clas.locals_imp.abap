CLASS lhc_zr_22flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Zr22flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Zr22flight~validatePrice.
ENDCLASS.

CLASS lhc_zr_22flight IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatePrice.
    DATA failed_record   LIKE LINE OF failed-Zr22flight.
    DATA reported_record LIKE LINE OF reported-Zr22flight.

    READ ENTITIES OF ZR_22Flight IN LOCAL MODE ENTITY ZR22Flight
    FIELDS ( Price )
    WITH CORRESPONDING #(  keys )
    RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      IF flight-price <= 0.

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-zr22flight.

        reported_record-%tky = flight-%tky.
        reported_record-%msg = new_message(
                          id       = '/LRN/S4D400'
                          number   = '101'
                          severity = ms-error ).
        APPEND reported_record TO reported-zr22flight.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
