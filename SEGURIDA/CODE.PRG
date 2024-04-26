FUNCTION code
PARAMETERS pass_str, seed
PRIVATE pass_str, seed, str_len, rvalue, i, place

************************************************************
*  code(<expC/N>[,<expN>])                                 *
*  Version # 1.0  FP          Date: 4-12-89                *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function translates a character string into a     *
*  coded format.                                           *
************************************************************

IF parameters() = 1              &&  if no seed specified
  seed = 10                      &&  set default value
ENDIF

IF seed > 20                     &&  if seed is too big
  seed = 17                      &&  set default value
ENDIF

DO CASE

  CASE type('pass_str') = 'C'    &&  get rid of spaces
    pass_str = trim(pass_str)

  CASE type('pass_str') = 'N'    &&  convert to character
    pass_str = cstr(pass_str)

  OTHERWISE
    = poperror('The parameter passed to the function '+;
               'CODE is not acceptable.  Function '+;
               "will return '***'.")
    RETURN('***')

ENDCASE

str_len = len(trim(pass_str))
seed = seed + 95              &&  to confuse the voyeur

rvalue = ''                   &&  starting value

***  encryption routine

FOR i = 1 TO str_len
  place = asc(substr(pass_str,i,1)) + seed - i
  rvalue = rvalue + chr(place)
ENDFOR

RETURN(rvalue)
