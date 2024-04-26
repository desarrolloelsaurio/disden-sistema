FUNCTION decode
PARAMETERS pass_str, seed
PRIVATE pass_str, seed, str_len, rvalue, i, place
************************************************************
*  decode(<expC>[,<expN>])                                 *
*  Version # 1.0   FP         Date: 11-02-89               *
*  Programmed by: Malcolm C. Rubel                         *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*  Note: Function decodes string encoded by the CODE       *
*  function.                                               *
************************************************************
IF parameters() = 1           &&  no seed specified
  seed = 10                   &&  set default value
ENDIF
IF seed > 20                  &&  if seed string passed is 
  seed = 17                   &&  too big, set default 
ENDIF                         &&  value
str_len = len(trim(pass_str))
seed = seed + 95              &&  to get to upper ASCII
rvalue = ''
***  decoding loop
FOR i = 1 TO str_len          &&  for each character
  place = asc(substr(pass_str,i,1)) - seed + i
  IF place < 32 .or. place > 128    &&  someone goofed!
    = poperror('You are trying to use DECODE on a string '+;
               'that was not coded properly.  The function '+;
               'will return "******"')
    RETURN('******')
  ELSE 
    rvalue = rvalue + chr(place)
  ENDIF
ENDFOR
RETURN rvalue