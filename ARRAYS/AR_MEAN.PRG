FUNCTION ar_mean
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, pcount, ar_len, i
PRIVATE ar_count, ar_sum, rvalue

************************************************************
*  ar_mean(<expC>[,<expN>])                                *
*  Version # 2.0  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function returns the mean (average) of all        *
*  numeric data in an array.  This function works on one-  *
*  and two-dimensional arrays.  The default is the first   *
*  column of the array unless <expN> is specified.         *
*  Modified 1-18-91 to use ALEN and EVALUATE.  Speed       *
*  increase is about 30%.                                  *
************************************************************

pcount = parameters()

IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to function AR_MEAN '+;
             'is not an array.  Function will '+;
             'return a divide overflow.')
  RETURN(1/0)
ENDIF

ar_len = alen(&ar_name,1)     &&  how long is it
ar_count = 0
ar_sum = 0

IF type(ar_name+'[3600,1]') # 'U'  && one-dimensional array

  FOR i = 1 to ar_len

    IF type(ar_name + '[i]') = 'N'
      ar_count = ar_count + 1  &&  add to counter
      ar_sum = ar_sum + evaluate(ar_name+ '[i]')
    ENDIF

  ENDFOR

ELSE                          &&  we have a two-dim. array

  IF pcount = 1               &&  if no column number passed
    col_no = 1                &&  use the default
  ENDIF

  FOR i = 1 to ar_len

    IF type(ar_name + '[i,col_no]') = 'N'
      ar_count = ar_count + 1  &&  add to counter
      ar_sum = ar_sum + evaluate(ar_name+ '[i,col_no]')
    ENDIF

  ENDFOR

ENDIF

IF ar_count = 0
  = poperror('No numeric data found in the '+;
             'specified array.  AR_MEAN will '+;
             'return a divide overflow.')
  rvalue = 1/0
ELSE
  rvalue = ar_sum/ar_count    &&  the mean value
ENDIF

RETURN(rvalue)