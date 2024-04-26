FUNCTION ar_mode
PARAMETERS ar_name, col_no
PRIVATE ar_name, col_no, i, rvalue, mark, mark1, mark2
PRIVATE m_count, m1_count, m2_count, ar_len, i, isonedim
PRIVATE pcount, rvalue

************************************************************
*  ar_mode(<expC>[,<expN>])                                *
*  Version # 2.0  FP          Date: 01-18-91               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function returns the mode of a numeric array.     *
*  Mode is defined as that number that occurs most         *
*  frequently in the series.  If there is no number that   *
*  occurs more than once, the function returns a 0.  If    *
*  the series has more than one solution (if the set is    *
*  bimodal) the function pops a message to this fact and   *
*  returns a 0 also.  AR_MODE assumes that the numeric     *
*  values in the array are sorted in ascending order.      *
*  AR_MODE tolerates non-numeric data in the array, but is *
*  slower because of this.                                 *
*  Modified 1-18-91 to use ALEN and EVALUATE.  Function's  *
*  speed improved about 20 percent.                        *
************************************************************

pcount = parameters()

STORE 0 TO MARK,MAR1,MARK2,m1_count,m2_count
STORE 1 TO m_count

***  check to make sure that we are dealing with an array

IF type(ar_name + '[1,1]') = 'U'
  = poperror('Parameter passed to function '+;
             'AR_MODE is not an array.  Function '+;
             'will return a divide overflow.')
  RETURN(1/0)
ENDIF

IF type(ar_name+'[3600,1]') # 'U'  && one-dimensional array
  isonedim = .t.
ELSE
  isonedim = .f.
ENDIF

ar_len = alen(&ar_name,1)     &&  how long is it

IF isonedim                   &&  if array is one-dimensional

  FOR i = 1 to ar_len         &&  go through the array

***  skip over all non-numeric data 

    DO WHILE type(ar_name+'[i]') # 'N' .and. i <= ar_len
      i = i + 1
    ENDDO

***  if we are at the end of the array get out of the loop.

    IF i > ar_len
      EXIT
    ENDIF

***  now we can deal with a piece of numeric data

    IF mark # evaluate(ar_name + '[i]')     &&  not last num
      mark = evaluate(ar_name + '[i]')      &&  reset marker 
      m_count = 1             &&  reset counter
    ELSE
      m_count = m_count + 1   &&  if same add one to count

      IF m_count >= m1_count  &&  new large number
        m1_count = m_count
        mark1 = mark          &&  write to marker
      ENDIF

      IF m1_count > m2_count  &&  if number is the largest
        m2_count = m1_count   &&  write it to the last mark
        mark2 = mark1
      ENDIF

    ENDIF

  ENDFOR

ELSE                          &&  if we have a two-dim array

  IF pcount = 1               &&  if only one param passed
    col_no = 1                &&  use default column number
  ENDIF

  FOR i = 1 to ar_len

    DO WHILE type(ar_name+'[i,col_no]') # 'N' .and. ;
                 i <= ar_len
      i = i + 1
    ENDDO

    IF i > ar_len
      EXIT
    ENDIF

    IF mark # evaluate(ar_name+ '[i,col_no]')
      mark = evaluate(ar_name + '[i,col_no]')
      m_count = 1
    ELSE 
      m_count = m_count + 1

      IF m_count >= m1_count
        m1_count = m_count
        mark1 = mark
      ENDIF

      IF m1_count > m2_count
        m2_count = m1_count
        mark2 = mark1
      ENDIF

    ENDIF

  ENDFOR

ENDIF

DO CASE

  CASE m1_count <= 1           &&  we have no mode
    = popmess('Array named in AR_MODE has no '+;
              'value that occurs more than once.  '+;
              'The function will return a zero.')
    rvalue = 0

***  series has two different numbers with the same count

  CASE m1_count = m2_count .and.  mark1 # mark2
    mark1 = ltrim(str(mark1))
    mark2 = ltrim(str(mark2))
    m2_count = ltrim(str(m2_count))

    = popmess('Array named in AR_MODE is '+;
              'bimodal.  The numbers '+ mark2 +;
              ' and '+  mark1 + ' both occur ' +;
              m2_count + ' times.  The function '+;
              'will return zero.')
    rvalue = 0

  OTHERWISE                   &&  here is the mode!
    rvalue = mark2

ENDCASE

RETURN rvalue