FUNCTION cstr
PARAMETERS num_val, num_dec
PRIVATE num_val, num_dec, str_val, str_len, rvalue

************************************************************
*  cstr(<expN1>[,(<expN2>])                                *
*  Version # 1.1  FP          Date: 02-02-90               *
*  Programmed by: Malcolm C. Rubel                         *
*  Copyright (c) 1989, 1990                                *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*  Note: Function returns the trimmed character string     *
*  of the passed numeric integer.  If decimals are passed, *
*  only the integer value is returned.                     *
*  Modified 2-2-90 to handle any numeric value.  The       *
*  function is set up to handle up to five decimal places  *
*  but can easily be modified to handle more.              *
************************************************************

IF parameters() = 1         &&  no second parameter passed
  num_dec = 5               &&  default number of dec. plcs.
ENDIF+

IF type('num_val') # 'N'
  = poperror('You passed a bad parameter to the '+;
             'function CSTR.  YOU DIE.')
  rvalue = '******'
ELSE
  IF num_val = int(num_val)   &&  number is an integer
    rvalue = ltrim(str(num_val))
  ELSE
    str_val = ltrim(str(num_val,20,num_dec))
    DO WHILE rat('0',str_val) = len(str_val)
      str_val = substr(str_val,1,len(str_val)-1)
    ENDDO
    IF rat('.',str_val) = len(str_val)
      str_val = substr(str_val,1,len(str_val)-1)
    ENDIF
    rvalue = str_val    
  ENDIF
ENDIF
RETURN rvalue