package com.cjburkey.frontlang;

import java_cup.runtime.*;

%%

%class FrontLangLexer
%cupsym Symbols
%cup
%eofval{
    return symbol("EOF", Symbols.EOF);
%eofval}
%unicode
%line
%column

%{
    private Symbol symbol(String name, int code) {
        return FrontLangParser.getSymbolsFactory().newSymbol(name, code, new ComplexSymbolFactory.Location(yyline + 1, yycolumn + 1), new ComplexSymbolFactory.Location(yyline + 1,yycolumn + yylength()));
    }
    private Symbol symbol(String name, int code, Object value) {
        return FrontLangParser.getSymbolsFactory().newSymbol(name, code, new ComplexSymbolFactory.Location(yyline + 1, yycolumn + 1), new ComplexSymbolFactory.Location(yyline + 1,yycolumn + yylength()), value);
    }
%}

LetterUScore        = [a-zA-Z_]
LetterUScoreDigit   = [a-zA-Z_0-9]
Digit               = [0-9]
LineTerminator      = \r|\n|\r\n
InputCharacter      = [^\r\n]
WhiteSpace          = {LineTerminator} | [ \t\f]
Identifier          = {LetterUScore}{LetterUScoreDigit}*
Integer             = [-]?{Digit}+
Float               = [-]?{Digit}*\.{Digit}+

%%

{WhiteSpace}        {  }

<YYINITIAL> {
    {Integer}       { System.out.println("Found integer: " + new Integer(yytext()));    return symbol("PLUS", Symbols.INTEGER, new Integer(yytext())); }
    
    "+"             { return symbol("PLUS", Symbols.PLUS); }
    "-"             { return symbol("MINUS", Symbols.MINUS); }
    "*"             { return symbol("TIMES", Symbols.TIMES); }
    "/"             { return symbol("DIVIDE", Symbols.DIVIDE); }
    "**"            { return symbol("EXPONENT", Symbols.EXPONENT); }
    "//"            { return symbol("ROOT", Symbols.ROOT); }
    "("             { return symbol("LPAR", Symbols.LPAR); }
    ")"             { return symbol("RPAR", Symbols.RPAR); }
}

[^]                 { System.err.println("Invalid character: \'" + yytext() + "\'"); }