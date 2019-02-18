/* Refresh rt_route */
DELETE FROM RT_ROUTE;
DELETE FROM RT_S_GRP_OCP_TIME;
UPDATE TR_SECTSTATE SET ROUTE_PROCESS_STATUS = 0;
/* Refresh fl_train */
DELETE FROM FL_TRAIN;
DELETE FROM FL_TRAIN_RECV;
DELETE FROM FL_TRAIN_SEND;
UPDATE TR_SECTSTATE SET FLOW_STATUS = 1 WHERE FLOW_STATUS = 2;
/* Refresh fl_disassemble */
DELETE FROM FL_DISASSEMBLE;
UPDATE TR_SECTSTATE SET DIS_FLOW_STATUS = 1 WHERE DIS_FLOW_STATUS = 2 AND ROUTE_PROCESS_STATUS = 1;
/* Refresh fl_assemble */
DELETE FROM FL_ASSEMBLE;
UPDATE TR_SECTSTATE SET ASB_FLOW_STATUS = 1 WHERE ASB_FLOW_STATUS = 2 AND ROUTE_PROCESS_STATUS = 1;