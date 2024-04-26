FUNCTION ar_fill
PARAMETERS ar_name, ar_col1, ar_val1, ar_col2, ar_val2,;
           ar_col3, ar_val3, ar_col4, ar_val4, ar_col5,;
           ar_val5
PRIVATE ar_name, ar_col1, ar_val1, ar_col2, ar_val2
PRIVATE ar_col3, ar_val3, ar_col4, ar_val4, ar_col5
PRIVATE ar_val5, c_count, alen, awid, num, a_name
************************************************************
*  ar_fill(<expC1>,<expN1>,<exp1>[,<expN2>,<exp2>;         *
*                [,<expN3>,<exp3>[,<expN4>,<exp4>;         *
*                [,<expN5>,<exp5>]]]])                     *
*                                                          *
*  Note: Function fills up to five columns in an array     *
*  with the value specified in the accompanying            *
*  expression.  Function returns logical TRUE if the fill  *
*  is successful, logical FALSE if there was a problem.    *
*  Modified 1-18-91 to take advantage of ALEN and to get   *
*  rid of as much macro expansion as possible.  Function   *
*  now works almost three times faster.                    *
************************************************************

c_count = (parameters() - 1)/2    &&  how many cols passed?

IF c_count # int(c_count)     &&  wrong number passed
  = poperror('Incorrect number of parameters passed to '+;
             'AR_FILL.  Function will not fill array '+;
             'with data and will return FALSE.')
  RETURN(.f.)
ENDIF

IF type(ar_name + '[1,1]') = 'U'
  = poperror('Array name passed to AR_FILL is not an '+;
             'array.  The function will return FALSE.')
  RETURN .f.
ENDIF

awid = alen(&ar_name,2)       &&  how wide is the array

***  check to see that we have passed nothing but numbers
***  for columns and that they are all for a column that
***  is included in the array

FOR i = 1 to c_count
  num = ltrim(str(i))

  IF type("evaluate('ar_col' + num)") # 'N' ;
     .or. evaluate('ar_col' + num) > awid
    = poperror('Invalid array column parameter passed to '+;
               'AR_FILL.  Function will not fill array '+;
               'with data and will return FALSE.')
    RETURN .f.
  ENDIF
ENDFOR
***  checking good?  fill the array
alen = alen(&ar_name,1)
FOR i = 1 TO alen
***  here is a different way to conditionally process!
  IF c_count > 0
    a_name = ar_name + '[i,ar_col1]'
    STORE ar_val1 TO (a_name)
    IF c_count > 1
      a_name = ar_name + '[i,ar_col2]'
      STORE ar_val2 TO (a_name)
      IF c_count > 2
        a_name = ar_name + '[i,ar_col3]'
        STORE ar_val3 TO (a_name)
        IF c_count > 3
          a_name = ar_name + '[i,ar_col4]'
          STORE ar_val4 TO (a_name)
          IF c_count > 4
            a_name = ar_name + '[i,ar_col5]'
            STORE ar_val5 TO (a_name)
          ENDIF
        ENDIF
      ENDIF
    ENDIF
  ENDIF
ENDFOR
RETURN .t.
