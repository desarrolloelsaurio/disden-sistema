FUNCTION sqmi2acr
PARAMETERS sq_mis
PRIVATE sq_mis, rvalue

************************************************************
*  sqmi2acr(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-02-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts square miles to acres.          *
************************************************************

IF type('sq_mis') # 'N'
  rvalue = parerror('SQMI2ACR','N')
ELSE
  rvalue = sq_mis * 640
ENDIF

RETURN(rvalue)