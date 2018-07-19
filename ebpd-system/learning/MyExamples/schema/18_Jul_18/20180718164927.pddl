(robot_activity_schema
  (:domain race)
  (:method stack        ;;; stack(p1,p2)
   :parameters  (?_G810 ?_G2366)
   :abstract-plan
     ((!unstack ?_G796 ?_G839 ?_G846 ?_G810) (((at_goal(top ?_G846 ?_G2366)) (at_start(top ?_G839 ?_G810)) (throughout(block ?_G839)) (throughout(block ?_G846)) (throughout(blue ?_G839)) (throughout(pile ?_G810)) (throughout(red ?_G846)))-())
      (!put ?_G796 ?_G839 ?_G803) (((at_start(top ?_G839 ?_G810)) (throughout(block ?_G839)) (throughout(blue ?_G839)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G846 ?_G998 ?_G810) (((at_goal(top ?_G846 ?_G2366)) (throughout(block ?_G846)) (throughout(block ?_G998)) (throughout(blue ?_G998)) (throughout(pile ?_G810)) (throughout(red ?_G846)))-())
      (!put ?_G796 ?_G846 ?_G803) (((at_goal(top ?_G846 ?_G2366)) (throughout(block ?_G846)) (throughout(red ?_G846)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G998 ?_G1150 ?_G810) (((throughout(block ?_G998)) (throughout(block ?_G1150)) (throughout(blue ?_G998)) (throughout(pile ?_G810)) (throughout(red ?_G1150)))-())
      (!put ?_G796 ?_G998 ?_G803) (((throughout(block ?_G998)) (throughout(blue ?_G998)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1150 ?_G1302 ?_G810) (((throughout(block ?_G1150)) (throughout(block ?_G1302)) (throughout(blue ?_G1302)) (throughout(pile ?_G810)) (throughout(red ?_G1150)))-())
      (!put ?_G796 ?_G1150 ?_G803) (((throughout(block ?_G1150)) (throughout(red ?_G1150)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1302 ?_G1454 ?_G810) (((throughout(block ?_G1302)) (throughout(block ?_G1454)) (throughout(blue ?_G1302)) (throughout(pile ?_G810)) (throughout(red ?_G1454)))-())
      (!put ?_G796 ?_G1302 ?_G803) (((throughout(block ?_G1302)) (throughout(blue ?_G1302)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1454 ?_G1606 ?_G810) (((throughout(block ?_G1454)) (throughout(block ?_G1606)) (throughout(blue ?_G1606)) (throughout(pile ?_G810)) (throughout(red ?_G1454)))-())
      (!put ?_G796 ?_G1454 ?_G803) (((throughout(block ?_G1454)) (throughout(red ?_G1454)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1606 ?_G1758 ?_G810) (((throughout(block ?_G1606)) (throughout(block ?_G1758)) (throughout(blue ?_G1606)) (throughout(pile ?_G810)) (throughout(red ?_G1758)))-())
      (!put ?_G796 ?_G1606 ?_G803) (((throughout(block ?_G1606)) (throughout(blue ?_G1606)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1758 ?_G1910 ?_G810) (((throughout(block ?_G1758)) (throughout(block ?_G1910)) (throughout(blue ?_G1910)) (throughout(pile ?_G810)) (throughout(red ?_G1758)))-())
      (!put ?_G796 ?_G1758 ?_G803) (((throughout(block ?_G1758)) (throughout(red ?_G1758)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G1910 ?_G2062 ?_G810) (((throughout(block ?_G1910)) (throughout(block ?_G2062)) (throughout(blue ?_G1910)) (throughout(pile ?_G810)) (throughout(red ?_G2062)))-())
      (!put ?_G796 ?_G1910 ?_G803) (((throughout(block ?_G1910)) (throughout(blue ?_G1910)) (throughout(table ?_G803)))-())
      (!unstack ?_G796 ?_G2062 ?_G2214 ?_G810) (((at_goal(top ?_G2214 ?_G810)) (throughout(block ?_G2062)) (throughout(pallet ?_G2214)) (throughout(pile ?_G810)) (throughout(red ?_G2062)))-())
      (!put ?_G796 ?_G2062 ?_G803) (((throughout(block ?_G2062)) (throughout(red ?_G2062)) (throughout(table ?_G803)))-())
      (!pick ?_G796 ?_G1910 ?_G803) (((throughout(block ?_G1910)) (throughout(blue ?_G1910)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1910 ?_G2402 ?_G2366) (((at_start(top ?_G2402 ?_G2366)) (throughout(block ?_G1910)) (throughout(blue ?_G1910)) (throughout(pallet ?_G2402)) (throughout(pile ?_G2366)))-())
      (!pick ?_G796 ?_G1606 ?_G803) (((throughout(block ?_G1606)) (throughout(blue ?_G1606)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1606 ?_G1910 ?_G2366) (((throughout(block ?_G1606)) (throughout(block ?_G1910)) (throughout(blue ?_G1606)) (throughout(blue ?_G1910)) (throughout(pile ?_G2366)))-())
      (!pick ?_G796 ?_G1302 ?_G803) (((throughout(block ?_G1302)) (throughout(blue ?_G1302)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1302 ?_G1606 ?_G2366) (((throughout(block ?_G1302)) (throughout(block ?_G1606)) (throughout(blue ?_G1302)) (throughout(blue ?_G1606)) (throughout(pile ?_G2366)))-())
      (!pick ?_G796 ?_G998 ?_G803) (((throughout(block ?_G998)) (throughout(blue ?_G998)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G998 ?_G1302 ?_G2366) (((throughout(block ?_G998)) (throughout(block ?_G1302)) (throughout(blue ?_G998)) (throughout(blue ?_G1302)) (throughout(pile ?_G2366)))-())
      (!pick ?_G796 ?_G839 ?_G803) (((at_start(top ?_G839 ?_G810)) (throughout(block ?_G839)) (throughout(blue ?_G839)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G839 ?_G998 ?_G2366) (((at_start(top ?_G839 ?_G810)) (throughout(block ?_G839)) (throughout(block ?_G998)) (throughout(blue ?_G839)) (throughout(blue ?_G998)) (throughout(pile ?_G2366)))-())
      (!pick ?_G796 ?_G2062 ?_G803) (((throughout(block ?_G2062)) (throughout(red ?_G2062)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G2062 ?_G839 ?_G2366) (((at_start(top ?_G839 ?_G810)) (throughout(block ?_G839)) (throughout(block ?_G2062)) (throughout(blue ?_G839)) (throughout(pile ?_G2366)) (throughout(red ?_G2062)))-())
      (!pick ?_G796 ?_G1758 ?_G803) (((throughout(block ?_G1758)) (throughout(red ?_G1758)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1758 ?_G2062 ?_G2366) (((throughout(block ?_G1758)) (throughout(block ?_G2062)) (throughout(pile ?_G2366)) (throughout(red ?_G1758)) (throughout(red ?_G2062)))-())
      (!pick ?_G796 ?_G1454 ?_G803) (((throughout(block ?_G1454)) (throughout(red ?_G1454)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1454 ?_G1758 ?_G2366) (((throughout(block ?_G1454)) (throughout(block ?_G1758)) (throughout(pile ?_G2366)) (throughout(red ?_G1454)) (throughout(red ?_G1758)))-())
      (!pick ?_G796 ?_G1150 ?_G803) (((throughout(block ?_G1150)) (throughout(red ?_G1150)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G1150 ?_G1454 ?_G2366) (((throughout(block ?_G1150)) (throughout(block ?_G1454)) (throughout(pile ?_G2366)) (throughout(red ?_G1150)) (throughout(red ?_G1454)))-())
      (!pick ?_G796 ?_G846 ?_G803) (((at_goal(top ?_G846 ?_G2366)) (throughout(block ?_G846)) (throughout(red ?_G846)) (throughout(table ?_G803)))-())
      (!stack ?_G796 ?_G846 ?_G1150 ?_G2366) (((at_goal(top ?_G846 ?_G2366)) (throughout(block ?_G846)) (throughout(block ?_G1150)) (throughout(pile ?_G2366)) (throughout(red ?_G846)) (throughout(red ?_G1150)))-())
      )))