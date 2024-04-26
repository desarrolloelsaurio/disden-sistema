FUNCTION boxstr
PARAMETERS b_s_type
PRIVATE b_s_type,rvalue

************************************************************
*  boxstr([<expN>])                                        *
*  Version # 1.1  FP          Date: 05-23-90               *
*  Programmed by: Malcolm C. Rubel                         *
*                                                          *
*  Copyright (c) 1989                                      *
*  Performance Dynamics Associates                         *
*  All Rights Reserved                                     *
*                                                          *
*  Note: Returns characters for making different kinds     *
*  of boxes.                                               *
*    box types:                                            *
*                                                          *
*    1 = double line box                                   *
*    2 = single line box                                   *
*    3 = single sides and double horizontals               *
*    4 = double sides and single horizontals               *
*    5 = wide solid lines, sharp corners                   *
*    6 = wide solid lines, no corners                      *
*    7 = heavy shaded box                                  *
*    8 = medium shaded box                                 *
*    9 = light shaded box                                  *
*   10 = Panel                                             *
************************************************************

IF parameters() = 0
  b_s_type = 1
ENDIF

DO CASE

  CASE b_s_type = 1
    rvalue = chr(201)+chr(205)+chr(187)+chr(186)+chr(188)+;
             chr(205)+chr(200)+chr(186)+' '

  CASE b_s_type = 2
    rvalue = chr(218)+chr(196)+chr(191)+chr(179)+chr(217)+;
             chr(196)+chr(192)+chr(179)+' '

  CASE b_s_type = 3
    rvalue = chr(213)+chr(205)+chr(184)+chr(179)+chr(190)+;
             chr(205)+chr(212)+chr(179)+' '

  CASE b_s_type = 4
    rvalue = chr(214)+chr(196)+chr(183)+chr(186)+chr(189)+;
             chr(196)+chr(211)+chr(186)+' '

  CASE b_s_type = 5
    rvalue = chr(219)+chr(223)+chr(219)+chr(219)+chr(219)+;
             chr(220)+chr(219)+chr(219)+' '

  CASE b_s_type = 6
    rvalue = chr(220)+chr(223)+chr(220)+chr(219)+chr(223)+;
             chr(220)+chr(223)+chr(219)+' '

  CASE b_s_type = 7
    rvalue = chr(178)+chr(178)+chr(178)+chr(178)+chr(178)+;
             chr(178)+chr(178)+chr(178)+' '

  CASE b_s_type = 8
    rvalue = chr(177)+chr(177)+chr(177)+chr(177)+chr(177)+;
             chr(177)+chr(177)+chr(177)+' '

  CASE b_s_type = 9
    rvalue = chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+;
             chr(176)+chr(176)+chr(176)+' '

  CASE b_s_type = 10
    store '' to rvalue

  OTHERWISE                   &&  double line box
    rvalue = chr(201)+chr(205)+chr(187)+chr(186)+chr(188)+;
             chr(205)+chr(200)+chr(186)+' '

ENDCASE

RETURN(rvalue)
