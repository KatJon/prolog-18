bfck --> program.

program --> expression.
program -->
    expression,
    program.

expression --> "+".
expression --> "-".
expression --> "<".
expression --> ">".
expression --> ".".
expression --> ",".
expression --> loop.

loop --> 
    "[",
    program,
    "]".
