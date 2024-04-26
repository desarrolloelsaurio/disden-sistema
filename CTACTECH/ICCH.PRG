FUNCTION ICCH
PARAMETER ICCH_ARR,ICCH_VENT,ICCH_CUA,ICCH_TIP
m.icch_TIP=IIF(TYPE("m.icch_TIP")#'C','CH',m.icch_TIP)
store nul to m.cch_punt,m.cch_sum
STORE INSMODE() TO INSANT
=INSMODE(.F.)
m.R1=3
m.R2=IIF(m.icch_CUA=0,22,m.R1+m.icch_CUA)
m.r2=iif(m.icch_CUA>22,22,m.icch_CUA)
m.esca=" - [ESC] para Reingresar L¡nea"
IF m.icch_VENT
   DEFI WIND INGCHE FROM m.r1,0 TO m.r2+2,70 TITL " Ingreso de Valores Diferidos " foot Janname colo sche 8
   DEFI WIND INGTOT FROM 0,40 TO 2,79 TITL " Totales " foot janname colo sche 8
   =centwin("ingche")
ENDIF
M.LINEA=cuadro("6 0 "+ALLTRIM(STR(m.r2-3))+" 0 1 2 9 8 20 20 3 ")
c=1
@ 1,c say "TI"
c=c+3
@ 1,c say padc("Monto",9)
c=c+10
@ 1,c say padc("F. Venc.",8)
c=c+9
@ 1,c say padc("N£mero",20)
c=c+21
@ 1,c say padc("Banco de Origen",20)
c=c+21
@ 1,c say "Hs."
m.icch_REN=3
store date() to m.fechave
store space(20) to m.nroche,m.banco
store 1 to a
do while .t.
   @ m.icch_REN,0 SAY M.LINEA
   @ m.icch_REN,1 SAY M.icch_tip
   store nul to m.monto,m.horas
   m.cch_texto=iif(m.icch_tip="CH","l Cheque",iif(m.icch_tip="TA"," la Tarjeta","l Documento"))
   m.icch_mes1='Monto de'+m.cch_texto+' - [ESC] Para FIN'
   @ m.icch_REN,4 get m.monto ;
     pict "99,999.99" ;
     mess m.icch_mes1
   read
   if last()#27
      if m.monto>0
         @ m.icch_REN,14 get m.fechave ;
           mess "Fecha de "+;
           iif(m.icch_tip='CH',"Dep¢sito de","Presentaci¢n de")+;
           m.cch_texto+m.esca
         read
         @ m.icch_REN,23 get m.nroche;
           pict "@!";
           mess "N£mero de"+substr(m.cch_texto,rat(' ',m.cch_texto))+m.esca
         read when last()#27
         if !empty(m.nroche)
            if m.icch_tip#'TA'
               @ m.icch_REN,44 get m.banco;
                 pict "@!";
                 mess "Banco de Origen del Cheque"+m.esca
               read when last()#27
            ELSE
               IF LAST()#27
                  STORE NUL TO RESPUESTA
                  IF ELITAR("",m.icch_REN,44)
                     M.BANCO=MIX.TEXTO1
                     M.NADA=MIX.TEXTO1
                     @ m.icch_REN,44 get m.nada
                     clea gets
                  ELSE
                     M.BANCO=""
                  ENDIF
               ENDIF
            ENDIF
            if !empty(m.banco)
               @ m.icch_REN,65 get m.horas ;
                 valid SIGN(m.horas)#-1 .and. int(m.horas/12)=m.horas/12;
                 ERROR "CANTIDAD DE HORAS INACEPTABLE";
                 PICT "999";
                 MESS "Horas de Acreditaci¢n del Cheque"+m.esca
               read when last()#27
               if last()#27 .and. confirm1("Datos Ingresados",.t.,20,40)
                  m.cch_punt=m.cch_punt+1
                  dime icch_arr[m.cch_punt,6]
                  icch_arr[m.cch_punt,1]=m.icch_tip
                  icch_arr[m.cch_punt,2]=m.monto
                  icch_arr[m.cch_punt,3]=m.fechave
                  icch_arr[m.cch_punt,4]=m.nroche
                  icch_arr[m.cch_punt,5]=m.banco
                  icch_arr[m.cch_punt,6]=m.horas
                  m.icch_REN=m.icch_REN+1
                  acti wind ingtot
                  store m.cch_sum+m.monto to m.cch_sum
                  @ 0,0 say "TOTAL EN"+UPPER(SUBS(m.cch_texto,rat(' ',m.cch_texto)))+'S:'
                  @ 0,20 SAY m.cch_sum pict "99,999,999.99"
                  acti wind ingche
               endif
            endif
         endif
      endif
   else
      exit
   endif
   a=a+1
   if a>m.icch_CUA
      exit
   endif
enddo
if !empty(m.cch_sum) .and. !confirma("VALORES INGRESADOS",.T.,10,30)
   store nul to m.cch_sum,m.cch_punt
endif
IF m.icch_VENT
   =relewin("ingche")
ENDIF
if !empty(wontop())
   rele wind ingtot
endif
=INSMODE(INSANT)
RETURN m.cch_sum
