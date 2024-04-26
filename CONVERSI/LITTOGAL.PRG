FUNCTION littogal
PARAMETERS volume
PRIVATE volume, rvalue

************************************************************
*  littogal(<expN>)                                        *
*  Version # 1.0  FP          Date:  01-31-90              *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts liters to gallons.              *
************************************************************

IF type('volume') # 'N'
  rvalue = parerror('LITTOGAL','N')
ELSE
  rvalue = volume / 3.785306
ENDIF

RETURN(rvalue)