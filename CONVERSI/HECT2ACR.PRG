FUNCTION hect2acr
PARAMETERS hects
PRIVATE hects, rvalue

************************************************************
*  hect2acr(<expN>)                                        *
*  Version # 1.0  FP          Date: 05-30-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Function converts hectacres to acres.             *
************************************************************

IF type('hects') # 'N'
  rvalue = parerror('HECT2ACR','N')
ELSE
  rvalue = hects * 2.471054
ENDIF

RETURN(rvalue)