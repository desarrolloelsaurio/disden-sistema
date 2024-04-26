FUNCTION ar_seek
PARAMETERS ar_name, seek_str, col_no
PRIVATE ar_name, seek_str, col_no, el_no, rvalue

************************************************************
*  ar_seek(<expC>,<exp>[,<expN>])                          *
*  Version # 2.1  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990,91                                   *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function seeks an exact match for <expC1> in the  *
*  first column of the array named in <expC2>.  If the     *
*  optional parameter <expN> is passed, the function will  *
*  seek in the specified column of the array.              *
*  This function assumes that all data in the specified    *
*  column is of the same data type as the search string.   *
*  Modified 1-18-91 to use ASCAN.  Function now operates   *
*  4X+ faster and is not sensitive to data types.          *
************************************************************

IF parameters() = 2           &&  if no column was passed
  col_no = 1
ENDIF

IF type(ar_name+'[1,1]') = 'U'  &&  if not an array
  = poperror('Name passed to AR_SEEK is not an array.  '+;
             'The function will return minus one.')
  RETURN(-1)
ENDIF

el_no = 1                     &&  starting element number

DO WHILE .t.
  rvalue = ascan(&ar_name,seek_str,el_no)

  IF rvalue = 0               &&  not found
    EXIT
  ELSE

***  Check to see if the found element is in the correct
***  column.  If it is, return the row number.  If it is not
***  keep on checking starting at the next element.
    
    IF asubscript(&ar_name,rvalue,2) = col_no
      rvalue = asubscript(&ar_name,rvalue,1)
      EXIT
    ELSE
      el_no = rvalue + 1
    ENDIF

  ENDIF

ENDDO

RETURN(rvalue)