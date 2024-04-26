FUNCTION ar_sum
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, pcount, ar_len, ar_sum, i
PRIVATE ar_count, element, rvalue

************************************************************
*  ar_sum(<expC>[,<expN>])                                 *
*  Version # 2.0              Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function returns the minimum value of all the     *
*  numeric data in an array.  This function works on one-  *
*  and two-dimensional arrays.  The default is the first   *
*  column of the array unless <expN> is specified.         *
*  Modified 1-18-91 to take advantage of ALEN and EVALUATE.*
************************************************************

pcount = parameters()
ar_len = alen(&ar_name,1)     &&  how long is it
ar_count = 0
ar_sum = 0

IF type(ar_name+'[3600,1]') # 'U' &&  one-dimensional array

  FOR i = 1 to ar_len

    element = evaluate(ar_name + '[i]') &&  current element

    IF type('element') = 'N'  &&  element type
      ar_count = ar_count + 1 &&  add to counter
      ar_sum = ar_sum + element    &&  add to sum
    ENDIF

  ENDFOR

ELSE                          &&  we have a two-dim. array

  IF pcount = 1               &&  if no column number passed
    col_no = 1                &&  use the default
  ENDIF

  FOR i = 1 to ar_len

    element = evaluate(ar_name+ '[i,col_no]')

    IF type('element') = 'N'  &&  element type
      ar_count = ar_count + 1 &&  add to counter
      ar_sum = ar_sum + element  &&  add to sum
    ENDIF

  ENDFOR

ENDIF

RETURN(Ar_SUM)
