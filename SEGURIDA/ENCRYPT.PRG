FUNCTION encrypt
PARAMETERS pass_str, seed
PRIVATE pass_str, seed, i, rvalue, pos_amt

************************************************************
*  encrypt(<expC/N>[,<expN>])                              *
*  Version #  1.0   FP        Date: 11-10-89               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function returns a numeric value that repesents   *
*  the code for the input string.  This function is a one- *
*  way street.  Once the string is encrypted you cannot    *
*  unencrypt it.  You can use it only to compare if the    *
*  encrypted string is the same as the string entered.     *
*  Function is best used for passwords.                    *
************************************************************

IF parameters() = 1           &&  no seed passed
  seed = 2
ENDIF

IF type('pass_str') = 'N'     &&  convert numbers to char
  pass_str = cstr(pass_str)
ENDIF

rvalue = 0                    &&  starting value

***  encryption loop

FOR i = 1 TO len(pass_str)
  pos_amt = asc(subst(pass_str,i,1))*(i-seed)
  rvalue = rvalue + pos_amt
ENDFOR

RETURN(rvalue)
