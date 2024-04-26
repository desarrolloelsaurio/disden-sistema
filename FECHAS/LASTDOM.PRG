FUNCTION lastdom
PARAMETERS p_date
PRIVATE p_date, rvalue
IF type('p_date') = 'C'
  p_date = ctod('p_date')
ENDIF

IF type('p_date') # 'D' .or. empty(p_date)
  rvalue = {}
ELSE
  rvalue = firstdom(gomonth(p_date,1))-1
ENDIF

RETURN rvalue