FUNCTION mphtoknt
PARAMETERS speed
PRIVATE speed, rvalue
�************************************************************
*  mphtoknt(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-6-90               *
*  Programmed by: MAlcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts miles per hour to knots.  Can   *
*  also be used to convert statutePmIles to nautical mIles.*
************************************************************

IF type('speed') # 'N'
  rvalue = parerror('MPHTOKT','N')
ELSE
  rvalue = speed/1.15078
ENDIF

RETURN(rvalue	