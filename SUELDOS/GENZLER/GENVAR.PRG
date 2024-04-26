*******************************************************************************
*-- Programa: GENVAR.PRG
*-- Fecha   : 11.08.1990
*-- Version : G. REINER
*-- Notas   : INICIALIZA VARIABLES
********************************************************************************
RELE ALL
set talk off
** VARIABLES DE MANEJO DE POPUP
PUBLIC cospop,janpop,gaspop,conpop,catpop,esppop,parpop,emppop,varpop,thorpop,adipop,retpop,salpop
** VARIABLES DE impresora
PUBLIC acancho,achoja,canbil,redondeo,tipored,adenrec,imprec,aus,auss,acform,ACDIGI,nuade,actpla,calsac
PUBLIC quialiq,fechaliq,mesaliq,anoaliq,recaliq,fecdep,bcodep,peraliq,FEPAG,perjub,CANREC
public ordlis,FLIZ
PUBLIC LIMSALQUI,LIMSALMES,MONK1,MONK2
PUBLIC PATH,respuesta,acttex
PUBLIC janname,jannro,indice,INDICE1,CAEM
caem=12
PUBLIC ARRAY bils[10],num[40],ptn[caem],MONK[12,2],pds[2]
PUBLIC PATH
REST FROM TOTAL ADDI
REST FROM num ADDI
REST FROM PATH ADDI
RELE meses,pq,tdoc,tesc,tfr
PUBLIC ARRAY meses[13],pq[5],tdoc[5],tesc[6],tfr[5,3]
meses[1]='Enero'
meses[2]='Febrero'
meses[3]='Marzo'
meses[4]='Abril'
meses[5]='Mayo'
meses[6]='Junio'
meses[7]='Julio'
meses[8]='Agosto'
meses[9]='Septiembre'
meses[10]='Octubre'
meses[11]='Noviembre'
meses[12]='Diciembre'
meses[13]='S.A.C.'
pq[2]='a Corregir'
pq[4]='a Borrar'
pq[5]='a Recuperar'
tdoc[1]='D.N.I.'
tdoc[2]='D.U.  '
tdoc[3]='L.E.  '
tdoc[4]='L.C.  '
tdoc[5]='C.I.  '
tesc[1]='Prescolar     '
tesc[2]='Primaria      '
tesc[3]='Secundaria    '
tesc[4]='Terciaria     '
tesc[5]='Universitaria '
tesc[6]='No            '
ulpr='L¡nea de comandos'
ptn[1]=CHR(65)+CHR(74)+CHR(65)
ptn[2]=CHR(83)+CHR(72)+CHR(84)
ptn[3]=CHR(83)+CHR(72)+CHR(65)
ptn[4]=CHR(65)+CHR(82)+CHR(66)
ptn[5]=CHR(74)+CHR(65)+CHR(77)
ptn[6]=CHR(83)+CHR(72)+CHR(69)
ptn[7]=CHR(83)+CHR(72)+CHR(77)
ptn[8]='IIX'
ptn[9]='HIX'
ptn[10]='XXX'
ptn[11]='TEC'
ptn[12]='TEH'
STORE 0 TO CANREC
pds[1]=132
pds[2]=233
****
****
** tfr 1 -> shurot  2->etequim 3->smol
** laban
tfr[1,1]=72
tfr[1,2]=2
tfr[1,3]=80
** ORIGINAL orot
tfr[2,1]=54
tfr[2,2]=1
tfr[2,3]=255
** PROG. DEL paisano
tfr[3,1]=64
tfr[3,2]=1
tfr[3,3]=80
** MANTENIM orot1
tfr[4,1]=70
tfr[4,2]=1
tfr[4,3]=255
** punteo
tfr[5,1]=72
tfr[5,2]=1
tfr[5,3]=255
RETURN
