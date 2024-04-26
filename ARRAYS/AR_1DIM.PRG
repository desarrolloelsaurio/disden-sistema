FUNCTION AR_1DIM
PARAMETERS AR_NAME
PRIVATE AR_NAME, RVALUE
************************************************************
*  ar_1dim(<expC>)                                         *
*  Version # 1.0  FP          Date: 01-18-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function returns a logical TRUE if the array      *
*  passed as <expC> is one-dimensional.  Function returns  *
*  logical FALSE if the array is two-dimensional.          *
************************************************************
rvalue = ''
IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to AR_1DIM is not an '+;
             'array.  Function will return "*",')
  rvalue = '*'
ENDIF
IF len(rvalue) = 0
  RVALUE=(type(ar_name+'[3600,1]') # 'U')  &&  element exists
ENDIF
RETURN rvalue
