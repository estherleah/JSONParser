package Example;

import java_cup.runtime.SymbolFactory;
%%
%unicode
%cup
%class Scanner
%{
	public Scanner(java.io.InputStream r, SymbolFactory sf){
		this(r);
		this.sf=sf;
	}
	private SymbolFactory sf;
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/* regular expression for a valid json string */
string = \"(\\[\"\\\/bfnrt]|\\u[0-9a-fA-F]{4}|[^\\\"\u0000-\u001f]+)*\"

/* regular expression for a valid json number */
number = (0|-?([1-9][0-9]*))(\.[0-9]+)?([eE][+-]?[0-9]+)?

%%

/* defining the symbols - comma, right and left square brackets, right and left braces and colons */
"," { return sf.newSymbol("Comma",sym.COMMA); }
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }
"{" { return sf.newSymbol("Left Brace",sym.LBRACE); }
"}" { return sf.newSymbol("Right Brace",sym.RBRACE); }
":" { return sf.newSymbol("Colon",sym.COLON); }

/* defining the regular expression for a number as a new double symbol */
{number} { return sf.newSymbol("Number",sym.NUMBER, new Double(yytext())); }

/* defining the regular expression for a string as a new string symbol */
{string} { return sf.newSymbol("String",sym.STRING, new String(yytext())); }

/* defining the boolean symbols true and false and also defining the null symbol */
"true"|"false" { return sf.newSymbol("Boolean value",sym.BOOLEAN, new Boolean(yytext())); }
"null" { return sf.newSymbol("Null",sym.NULL); }

[ \t\r\n\f] { /* ignore white space. */ }

/* anything else is an illegal character which prints an error and causes the system to exit */
. { System.err.println("Illegal character: "+yytext()); System.exit(1); }