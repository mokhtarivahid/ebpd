

% Abstract failure descriptions (failure types):
%
%   failure_description(
%      FailureTemplate,
%      FailedOperation,
%      DeleteList,
%      AddList
%   ).


% Defective assembly:
%    The operation of assembling component _Comp_2 fails because _Comp_1
%    already assembled is defective:

failure_description(
   defective_assembly(Obj_1,_Comp_1,Prod,Fix),
   assemble_component(_R,_T,_Obj_2,_Comp_2,_Part,Prod,Fix),
   [ ],
   [ defective(Obj_1) ]
).

%% RACE dummy failure

failure_description(
   race_dummy,
   none,
   [ ],
   [ ]
).

