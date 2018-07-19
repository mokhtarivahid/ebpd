#include <SWI-Prolog.h>
#include <string.h>
#include <stdio.h>

#define MAXLINE 1024

int main(int argc, char **argv)
{
    char *program = argv[0];
    char *plav[2];
    char problem[MAXLINE];
    char *p = problem;

    /* make the argument vector for Prolog */

    plav[0] = program;
    plav[1] = NULL;

    /* initialize Prolog */

    if ( !PL_initialise(1, plav) )
        PL_halt(1);

    /* initialize the input planning problem */

    strcpy(p, argv[1]);

    printf("%s\n", p);

    /* Lookup solve/1 and make the arguments and call */

    predicate_t pred = PL_predicate("solve", 1, "user");
    term_t h0 = PL_new_term_refs(1);

    int rval;
    PL_put_atom_chars(h0, problem);
    rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred, h0);

    PL_halt(rval ? 0 : 1);

    return 0;
}
