FUNCTION ar_ncnt
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, pcount, ar_len, i
PRIVATE ar_count, element, mark

************************************************************
*  ar_ncnt(<expC>[,<expN>])                                *
*  Version # 2.1              Date: 08-18-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function returns the number of numeric data in an *
*  array.  This function works on one- and two-dimensional *
*  arrays.  The default is the first column of the array   *
*  unless <expN> is specified.                             *
*  Modified 1-18-91 to take advantage of ALEN.             *
*  Modified 8-18-91 to correct header box and the return   *
*  values for 0 numeric elements.                          *
************************************************************

pcount = parameters()

IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to function AR_NCNT '+;
             'is not an array.  Function will '+;
             'return a divide overflow.')
  RETURN(1/0)
ENDIF

ar_len = alen(&ar_name,1)     &&  how long is it
ar_count = 0

IF type(ar_name+'[3600,1]') # 'U' &&  one-dimensional array

  FOR i = 1 to ar_len

    IF type(ar_name+'[i]') = 'N'  &&  element type
      ar_count = ar_count + 1 &&  add to counter
    ENDIF

  ENDFOR

ELSE                          &&  we have a two-dim. array

  IF pcount = 1               &&  if no column number passed
    col_no = 1                &&  use the default
  ENDIF

  FOR i = 1 to ar_len

    IF type(ar_name+'[i,col_no]') = 'N'  &&  element type
      ar_count = ar_count + 1 &&  add to counter
    ENDIF

  ENDFOR

ENDIF

RETURN(ar_count)