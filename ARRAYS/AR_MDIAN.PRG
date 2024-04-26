FUNCTION ar_mdian
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, pcount, isonedim, ar_len, i
PRIVATE ar_count, ar_cent, rvalue

************************************************************
*  ar_mdian(<expC>[,<expN>])                               *
*  Version # 1.0  FP          Date: 02-09-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function returns the median value for all numeric *
*  data points in an array.  This function works on one-   *
*  and two-dimensional arrays.  The default is the first   *
*  column of the array unless <expN> is specified.         *
*  The median is the middle number of a set of numbers     *
*  containing an odd number of elements or the average of  *
*  the two middle elements in a set with an even number of *
*  elements.  This function assumes that the array has     *
*  been sorted and is in either ascending or descending    *
*  order.                                                  *
************************************************************
pcount = parameters()

IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to function '+;
             'AR_MDIAN is not an array.  Function '+;
             'will return a divide overflow.')
  RETURN(1/0)
ENDIF

IF type(ar_name+'[3600,1]') # 'U'  && one-dimensional array
  isonedim = .t.
ELSE
  isonedim = .f.
ENDIF

ar_len = alen(&ar_name,1)     &&  how long is it
ar_count = 0

***  First, count the number of numeric elements in the
***  array.
IF isonedim                   &&  one-dimensional array
  FOR i = 1 to ar_len
   IF type(ar_name + '[i]') = 'N'
     ar_count = ar_count + 1  &&  add to counter
   ENDIF
  ENDFOR
ELSE                          &&  two-dimensional array
  IF pcount = 1               &&  if no column number passed
    col_no = 1                &&  use the default
  ENDIF
  FOR i = 1 to ar_len
   IF type(ar_name + '[i,col_no]') = 'N'
     ar_count = ar_count + 1  &&  add to counter
   ENDIF
  ENDFOR
ENDIF

***  establish the median
IF ar_count = 0
  = poperror('No numeric data found in the '+;
             'specified array.  AR_MDIAN will '+;
             'return a divide overflow.')
  rvalue = 1/0
ELSE                          &&  get the answer
  IF mod(ar_count,2) = 0      &&  even number of points
    ar_cent = ar_count/2
    ar_count = 0
    IF isonedim
      FOR i = 1 to ar_len
        IF type(ar_name + '[i]') = 'N'
          ar_count = ar_count + 1  &&  add to counter
          IF ar_count = ar_cent
            rvalue = evaluate(ar_name + '[i]')
          ENDIF
          IF ar_count = ar_cent + 1  &&  second element
            rvalue = (rvalue + evaluate(ar_name + '[i]'))/2
            EXIT               &&  get out of loop
          ENDIF
        ENDIF
      ENDFOR
    ELSE                      &&  if two-dimensional array
      FOR i = 1 to ar_len
        IF type(ar_name + '[i,col_no]') = 'N'
          ar_count = ar_count + 1  &&  add to counter
          IF ar_count = ar_cent
            rvalue = evaluate(ar_name + '[i,col_no]')
          ENDIF
          IF ar_count = ar_cent + 1  &&  second element
            rvalue = (rvalue + ;
                      evaluate(ar_name + '[i,col_no]'))/2
            EXIT               &&  get out of loop
          ENDIF
        ENDIF
      ENDFOR
    ENDIF
  ELSE                        &&  if odd number of points
    ar_cent = ceiling(ar_count/2)
    ar_count = 0
    IF isonedim
      FOR i = 1 to ar_len
        IF type(ar_name + '[i]') = 'N'
          ar_count = ar_count + 1  &&  add to counter
          IF ar_count = ar_cent
            rvalue = evaluate(ar_name + '[i]') &&  median!
            EXIT
          ENDIF
        ENDIF
      ENDFOR
    ELSE                      &&  if two-dimensional array
      FOR i = 1 to ar_len
        IF type(ar_name + '[i,col_no]') = 'N'
          ar_count = ar_count + 1  &&  add to counter
          IF ar_count = ar_cent
            rvalue = evaluate(ar_name + '[i,col_no]')
            EXIT
          ENDIF
        ENDIF
      ENDFOR
    ENDIF
  ENDIF
ENDIF
RETURN rvalue
