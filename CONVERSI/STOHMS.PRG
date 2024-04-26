FUNCTION stohms
PARAMETERS t_str
PRIVATE t_str, hrs, mins, secs, isdec, rvalue

************************************************************
*  stohms(<expN>)                                          *
*  Version # 1.1  FP          Date:  01-21-91              *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts a numeric time string into      *
*  a character string of hours, minutes, and seconds.      *
*  Modified 1-21-91 to get rid of the MOD function and     *
*  correct a bug in handling midnight and decimals.        *
************************************************************

IF t_str - int(t_str) # 0     &&  if decimal places
  isdec = .t.
ELSE
  isdec = .f.
ENDIF

hrs = int(t_str/3600)         &&  get the number of hours
t_str = t_str - (hrs * 3600)  &&  subtract hours from t_str

mins = int(t_str/60)          &&  get the number of minutes
t_str = t_str - mins * 60     &&  subtract minutes from str.

IF !isdec                &&  if no decimal places

  IF t_str >= 10
    secs = ltrim(str(t_str))
  ELSE
    secs = '0' + ltrim(str(t_str))    &&  pad out string
  ENDIF

ELSE                          &&  if decimal places

  IF t_str >= 10
    secs = str(t_str,5,2)
  ELSE
    secs = '0' + str(t_str,4,2)    &&  pad out string
  ENDIF

ENDIF

hrs = ltrim(str(hrs))         &&  convert to string
mins = ltrim(str(mins))

***  stuff string into '00' 

hrs = stuff('00',3-len(hrs),len(hrs),hrs)
mins = stuff('00',3-len(mins),len(mins),mins)

***  assemble rvalue

rvalue = hrs + ':' + mins + ':' + secs

RETURN(rvalue)