FUNCTION GALTOLIT
PARAMETERS VOLUME
PRIVATE  VOLUME, RVALUE
************************************************************
*  galtolit(<expN>)                                        *
*  Version # 1.0  FP          Date:  1-8-90                *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Note: Function converts gallons to liters.              *
************************************************************
RETURN IIF(type('volume')='N',volume * 3.785306,parerror('galtolit','n'))
