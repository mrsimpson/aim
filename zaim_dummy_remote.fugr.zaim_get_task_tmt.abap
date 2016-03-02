FUNCTION ZAIM_GET_TASK_TMT.
*"--------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_TICKET_NO) TYPE  CHAR10
*"  EXPORTING
*"     REFERENCE(EV_TITLE) TYPE  CHAR100
*"     REFERENCE(EV_SEVERITY) TYPE  CHAR1
*"     REFERENCE(EV_DESCRIPTION) TYPE  STRING
*"     REFERENCE(EV_STATE) TYPE  CHAR1
*"     REFERENCE(EV_PROCESSOR) TYPE  STRING
*"--------------------------------------------------------------------
CLEAR: ev_title, ev_severity, ev_description, ev_state, ev_processor.

  CASE iv_ticket_no.
    WHEN '1'.
      ev_title = 'System not responding at all'.
      ev_severity = 'L'.
      ev_description = |Performance really sucks. I clicked the "shutdow
      ev_state = '2'.
      ev_processor = 'Dev Eloper'.
    WHEN OTHERS.
      ev_state = 'Ö'. "Constant for "not found"
  ENDCASE.





ENDFUNCTION.