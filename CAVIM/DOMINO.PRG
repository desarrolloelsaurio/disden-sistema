FUNCTION DOMINO
PARAMETER REN,COL,NU1,NU2
@ REN,COL TO REN+3,COL+7
@ REN+3,COL TO REN+6,COL+7
@ REN+3,COL SAY '�'
@ REN+3,COL+7 SAY '�'
=UNO(REN,COL)
=DOS(REN,COL)
RETURN .T.