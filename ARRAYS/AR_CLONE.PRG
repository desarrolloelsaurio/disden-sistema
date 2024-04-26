FUNCTION ar_clone
PARAMETERS ar_name, new_name
PRIVATE ar_name, new_name, alen, awid, new_arr
************************************************************
*  ar_clone<expC1>,<expC2>)                                *
*  Version # 2.0  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function returns the TRUE if it has managed to    *
*  clone the array specified in <expC1>.  The function     *
*  does not care if any array or other memory variable     *
*  already exist with the target variable's name.  It just *
*  writes over it with the new target array.               *
*  Modified 1-18-91 to take advantage of the ACOPY, ALEN,  *
*  and EVALUATE functions.  Speed was increased 38x.       *
*  Modified 1-22-91 to minimize macro expansion.           *
************************************************************
IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to function AR_CLONE '+;
             'is not an array.  Function will '+;
             'return FALSE.')
  RETURN .f.
ENDIF
alen = alen(&ar_name,1)       &&  how long is it
awid = alen(&ar_name,2)       &&  how wide is it
***  declare the target array
IF type(new_name) = 'U'       &&  not declared
  PUBLIC (new_name)           &&  make it public
ENDIF
IF awid <= 1                  &&  if one_dim alen returns 0
  new_arr = new_name + '[alen]'
  DECLARE (new_arr)
ELSE
  new_arr = new_name + '[alen,awid]'
  DECLARE (new_arr)
ENDIF
alen = acopy(&ar_name,&new_name)
RETURN (ALEN#1)
