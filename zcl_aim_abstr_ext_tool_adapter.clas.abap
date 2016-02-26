class ZCL_AIM_ABSTR_EXT_TOOL_ADAPTER definition
  public
  abstract
  create public .

public section.

  interfaces ZIF_AIM_EXTERNAL_TOOL_ADAPTER .
protected section.

  methods VALIDATE_REFERENCE_FORMAT
    importing
      !IV_EXT_REFERENCE_EXTERNAL_ID type YAIM_TASK_EXT_REF-EXTERNAL_ID
    raising
      ZCX_AIM_EXTERNAL_TOOL .
  methods CHECK_REMOTE_CONNECTION
    raising
      ZCX_AIM_EXTERNAL_TOOL .
  methods GET_TASK_FROM_EXT_SYSTEM
  abstract
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
  methods MAP_FULL_NAME_TO_USER
    importing
      !IV_PERSON_FULL_NAME type STRING
    returning
      value(RV_USER_NAME) type YAIM_TASK_ASSIGNEE .
private section.
ENDCLASS.



CLASS ZCL_AIM_ABSTR_EXT_TOOL_ADAPTER IMPLEMENTATION.


METHOD check_remote_connection.
    "This is only a stub which might be redefined
  ENDMETHOD.


METHOD map_full_name_to_user.

    SELECT SINGLE bname FROM
            user_addrp
            INTO @rv_user_name
            WHERE   name_text  = @iv_person_full_name.

  ENDMETHOD.


METHOD validate_reference_format.
*    ensures only alphanumeric characters are used, c. f. http://regexlib.com/REDetails.aspx?regexp_id=1014
    IF iv_ext_reference_external_id NE |{ match( val = iv_ext_reference_external_id regex = '^[a-zA-Z0-9]+$' ) }|.
      RAISE EXCEPTION TYPE zcx_aim_external_tool
        EXPORTING
          textid = zcx_aim_external_tool=>invalid_id_format.
    ENDIF.
  ENDMETHOD.


METHOD zif_aim_external_tool_adapter~check_existence.
*    Default implementation: Do a complete remote-retrieval.
*    This method might be improved with respect to performance using a redefinition
    get_task_from_ext_system(
      EXPORTING
        is_ext_reference      = is_ext_reference
      IMPORTING
        ev_exists             = ev_exists
    ).
  ENDMETHOD.


METHOD zif_aim_external_tool_adapter~get_task.

*    Callback for checking that the external ID has the proper format
    validate_reference_format( is_ext_reference-external_id ).

*    get the remote content
    get_task_from_ext_system(
      EXPORTING
        is_ext_reference      = is_ext_reference
      IMPORTING
        ev_exists             = ev_exists
        ev_title              = ev_title
        ev_priority           = ev_priority
        ev_description        = ev_description
        ev_status             = ev_status
        ev_assignee           = ev_assignee
    ).

  ENDMETHOD.
ENDCLASS.