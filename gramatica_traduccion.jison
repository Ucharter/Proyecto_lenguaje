  /* Lexer */
%lex

%options case-sensitive

%%

\s+
"
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/]			

'string' return 'string';
'number' return 'number';
'boolean' return 'boolean';
'void' return 'void';
'tipo' return 'tipo';
'var' return 'var';
'cst' return 'cst';
'salida' return 'salida';
'retorno' return 'retorno';
'null' return 'null';
'size' return 'size';
'si' return 'si';
'si_no' return 'si_sino';
'v-e' return 'v-e';
'funcion' return 'funcion';
'f-a' return 'f-a';
'rompe' return 'rompe';
's_case' return 's_case';
'case' return 'case';
'default' return 'default';
'while' return 'while';
'mitr_q' return 'mitr_q';
'for' return 'for';
'Array' return 'Array';

//Signos
'{' return 'llave_izq';
'}' return 'llave_der';
'(' return 'part_izq';
')' return 'part_der';
'[' return 'corch_izq';
']' return 'corch_der';
'.' return 'punto';
',' return 'coma';
';' return 'punto_coma';
':' return 'dos_puntos';
'++' return 'mas_mas'
'+' return 'mas';
'--' return 'menos_menos'
'-' return 'menos';
'**' return 'potencia';
'*' return 'por';
'/' return 'div';
'%' return 'mod';
'==' return 'igual_que';
'=' return 'igual';
'!=' return 'dif_que';
'<=' return 'menor_igual';
'>=' return 'mayor_igual';
'>' return 'mayor';
'<' return 'menor';
'&&' return 'and';
'||' return 'or';
'!' return 'not';
'?' return 'interrogacion';



//Patrones (Expresiones regulares)
\"[^\"]*\"			{ yytext = yytext.substr(0,yyleng-0); return 'string'; }
\'[^\']*\'			{ yytext = yytext.substr(0,yyleng-0); return 'string'; }
[0-9]+("."[0-9]+)?\b  	return 'number';
([a-zA-Z])[a-zA-Z0-9_]* return 'id';

//Fin del archivo
<<EOF>>				return 'EOF';

/* Asociación de operadores y precedencia */
%left 'interrogacion'
%left 'or'
%left 'and'
%left 'not'
%left 'igual_que' 'dif_que'
%left 'mayor' 'menor' 'mayor_igual' 'menor_igual'
%left 'mas' 'menos'
%left 'por' 'div' 'mod'
%left 'umenos'
%right 'potencia'
%left 'mas_mas' 'menos_menos'

%start S
