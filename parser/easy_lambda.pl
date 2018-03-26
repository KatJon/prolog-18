program --> expressions.

expressions --> expression.
expressions --> 
    expression,
    expressions.

expression --> abstraction.
expression --> application.
expression --> "(", expression, ")".

abstraction -->
    "\\",
    varname,
    ".",
    body.

application -->
    varname, varname.

varname --> 
    [V],
    {V >= 97, V =< 122}.

body --> expressions.