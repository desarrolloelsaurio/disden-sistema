FUNCTION kpltompg
PARAMETERS value
PRIVATE value, rvalue

************************************************************
*  kpltompg(<expN>)                                        *
*  Version # 1.0  FP          Date: 01-31-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts kilometers per liter into       *
*  miles per gallon.   .                                   *
************************************************************

IF type('value') # 'N'
  rvalue = parerror('KPLTOMPG','N')
ELSE
  rvalue = value / 0.42515581
ENDIF

RETURN(rvalue)