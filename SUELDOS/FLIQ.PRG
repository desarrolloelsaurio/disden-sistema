*:*********************************************************************
*:
*:        Program: FLIQ.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/24/91     20:46
*:
*:          Calls: OPSUE.PRG
*:               : OPADI.PRG
*:               : OPTHOR.PRG
*:               : OPRET.PRG
*:               : OPSAL.PRG
*:               : OPEMP.PRG
*:               : OPDIA.PRG
*:
*:      Documented 04/24/91 at 20:50               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: FLIQ.PRG
*-- Fecha   : 01/09/91 11:04pm
*-- Version : G. REINER
*-- Notas   : FIN DE LA LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC(" Informando a Legajo los Datos de Liquidaci¢n ",80,' ') COLOR SCHE 19
SELE liq
SCAN FOR INFORMA .AND. imprime .AND. archivo<>"XXX"
   xa="'"+ALLTRIM(archivo)+"'"
   SELE &xa
   GOTO liq->registro
   A=DTOC(fechaliq)+' - '
   IF liq->unidad<>1
      A=A+STR(liq->unidad,6,2)
   ELSE
      A=A+SPACE(8)
   ENDIF
   A=A+' - '
   IF liq->archivo='THOR'
      A=A+thor->hortipohor
   ELSE
      IF liq->archivo='ADI'
         A=A+adi->adicional
      ELSE
         IF liq->archivo='RET'
            A=A+ret->retencion
         ELSE
            IF liq->archivo='SAL'
               A=A+sal->salario
            ELSE
               A=A+gas->gasto
            ENDIF
         ENDIF
      ENDIF
   ENDIF
   A=A+' - '
   IF liq->monto<>0
      A=A+STR(liq->monto,12,2)
   ELSE
      A=A+SPACE(12)
   ENDIF
   SELE emp
   GOTO liq->empleado
   REPL texto WITH LEFT(A+SPACE(70),70) ADDITIVE
   SELE liq
ENDSCAN
@ 24,0 SAY PADC(" Compactando el Archivo de Liquidaci¢n ",80,' ') COLOR SCHE 19
DO opsue
SELE emp
@ 24,0 SAY PADC(" Generando Hist¢rico de Sueldos ",80,' ') COLOR SCHE 19
SCAN FOR emp->total<>0
   rc=RECNO()
   SCATTER MEMVAR
   SELE sue
   APPE BLAN
   GATHER MEMVAR
   REPL empleado WITH rc,mes WITH mesaliq,quincena WITH quialiq,haberagu WITH haberret-habersin,adicagu WITH adicret-adicsin
   SELE emp
   GOTO rc
ENDSCAN
DO opadi
@ 24,0 SAY PADC(" Borrando Adicionales Vencidos ",80,' ') COLOR SCHE 19
SCAN FOR adiper='R' .AND. adiret='SI'
   rgs=RECNO()
   SELE liq
   SCAN FOR filtcon=20 .AND. registro=rgs .AND. imprime
		RICO=RECNO()
      SELE sue
      GOTO TOP
		LOCATE FOR sue->empleado=liq->empleado .AND. sue->mes=adi->adimes .AND. sue->quincena=adi->adiqui
      IF .NOT. EOF()
         REPL sue->adicagu WITH sue->adicagu+liq->monto
      ELSE
         APPE BLAN
         REPL sue->adicagu WITH liq->monto
         REPL sue->legajo WITH liq->legajo
         REPL sue->quincena WITH adi->adiqui
         REPL sue->mes WITH adi->adimes
         GOTO TOP
      ENDIF
		LOCATE FOR sue->empleado=liq->empleado .AND. sue->mes=MESALIQ .AND. sue->quincena=QUIALIQ
      IF .NOT. EOF()
         REPL sue->adicagu WITH sue->adicagu-liq->monto
      ENDIF
      SELE liq
		GOTO RICO 
   ENDSCAN
   SELE adi
	GOTO RGS
ENDSCAN
SELE liq
DELE ALL FOR fechaven<=fLIZ
PACK
DO opthor
@ 24,0 SAY PADC(" Borrando Horas Vencidas ",80,' ') COLOR SCHE 19
SCAN FOR horreset='SI'
   SELE liq
   DELE ALL FOR filtcon=10 .AND. registro=RECNO("THOR")
   SELE thor
ENDSCAN
SELE adi
@ 24,0 SAY PADC(" Borrando Adicionales Vencidos ",80,' ') COLOR SCHE 19
SCAN FOR adireset='SI'
   SELE liq
   DELE ALL FOR filtcon=20 .AND. registro=RECNO("ADI")
   SELE adi
ENDSCAN
DO opret
@ 24,0 SAY PADC(" Borrando Retenciones Vencidas ",80,' ') COLOR SCHE 19
SCAN FOR retreset='SI'
   SELE liq
   DELE ALL FOR filtcon=30 .AND. registro=RECNO("RET")
   SELE ret
ENDSCAN
DO opsal
@ 24,0 SAY PADC(" Borrando Salario Familiar Vencido ",80,' ') COLOR SCHE 19
SCAN FOR salreset='SI'
   SELE liq
   DELE ALL FOR filtcon=40 .AND. registro=RECNO("SAL")
   SELE sal
ENDSCAN
SELE liq
PACK
REPL ALL liq->monto WITH 0
DO opemp
REPL ALL haberret WITH 0,habersin WITH 0,adicret WITH 0,adicsin WITH 0,reten WITH 0,salar WITH 0,redondeo WITH 0,adelan WITH 0,TOTAL WITH 0
DO opdia
ZAP
RELE xa,rgs,iq
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: FLIQ.PRG
