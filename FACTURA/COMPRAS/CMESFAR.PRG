* ÚÄ Program ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
* ³  Application: CIERRA MES PARA LIBRO DE IVA COMPRAS ³
* ³    File Name: CMESFAR.PRG                          ³
* ³       Author: G. REINER                            ³
* ³ Date created: 09-04-92                             ³
* ³ Time created: 02:03:22am                           ³
* ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
* modif p/bochi
testo=mesanio("Mes a Cerrar",.T.)
MES_OK=LEFT(TESTO,2)
ANO_OK=RIGHT(TESTO,4)
IF LAST()#27 .AND. ;
!EMPTY(M.TESTO) .AND. ;
!EMPTY(MES_OK) .AND. ;
!EMPTY(ANO_OK) .and. CONFIRMA("Cerrar mes de "+qmes(val(mes_ok))+" de "+ano_ok+" ",.t.,20,10)
=relewin("win")
=opfar()
SELE FAR
=WORKING()
=DOTALK()
LACOSA=ZERO(VAL(MES_OK),2)+"/"+RIGHT(ANO_OK,2)
MESN_OK=VAL(MES_OK)
ANON_OK=VAL(ANO_OK)
FECHAMAX=gomonth(arma_fec(1,mesn_ok,anon_ok),1)
=FLOCK() .OR. FLOK()
REPL MES WITH LACOSA FOR EMPTY(mes) .AND. ;
FECHAEM<fechamax
=UNTALK()
=UNWORK()
ELSE
=NOSELEC("MES A CERRAR")
ENDIF   
return relewin("win")