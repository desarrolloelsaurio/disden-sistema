FUNCTION ttoh
PARAMETER t_str
PRIVATE t_str, rvalue

************************************************************
*  ttoh(<expC>)                                            *
*  Version # 1.0  FP          Date: 10-26-89               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Converts a time string into hours accurate to     *
*  two decimal places (3:30 = 3.50).  Function returns     *
*  hours on a 24-hour clock basis no matter what format    *
*  the time is passed as.                                  *
************************************************************

DO CASE

  CASE 'pm'$t_str             &&  if it is after noon
    t_str = substr(t_str,1,8)  &&  trim off 'pm'
    rvalue = val(substr(t_str,1,2))*3600 + ;
             val(substr(t_str,4,2))*60 + ;
             val(substr(t_str,7,2)) + 43200

  CASE 'am'$t_str             &&  if it is before noon
    t_str = substr(t_str,1,8)  &&  trim off 'am'
    rvalue = val(substr(t_str,1,2))*3600 + ;
             val(substr(t_str,4,2))*60 + ;
             val(substr(t_str,7,2))

  CASE len(t_str) = 11        &&  if decimal seconds
    rvalue = val(substr(t_str,1,2))*3600 + ;
             val(substr(t_str,4,2))*60 + ;
             val(substr(t_str,7,2)) + ;
             val(substr(t_str,9,3))

  OTHERWISE                   &&  if passed in 24-hour mode
    rvalue = val(substr(t_str,1,2))*3600 + ;
             val(substr(t_str,4,2))*60 + ;
             val(substr(t_str,7,2))

ENDCASE

rvalue = round(rvalue/3600,2)

RETURN(rvalue)
