FUNCTION ttos
PARAMETER t_str
PRIVATE t_str, rvalue

************************************************************
*  ttos(<expC>)                                            *
*  Version # 1.2  FP          Date: 08-25-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989,90                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Converts a time string into number of seconds     *
*  since midnight (10:31:20 = 37880).  Function does not   *
*  use SYS(2) Fox function because it operates on any time *
*  string passed.                                          *
*  Modified 1-15-90 to convert TIME(1) strings that        *
*  measure time to two decimal places.                     *
*  Modified 8-25-90 to properly handle times just after    *
*  noon and midnight using AM and PM.                      *
************************************************************

t_str = ltrim(lower(t_str))

IF at(':',t_str) = 2           &&  only one hour digit
  t_str = '0' + t_str
ENDIF

DO CASE

  CASE 'p'$t_str               &&  if it is after noon

    IF substr(t_str,1,2) = '12'  &&  just after noon
      t_str = '00' + substr(t_str,3)
    ENDIF

    rvalue = val(substr(t_str,1,2))*3600 + ;
             val(substr(t_str,4,2))*60 + ;
             val(substr(t_str,7,2)) + 43200

  CASE 'a'$t_str               &&  if it is before noon

    IF substr(t_str,1,2) = '12'  &&  just after midnight
      t_str = '00' + substr(t_str,3)
    ENDIF

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

RETURN(rvalue)