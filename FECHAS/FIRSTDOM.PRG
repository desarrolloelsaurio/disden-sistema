FUNCTION firstdom
PARAMETERS p_date
PRIVATE p_date

************************************************************
*  firstdom(<expD/C>)                                      *
*  Version # 1.0  FP          Date: 11-21-89               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function returns the date for the first day       *
*  of the month of the date passed.                        *
************************************************************

IF type('p_date') = 'C'
  p_date = ctod(p_date)
ENDIF

IF type('p_date') # 'D' .or. empty(p_date)
  = poperror('The parameter passed to the function '+;
             'FIRSTDOM is not a date.  Function '+;
             'will return a null date.')
  RETURN({})
ENDIF

RETURN(p_date - day(p_date) + 1)