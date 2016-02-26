interface YIF_AIM_TASK_CONSTANTS
  public .


  constants:
    BEGIN OF priority,
               critical TYPE yaim_task_priority VALUE 40,
               high     TYPE yaim_task_priority VALUE 30,
               medium   TYPE yaim_task_priority VALUE 20,
               low      TYPE yaim_task_priority VALUE 10,
             END OF priority .
  constants:
    BEGIN OF status,
               new         TYPE yaim_task_status VALUE '01',
               in_progress TYPE yaim_task_status VALUE '02',
               finished    TYPE yaim_task_status VALUE '03',
               reverted    TYPE yaim_task_status VALUE '04',
             END OF status .
endinterface.