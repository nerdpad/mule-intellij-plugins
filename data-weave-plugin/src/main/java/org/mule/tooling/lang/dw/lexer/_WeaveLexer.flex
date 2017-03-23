package org.mule.tooling.lang.dw.lexer;
import com.intellij.lexer.*;
import com.intellij.psi.tree.IElementType;
import static org.mule.tooling.lang.dw.parser.psi.WeaveTypes.*;
import static org.mule.tooling.lang.dw.parser.WeaveParserDefinition.*;

%%

%{
  public _WeaveLexer() {
    this((java.io.Reader)null);
  }
%}

%public
%class _WeaveLexer
%implements FlexLexer
%function advance
%type IElementType
%unicode

EOL="\r"|"\n"|"\r\n"
LINE_WS=[\ \t\f]
WHITE_SPACE=({LINE_WS}|{EOL})+

DOT="."

LINE_COMMENT = "//" [^\r\n]*
MULTILINE_COMMENT = "/*" ( ([^"*"]|[\r\n])* ("*"+ [^"*""/"] )? )* ("*" | "*"+"/")?

DOUBLE_QUOTED_STRING=\"([^\\\"\r\n]|\\[^\r\n])*\"?
SINGLE_QUOTED_STRING='([^\\'\r\n]|\\[^\r\n])*'?


RULE_MIME_TYPE={ALPHA}+"/"+{ALPHA}+

NAMESPACE_URI=[a-z]+"://"[a-zA-Z0-9/:\.\-_?=&]+ | "urn:"[a-zA-Z0-9:\-_\.?=&]+

ID={ALPHA}[:jletterdigit:]*

SIMPLE_TYPE= "String" | "Number" | "Regex" | "Boolean" | "Range" | "Date" | "Time" | "DateTime" | "LocalDateTime" | "LocalTime" | "Time" | "Period" | "Binary" | "Uri" | "Any"

DOLLAR_VARIABLE=[\$]+

RULE_ANY_REGEX=\/([^\\\/\r\n]|\\[^\r\n])+\/
RULE_ANY_DATE="|"([^|\r\n] )+"|"

DIGIT=[0-9]
ALPHA=[:letter:]

INTEGER_LITERAL=["+""-"]?(0|([1-9]({DIGIT})*))
DOUBLE_LITERAL=({FLOATING_POINT_LITERAL1})|({FLOATING_POINT_LITERAL3})

FLOATING_POINT_LITERAL1=({DIGIT})+{DOT}({DIGIT})*({EXPONENT_PART})?
FLOATING_POINT_LITERAL3=({DIGIT})+({EXPONENT_PART})
EXPONENT_PART=[Ee]["+""-"]?({DIGIT})*

RANGE_LITERAL="["{INTEGER_LITERAL}{DOT}{DOT}{INTEGER_LITERAL}"]"


%%
<YYINITIAL> {
  {WHITE_SPACE}               { return com.intellij.psi.TokenType.WHITE_SPACE; }
  {RANGE_LITERAL}             {return RULE_RANGE_LITERAL;}
  "("                         { return L_PARREN; }
  ")"                         { return R_PARREN; }
  "{"                         { return L_CURLY; }
  "}"                         { return R_CURLY; }
  "["                         { return L_BRACKET; }
  "]"                         { return R_BRACKET; }
  "<:"                        { return SUB_TYPE;}
  ","                         { return COMMA; }
  ":"                         { return COLON; }
  "using"                     { return USING; }
  "default"                   { return DEFAULT; }
  "as"                        { return AS; }
  "is"                        { return IS; }
  "when"                      { return WHEN;}
  "unless"                    { return UNLESS;}
  "otherwise"                 { return OTHERWISE;}
  "---"                       { return DOCUMENT_SEPARATOR; }
  "!="                        { return NOT_EQUAL; }
  "~="                        { return SIMILAR; }
  "=="                        { return EQUAL; }
  "="                         { return EQ; }
  "<"                         { return LESS; }
  "<="                        { return LESS_EQUAL; }
  ">"                         { return GREATER; }
  ">="                        { return GREATER_EQUAL; }
  "+"                         { return PLUS; }
  "-"                         { return MINUS; }
  "*"                         { return MULTIPLY; }
  "/"                         { return DIVISION; }
  "%"                         { return MODULO; }
  "@"                         { return AT; }
  "?"                         { return QUESTION; }
  "!"                         { return ESCLAMATION; }
  "#"                         { return HASH; }
  "and"                       { return AND_KEYWORD; }
  "or"                        { return OR_KEYWORD; }
  "|"                         { return OR; }
  "^"                         { return XOR; }
  "&"                         { return AND; }
  "true"                      { return TRUE_LITERAL;}
  "false"                     { return FALSE_LITERAL;}
  "null"                      { return RULE_NULL_LITERAL;}
  "match"                     { return RULE_MATCH_LITERAL;}
  "->"                        { return ARROW_TOKEN;}
  "=>"                        { return FAT_ARROW;}

  "%dw"                       { return VERSION_DIRECTIVE_KEYWORD;}
  "%input"                    { return INPUT_DIRECTIVE_KEYWORD;}
  "%output"                   { return OUTPUT_DIRECTIVE_KEYWORD;}
  "%namespace"                { return NAMESPACE_DIRECTIVE_KEYWORD;}
  "%type"                     { return TYPE_DIRECTIVE_KEYWORD;}
  "%var"                      { return VAR_DIRECTIVE_KEYWORD;}
  "%function"                 { return FUNCTION_DIRECTIVE_KEYWORD;}
  "%import"                   { return IMPORT_DIRECTIVE_KEYWORD;}
  "case"                      { return CASE_KEYWORD;}
  "Array"                     { return ARRAY_KEYWORD;}
  "Object"                    { return OBJECT_KEYWORD;}
  "Type"                      { return TYPE_KEYWORD;}

  {LINE_COMMENT}              { return LINE_COMMENT;}
  {MULTILINE_COMMENT}         { return MULTILINE_COMMENT; }
  {NAMESPACE_URI}             { return NAMESPACE_URI;}
  {RULE_MIME_TYPE}            { return RULE_MIME_TYPE;}

  {RULE_ANY_DATE}             { return RULE_ANY_DATE; }
  {RULE_ANY_REGEX}            { return RULE_ANY_REGEX; }

  {DOUBLE_LITERAL}            { return DOUBLE_LITERAL; }
  {INTEGER_LITERAL}           { return INTEGER_LITERAL; }
  {DOLLAR_VARIABLE}           { return DOLLAR_VARIABLE;}

  {DOUBLE_QUOTED_STRING}      { return DOUBLE_QUOTED_STRING; }
  {SINGLE_QUOTED_STRING}      { return SINGLE_QUOTED_STRING; }

  {SIMPLE_TYPE}               { return SIMPLE_TYPE_LITERAL;}

  {ID}                        { return ID; }

  [^] { return com.intellij.psi.TokenType.BAD_CHARACTER; }
}
