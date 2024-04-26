FUNCTION ar_size
PARAMETERS ar_name, ar_delta
PRIVATE ar_name, ar_delta, a_len, a_wid, new_len, _work_ar
PRIVATE i, j, _new_arr

************************************************************
*  ar_size(<expC>[,<expN>>])                               *
*  Version # 2.0  FP          Date: 01-17-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1991                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function increases or decreases the size of the   *
*  declared array by the specified amount.  If no          *
*  increment is given, the function assumes a value of +1. *
*  Function returns TRUE if the size change was successful.*
*  Modified 1-17-91 to change with width of the array, not *
*  the length.                                             *
************************************************************

IF parameters() = 1           &&  if no delta amount
  ar_delta = 1                &&  use +1 as default
ENDIF

IF type(ar_name + '[1,1]') = 'U'   &&  not an array
  = poperror('The name passed to AR_SIZE is not an '+;
             'array.  Function will return FALSE.')
  RETURN(.f.)
ENDIF

a_len = alen(&ar_name,1)      &&  length of the source array
a_wid = alen(&ar_name,2)      &&  width of the source array
new_wid = a_wid + ar_delta    &&  new width of our array

***  Check to make sure that the new array will have 
***  valid dimensions.

IF new_wid = 0 .or. new_wid*a_len > 3600
  = poperror('Invalid array dimensions in AR_SIZE.  '+;
             'Function will return FALSE.')
  RETURN(.f.)
ENDIF

IF a_wid = 1                  &&  create temp array 
  DECLARE _work_ar[a_len,new_wid]

  FOR i = 1 TO a_len
    _work_ar[i,1] = evaluate(ar_name+'[i]') &&  store to temp array
  ENDFOR

  _new_arr = ar_name + '[a_len,new_wid]'
  DECLARE (_new_arr)
  rvalue = acopy(_work_ar,&ar_name)

ELSE                          &&  we have a two-dim. array

  DECLARE _work_ar[a_len,new_wid] &&  declare our temp array

  FOR i = 1 TO a_len

    FOR j = 1 to iif(new_wid>a_wid,a_wid,new_wid)
      _work_ar[i,j] = evaluate(ar_name+ '[i,j]')
    ENDFOR

  ENDFOR

  _new_arr = ar_name + '[a_len,new_wid]'
  DECLARE (_new_arr)
  rvalue = acopy(_work_ar,&ar_name)

ENDIF

IF rvalue # -1
  RETURN(.t.)
ELSE
  RETURN(.f.)
ENDIF
