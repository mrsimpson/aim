FUNCTION ZAIM_GET_TASK_BUGZILLA.
*"--------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     REFERENCE(IV_TICKET_NO) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(EV_TITLE) TYPE  STRING
*"     REFERENCE(EV_SEVERITY) TYPE  STRING
*"     REFERENCE(EV_DESCRIPTION) TYPE  STRING
*"     REFERENCE(EV_STATE) TYPE  STRING
*"     REFERENCE(EV_PROCESSOR) TYPE  STRING
*"     REFERENCE(EV_BUG_NOT_FOUND) TYPE  ABAP_BOOL
*"--------------------------------------------------------------------
.
  CLEAR: ev_title, ev_severity, ev_description, ev_state, ev_processor.

  CASE iv_ticket_no.
    WHEN '1'.
      ev_title = 'We need more coffee'.
      ev_severity = 'Very High'.
      ev_description = |We're running out of coffee. This is a serious c
      ev_state = 'New'.
      ev_processor = 'Dev Eloper'.
      ev_bug_not_found = abap_false.
    WHEN OTHERS.
      ev_bug_not_found = abap_true.
  ENDCASE.





ENDFUNCTION.