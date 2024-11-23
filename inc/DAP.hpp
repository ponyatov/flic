/// @file
/// @brief DAP: Debug Adapter Protocol
/// https://microsoft.github.io/debug-adapter-protocol/
#pragma once

/// @defgroup dap dap
/// @brief DAP: Debug Adapter Protocol
/// @{

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

/// @defgroup dapm DAP engine
/// @{
extern int main(int argc, char* argv[]);
extern void arg(int argc, char* argv);
/// @}

/// @defgroup dapp DAP parser
/// @{
extern int yylex();
extern char* yyfile;
extern char* yytext;
extern int yylineno;
extern int yyparse();
extern void yyerror(const char* msg);
#include "DAP.parser.hpp"
/// @}

/// @}
