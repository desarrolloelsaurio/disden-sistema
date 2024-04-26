*COSA  
*                              LISTA     TIPO          LIMITE      PORCEN
*SUBINDICE  *                  1         2             3           4
*LIM. INFER *  (   1           " 1"      " 1"          0.00000     90.00
*LIM. SUPER *  (   2,          " 1"      " 1"          0.08000     75.00 
* PVM[J+1] -> COSA[2,4]
* PVM[J]   -> COSA[1,4]
* PR       -> COSTO REAL
* PC[J+1]  -> COSA[2,3]
* PC[J]    -> COSA[1,3]
FUNCTION GET_PRE1
PARAMETER PREC,ARR
PRIVATE PREC,ARR
RETURN (ARR[2,4]*(PREC-ARR[1,3])+ARR[1,4]*(ARR[2,3]-PREC))/(ARR[2,3]-ARR[1,3])
