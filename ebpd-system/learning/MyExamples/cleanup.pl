
cleanup(EpisodeId)
:- retractall( failure_situation(EpisodeId,_,_,_)),
   retractall(plan_before_failure(EpisodeId,_,_)),
   retractall(failure_episode(EpisodeId,_,_)).