FUNCTION ACRTOSQF
PARAMETERS ACR
PRIVATE ACR, RVALUE
************************************************************
*  acrtosqf(<expN>)                                        *
*  Version # 1.0  FP          Date: 02-02-90               *
*  Programmed by: Malcolm C. Rubel                         *
*  Copyright (c) 1990                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*  Note: Function converts acres to square feet.           *
*  MOFIC. GOYO 09/08/95 12:59 - 1 sola linea               *
************************************************************
RETURN IIF(TYPE('ACR')='N',ACR * 43560,PARERROR('ACRTOSQF','N'))
