FUNCTION FTTOMET
PARAMETERS VALUE
PRIVATE VALUE, RVALUE
************************************************************
*  fttomet(<expN>)                                         *
*  Version #  1.0    FP       Date:  11-21-89              *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts feet into meters.               *
************************************************************
IF type('value') = 'N'
  rvalue = value * 0.3048
ELSE
  = poperror('The parameter passed to the function '+;
             'FTTOMET is not numeric.  Function '+;
             "will return a '***' divide "+;
             'overflow.')
  rvalue =  1/0
ENDIF
RETURN rvalue
