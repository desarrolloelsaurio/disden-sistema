FUNCTION FCTORIAL
PARAMETERS F_NUM
PRIVATE F_NUM, RVALUE
************************************************************
*  fctorial(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Calculates <expN> factorial.                      *
************************************************************
IF type('f_num') # 'N'
  rvalue = parerror('FCTORIAL','N')
ELSE
  rvalue = f_num
  FOR i = f_num -1 TO 1 STEP -1
    rvalue = rvalue*i
  ENDFOR
ENDIF
RETURN rvalue
