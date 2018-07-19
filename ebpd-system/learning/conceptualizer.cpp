#include <SWI-Prolog.h>
#include <string.h>
#include <stdio.h>


int main(int argc, char **argv)
{
    char *program = argv[0];
    char *plav[2];
    int episode_id;

    /* make the argument vector for Prolog */

    plav[0] = program;
    plav[1] = NULL;

    /* initialize Prolog */

    if ( !PL_initialise(1, plav) )
        PL_halt(1);

    /* initialize the episode_id */

    episode_id = atoi( argv[1] );

    /* Lookup test_feature_extraction/7 and make the arguments and call */

    predicate_t pred = PL_predicate("test_feature_extraction", 7, "user");
    term_t h0 = PL_new_term_refs(7);

    int rval;
    rval = PL_put_integer(h0, episode_id);
    rval = PL_call_predicate(NULL, PL_Q_NORMAL, pred, h0);

    PL_halt(rval ? 0 : 1);

    return 0;
}
