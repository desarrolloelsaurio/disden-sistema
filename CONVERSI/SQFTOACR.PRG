FUNCTION sqftoacr
PARAMETERS sqft
PRIVATE sqft, rvalue

************************************************************
*  sqftoacr(expN>)                                         *
*  Version # 1.0  FP          Date: 02-02-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts square feet to acres.           *
************************************************************

IF type('sqft') # 'N'
  rvalue = parerror('SQFTOACR','N')
ELSE
  rvalue = sqft / 43560
ENDIF

RETURN(rvalue)