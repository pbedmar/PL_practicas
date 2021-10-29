%{
/****************************************************************
 **
 ** Fichero: PRACTICA3.Y
 ** Función: Pruebas de YACC para practicas de PL
 **
 ****************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/** La siguiente declaracion permite que 'yyerror' se puede invocar desde el
 ** fuente de lex (practica3.l)
 **/

void lexerror(const char *msg);
void yyerror(const char *msg);

/** La siguiente variable se usará para conocer el numero de la línea
 ** que se esta leyendo en cada momento. Tambies es posible usar la variable
 ** 'yylineno' que tambien nos muestra la linea actual. Para ello es necesario
 ** invocar a flex con la opcion '-l' (compatibilidad con lex).
 **/

int linea_actual = 1;

%}

/** Para uso de mensajes de error sintactivo con BISON.
 ** La siguiente declaracion provoca que 'bison', ante un error sintactivo,
 ** visualice mensajes de error con indicacion de los tokens que se esperaban
 ** en el lugar en el que se produjo el error (SOLO FUNCIONA CON BISON>=2.1).
 ** Para Bison<2.1 es mediante
 **
 ** #define YYERROR_VERBOSE
 **
 ** En caso de usar mensajes de error mediante 'mes' y 'mes2' (ver apendice D)
 ** nada de lo anterior debe tenerse en cuenta.
 **/

%error-verbose

/** A continuacion declaramos los nombres simbolicos de los tokens.
 ** byacc se encarga de asociar a cada uno un codigo
 **/

%token PRINCIPAL
%token LLAVEIZQ
%token LLAVEDER
%token COMA
%token LISTADE
%token PROCEDIMIENTO
%token PARDER
%token PARIZQ
%token CORCHIZQ
%token CORCHDER
%token IGUAL
%token INICIOVAR
%token FINVAR
%token SI
%token MIENTRAS
%token OTROCASO
%token PARA
%token HASTA
%token ITERANDO
%token HACER
%token LEER
%token IMPRIMIR
%token CADENA
%token ID
%token RETROCEDER
%token DOLLAR
%token PYC
%token OP1
%token OP2
%token OP3
%token OP4
%token OP5
%token OP6
%token TIPOS
%token CONSTANTE

%%

/** Seccion de producciones que definen la gramatica. **/

programa    : cabecera_programa bloque ;

cabecera_programa   : PRINCIPAL PARIZQ PARDER ;

bloque  : LLAVEIZQ 
          declar_de_variables_locales 
          declar_proced 
          sentencias 
          LLAVEDER ;

lista_parametros    : lista_parametros COMA lista_para_por_defecto
                    | lista_parametros COMA parametro
                    | parametro ;

lista_para_por_defecto  : lista_para_por_defecto COMA parametro IGUAL CONSTANTE
                        | parametro IGUAL CONSTANTE
                        | lista_para_por_defecto COMA parametro IGUAL agregado_lista
                        | parametro IGUAL agregado_lista ;

parametro   : tipos ID ;

declar_de_variables_locales : INICIOVAR variables_locales FINVAR
                            | ;

variables_locales   : variables_locales cuerpo_declar_variables
                    | cuerpo_declar_variables ;

cuerpo_declar_variables : tipos declar_variables PYC ;

declar_variables    : ID
                    | ID IGUAL expresion
                    | declar_variables COMA ID  
                    | declar_variables COMA ID IGUAL expresion ;

declar_proced   : cabecera_proced bloque
                | ;

cabecera_proced : PROCEDIMIENTO ID PARIZQ lista_parametros PARDER
                | PROCEDIMIENTO ID PARIZQ PARDER ;

sentencias  : sentencias sentencia
            | sentencia ;

sentencia   : bloque
            | sentencia_asignacion
            | sentencia_if
            | sentencia_while
            | sentencia_for
            | sentencia_entrada
            | sentencia_salida
            | llamada_proced
            | expresion RETROCEDER PYC
            | sentencia_al_comi_lista
            | ;

sentencia_asignacion    : ID IGUAL expresion PYC

sentencia_if    : SI PARIZQ expresion PARDER sentencia
                | SI PARIZQ expresion PARDER sentencia
                  OTROCASO sentencia ;

sentencia_while : MIENTRAS PARIZQ expresion PARDER sentencia ;

sentencia_for   : PARA sentencia_asignacion HASTA expresion ITERANDO expresion HACER sentencia ;

sentencia_entrada   : LEER lista_identificadores PYC ;

lista_identificadores   : lista_identificadores COMA ID
                        | ID ;

sentencia_salida    : IMPRIMIR mensajes PYC ;

mensajes    : mensajes COMA mensaje
            | mensaje ;

mensaje : expresion
        | CADENA ;

llamada_proced  : ID PARIZQ lista_expresiones PARDER PYC
                | ID PARIZQ PARDER PYC ;

lista_expresiones   : lista_expresiones COMA expresion
                    | expresion ;

sentencia_al_comi_lista : DOLLAR expresion PYC ;

expresion   : PARIZQ expresion PARDER
            | op_unario_izq expresion
            | expresion op_unario_der
            | expresion op_binario expresion
            | expresion OP1 expresion OP6 expresion
            | ID
            | CONSTANTE
            | agregado_lista ;

op_unario_izq   : OP4
                | OP1
                | OP2
                | OP3 ;

op_unario_der   : OP1
                | OP2 ;

op_binario  : OP4
            | OP5
            | OP6
            | OP2 ;

agregado_lista  : CORCHIZQ lista_expresiones CORCHDER ;

tipos   : TIPOS 
        | LISTADE TIPOS ;

%%

/** Aqui incluimos el fichero generado por el 'lex'
 ** que implementa la funcion 'yylex'
 **/

#include "lex.yy.c"

#define ANSI_COLOR_RED     "\x1b[31m"
#define ANSI_COLOR_YELLOW  "\x1b[33m"
#define ANSI_COLOR_BLACK   "\x1b[0m"

/** Se debe implementar la funcion yyerror. En este caso
 ** simplemente escribimos el mensaje de error en pantalla
 **/

void lexerror(const char *msg)
{
  printf(ANSI_COLOR_RED "[Error Lexico]" ANSI_COLOR_BLACK "(Linea %d) Caracter no reconocido: %s\n", linea_actual, msg);
}

void yyerror(const char *msg)
{
  printf(ANSI_COLOR_YELLOW "[Error sintactico]" ANSI_COLOR_BLACK "(Linea %d) Error: %s\n", linea_actual, msg);
}