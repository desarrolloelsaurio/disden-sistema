FUNCTION AR_MAX
	PARAMETERS AR_NAME, COL_NO
	PRIVATE AR_NAME, COL_NO, PCOUNT, AR_LEN, I
	PRIVATE AR_COUNT, ELEMENT, MARK, RVALUE
	************************************************************
	*  ar_max(<expC>[,<expN>])                                 *
	*  Version # 2.0  FP          Date: 01-18-91               *
	*  Programmed by: Malcolm C. Rubel                         *
	*  Note: Function returns the maximum value of all the     *
	*  numeric data in an array.  This function works on one-  *
	*  and two-dimensional arrays.  The default is the first   *
	*  column of the array unless <expN> is specified.         *
	*  Modified 1-18-91 to use ALEN and EVALUATE.              *
	************************************************************
	pcount = parameters()
	mark = -9999999999999999999                   && real small number
	IF type(ar_name + '[1,1]') = 'U'
		= poperror('Parameter passed to function AR_MAX '+;
			'is not an array.  Function will '+;
			'return a divide overflow.')
		RETURN(1/0)
	ENDIF
	ar_len = alen(&ar_name,1)                     &&  how long is it
	ar_count = 0
	IF type(ar_name+'[3600,1]') # 'U'             && one-dimensional
		FOR i = 1 to ar_len
			element = evaluate(ar_name + '[i]')     &&  current element
			IF type('element') = 'N'                &&  element type
				ar_count = ar_count + 1              &&  add to counter
				IF element > mark                    &&  if it is smaller
					mark = element                    &&  load it to mark
				ENDIF
			ENDIF
		ENDFOR
	ELSE                                          &&  we have a two-dim. array
		IF pcount = 1                              &&  if no column number passed
			col_no = 1                              &&  use the default
		ENDIF
		FOR i = 1 to ar_len
			element = evaluate(ar_name + '[i,col_no]')
			IF type('element') = 'N'                &&  element type
				ar_count = ar_count + 1              &&  add to counter
				IF element > mark                    &&  if it is smaller
					mark = element                    &&  load it to mark
				ENDIF
			ENDIF
		ENDFOR
	ENDIF
	IF ar_count = 0
		= poperror('No numeric data found in the '+;
			'specified array.  AR_MAX will '+;
			'return a divide overflow.')
		rvalue = 1/0
	ELSE
		rvalue = mark
	ENDIF
RETURN rvalue
