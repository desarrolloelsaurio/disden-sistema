FUNCTION ksctopsi
PARAMETERS pressure
PRIVATE pressure, rvalue

************************************************************
*  ksctopsi(<expN>)                                        *
*  Version # 1.0  FP          Date: 01-31-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts kilograms per square            *
*  centimeter into pounds per square inch.                 *
************************************************************

IF type('pressure') # 'N'
  rvalue = parerror('KSCTOPSI','N')
ELSE
  rvalue = pressure * 2.9264019
ENDIF

RETURN(rvalue)