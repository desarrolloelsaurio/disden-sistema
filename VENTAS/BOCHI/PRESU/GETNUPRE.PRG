FUNCTION GETNUpre
	SELE DOC
      QUESUC=IIF(EMPTY(GETENV("HLASUC")),"1",GETENV("HLASUC"))
      NQUESUC = VAL(QUESUC)
      xdonde = NQUESUC+30
	GO xdonde
	********************  no bloqueo   
	*******               =LOCK(str(recno("doc")),"DOC") .OR. LOK("DOC",str(recno("doc")))      
	STORE DOC.NUMERO TO M.NUMERO,M.ELNUM
	M.NUMERO=TIPOCLI+ZERO(NQUESUC,4)+'-'+ZERO(M.NUMERO,8)
	store (TIPOCLI="A") to m.esa
RETURN .T.