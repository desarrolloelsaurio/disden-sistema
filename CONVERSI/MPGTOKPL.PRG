FUNCTION mpgtokpl
PARAMETERS value
PRIVATE value, rvalue

************************************************************
*  mpgtokpl(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-01-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts miles per gallon into           *
*  kilometers per liter.                                   *
************************************************************

IF type('value') # 'N'
  rvalue = parerror('MPGTOKPL','N')
ELSE
  rvalue = value * 0.42515581
ENDIF

RETURN(rvalue)