FUNCTION firstdoq
PARAMETERS p_date, delta
PRIVATE p_date, delta, cur_quar, delta_q, delta_y, rvalue

************************************************************
*  firstdoq(<expD/C>[,<expN>])                             *
*  Version #  1.0  FP         Date:  11-21-89              *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function calculates the first day of the current  *
*  quarter and then skips either forward or backward the   *
*  specified number of quarters.  Function returns the     *
*  first day of the specified quarter.                     *
************************************************************

IF parameters() = 1           &&  only one parameter passed
  delta = 0
ENDIF

delta_y = 0                   &&  starting value

IF type('p_date') = 'C'
  p_date = ctod(p_date)
ENDIF

IF type('p_date') # 'D' .or. empty(p_date)
  RETURN(parerror('FIRSTDOQ','D'))
ENDIF

***  which quarter of year is current date in?

DO CASE

  CASE month(p_date) <= 3
    cur_quar = 1

  CASE month(p_date) <= 6
    cur_quar = 2

  CASE month(p_date) <= 9
    cur_quar = 3

  OTHERWISE
    cur_quar = 4

ENDCASE

***  calculate the changes to be made

delta_q = cur_quar + delta

IF delta_q > 0
    cur_quar = mod(delta_q,4)
    delta_y = int((delta_q-1)/4)
ELSE
    cur_quar = delta_q + 4*int(delta_q/4)
    delta_y = int(delta_q/4)

    IF cur_quar <= 0          &&  date crosses another yr.
      cur_quar = cur_quar + 4
      delta_y = delta_y -1
    ENDIF

ENDIF

***  make the changes to the date

DO CASE

  CASE cur_quar = 1
    p_date = ctod('01/01/' + ltrim(str(year(p_date))))

  CASE cur_quar = 2
    p_date = ctod('04/01/' + ltrim(str(year(p_date))))

  CASE cur_quar = 3
    p_date = ctod('07/01/' + ltrim(str(year(p_date))))

  OTHERWISE
    p_date = ctod('10/01/' + ltrim(str(year(p_date))))

ENDCASE

IF delta_y = 0                &&  if in same year
  rvalue = p_date
ELSE                          &&  if in different year
  rvalue = newyear(p_date,delta_y)   &&  change the year
ENDIF

RETURN(rvalue)