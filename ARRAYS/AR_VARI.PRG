FUNCTION ar_vari
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, ar_mean, isonedim, ar_len, i
PRIVATE ccount, rvalue

************************************************************
*  ar_vari(<expC>[,<expN>])                                *
*  Version # 2.0  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: AR_VARI measures the variance from the mean in an *
*  array column that contains numbers.  AR_VARI will work  *
*  on arrays that have other types of data in the columns. *
*  Modified 1-18-91 to take advantage of ALEN and EVALUATE.*
*  Function now works 40% faster.                          *
************************************************************

IF parameters() = 1           &&  if only one param passed
  col_no = 1                  &&  col_no = default
ENDIF

IF type(ar_name+'[3600,1]') # 'U' &&  one-dimensional array
  isonedim = .t.
ELSE
  isonedim = .f.
ENDIF

ar_len = alen(&ar_name,1)     &&  how long is the array?

rvalue = 0                    &&  starting value
ccount = 0

IF isonedim                   &&  get the mean of the array
  ar_mean = ar_mean(ar_name)
ELSE
  ar_mean = ar_mean(ar_name,col_no)
ENDIF

IF isonedim                   &&  for one-dimensional arrays

***  for each element get the square of the difference 
***  between the element and the mean of the series.

  FOR i = 1 to ar_len

    IF type(ar_name+'[i]') = 'N'   &&  if numeric
      rvalue = rvalue + (ar_mean - ;
                         evaluate(ar_name + '[i]'))^2
      ccount = ccount + 1          &&  add to counter
    ENDIF

  ENDFOR

ELSE                          &&  for two-dimensional arrays

  FOR i = 1 to ar_len

    IF type(ar_name + '[i,col_no]') = 'N'
      rvalue = rvalue + (ar_mean - ;
                         evaluate(ar_name + '[i,col_no]'))^2
      ccount = ccount + 1
    ENDIF

  ENDFOR

ENDIF

rvalue = rvalue/ccount        &&  divide by # of elements

RETURN rvalue                &&  return the variance