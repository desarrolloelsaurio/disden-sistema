FUNCTION AR_MAXL
	PARAMETERS AR_NAME, COL_NO
	PRIVATE AR_NAME, COL_NO, PCOUNT, A_LEN, MAX_LEN, EL_LEN, I
	************************************************************
	*  ar_maxl(<expC>[,(expN>])                                *
	*  Version # 2.0  FP          Date: 01-18-91               *
	*  Programmed by: Malcolm C. Rubel                         *
	*                                                          *
	*  Note: Function returns the length of the longest        *
	*  character string contained within the array named as    *
	*  <expC>.  If <expN> is passed, the function operates     *
	*  on that column of the array.                            *
	*  Modified to use EVALUATE.                               *
	************************************************************
	pcount = parameters()
	max_len = 0
	el_len = 0
	a_len = alen(&ar_name,1)
	IF type(ar_name + '[1,1]') = 'U' and type(ar_name +'[1]') = 'U'
		= poperror('The name passed to the function ' +;
			'AR_MAXL is not an array.  Function '+;
			'will return a minus 1.')
		RETURN(-1)
	ENDIF
	IF type(ar_name+'[3600,1]') # 'U'             && one-dimensional
		FOR  i = 1 to a_len
			IF type(ar_name+'[i]')= 'C'             &&  if element is character
				el_len = len(evaluate(ar_name + '[i]'))
				IF max_len < el_len
					max_len = el_len
				ENDIF
			ENDIF
		ENDFOR
	ELSE                                          &&  if array two-dim.
		IF pcount = 1
			col_no = 1
		ENDIF
		FOR i = 1 to a_len
			IF type(ar_name + '[i,col_no]')= 'C'
				el_len = len(evaluate(ar_name + '[i,col_no]'))
				IF max_len < el_len
					max_len = el_len
				ENDIF
			ENDIF
		ENDFOR
	ENDIF
RETURN(max_len)
