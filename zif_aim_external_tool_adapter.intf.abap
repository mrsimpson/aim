interface ZIF_AIM_EXTERNAL_TOOL_ADAPTER
  public .


  methods GET_TASK
    importing
      !IS_EXT_REFERENCE type YAIM_TASK_EXT_REF
    exporting
      !EV_EXISTS type ABAP_BOOL
      !EV_TITLE type YAIM_TASK_TITLE
      !EV_PRIORITY type YAIM_TASK_PRIORITY
      !EV_DESCRIPTION type YAIM_TASK_DESCRIPTION
      !EV_STATUS type YAIM_TASK_STATUS
      !EV_ASSIGNEE type YAIM_TASK_ASSIGNEE
    raising
      ZCX_AIM_EXTERNAL_TOOL .
  methods CHECK_EXISTENCE
    importing
      !IS_EXT_REFERENCE type YAIM_TASK_EXT_REF
    exporting
      !EV_EXISTS type ABAP_BOOL
    raising
      ZCX_AIM_EXTERNAL_TOOL .
endinterface.