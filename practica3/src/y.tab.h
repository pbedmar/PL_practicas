/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SRC_Y_TAB_H_INCLUDED
# define YY_YY_SRC_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    PRINCIPAL = 258,
    LLAVEIZQ = 259,
    LLAVEDER = 260,
    COMA = 261,
    LISTADE = 262,
    PROCEDIMIENTO = 263,
    PARDER = 264,
    PARIZQ = 265,
    CORCHIZQ = 266,
    CORCHDER = 267,
    IGUAL = 268,
    INICIOVAR = 269,
    FINVAR = 270,
    SI = 271,
    MIENTRAS = 272,
    OTROCASO = 273,
    PARA = 274,
    HASTA = 275,
    ITERANDO = 276,
    HACER = 277,
    LEER = 278,
    IMPRIMIR = 279,
    CADENA = 280,
    ID = 281,
    PYC = 282,
    TIPOS = 283,
    CONSTANTE = 284,
    OR = 285,
    AND = 286,
    XOR = 287,
    IGUALDAD = 288,
    RELACION = 289,
    ADITIVOS = 290,
    MULTIPLICATIVOS = 291,
    POTENCIAS = 292,
    UNARIOS = 293,
    NOT = 294,
    DECRE_PRE = 295,
    INCRE_PRE = 296,
    DECRE_POS = 297,
    INCRE_POS = 298,
    UNARIO_PRE_LISTA = 299,
    ELEM_POSI = 300,
    MOV_LISTA = 301,
    DOLLAR = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SRC_Y_TAB_H_INCLUDED  */
