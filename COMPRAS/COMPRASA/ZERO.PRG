FUNCTION ZERO
PARAMETER NNM,LR
PRIVATE NNM,LR
NNM=IIF(TYPE("NNM")="N",NNM,XXTONUM(NNM))
NN=REPL("0",LR)+ALLTRIM(STR(NNM,LR))
NN=RIGHT(NN,LR)
RETURN NN
