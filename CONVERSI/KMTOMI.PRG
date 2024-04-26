FUNCTION kmtomi
PARAMETERS distance
PRIVATE distance, rvalue

************************************************************
*  kmtomi(<expN>)                                          * 
*  Version # 1.0  FP         Date: 01-31-90                *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts kilometers to miles.            *
************************************************************

IF type('distance') # 'N'
  rvalue = parerror('KMTOMI','N')
ELSE
  rvalue = distance * .6213712
ENDIF

RETURN(rvalue)