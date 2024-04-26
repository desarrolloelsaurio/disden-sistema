@ECHO OFF
ECHO *************************
ECHO * INICIANDO INSTALACION *
ECHO *************************
C:
CD\
COPY A:REEMP.BAT
CD\SISTEMAS
MD HERRAM
CD HERRAM
COPY A:*.*
DEL HERRAM.BAT
CD\
CLS
ECHO **************************
ECHO * INSTALACION FINALIZADA *
ECHO **************************
