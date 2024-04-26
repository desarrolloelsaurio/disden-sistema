FUNCTION psitoksc
PARAMETERS pressure
PRIVATE pressure, rvalue

************************************************************
*  psitoksc(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-02-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts pounds per square inch into     *
*  kilograms per square centimeter.                        *
************************************************************

IF type('pressure') # 'N'
  rvalue = parerror('PSITOKSC','N')
ELSE
  rvalue = pressure / 2.9264019
ENDIF

RETURN(rvalue)
