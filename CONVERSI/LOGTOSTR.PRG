FUNCTION logtostr
PARAMETER log_val
PRIVATE log_val, rvalue

************************************************************
*  logtostr(<expL>)                                        *
*  Version # 1.0  FP          Date: 02-06-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function returns the character string "Y" for     *
*  logical TRUE or "N" for logical FALSE.                  *
************************************************************

IF type('log_val') # 'L'      &&  if not a logical value
  = poperror('Parameter passed to the function '+;
             'LOGTOSTR is not of the logical data '+;
             'type.  Function will return "*".')
  rvalue = '*'
ELSE
  rvalue = iif(log_val,'Y','N')
ENDIF

RETURN(rvalue)