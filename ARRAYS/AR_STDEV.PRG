FUNCTION ar_stdev
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, rvalue

************************************************************
*  ar_stdev(<expC>[,<expN>])                               *
*  Version # 1.0  FP          Date: 02-13-90               *
*  Programmed by: Malcolm C. Rubel                         *
*  Note: Function returns the standard deviation on an     *
*  array column containing numeric data.  Function will    *
*  work even if that column contains data that is not      *
*  numeric.                                                *
************************************************************

IF parameters() = 1
  col_no = 1
ENDIF
return sqrt(ar_vari(ar_name,col_no))
