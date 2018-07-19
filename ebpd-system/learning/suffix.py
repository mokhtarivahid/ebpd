#!/usr/bin/python

# Software License Agreement (BSD License)
#
# 
# Copyright (c) 2017 Vahid Mokhtari
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# Revision $Id$
#


import itertools
import re
import sys
import operator
import os
import argparse

###############################################################################
class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


###############################################################################
kleene = chr(255)

###############################################################################
# Return the longest common prefix between two strings.  If max is
# specified then the longest common prefix cannot exceed it
def longest_common_prefix(s1, s2, max = None):

    # it's temporary to ignore kleene character
    i = s1.find(kleene)
    if i > -1: s1 = s1[:i]
    i = s2.find(kleene)
    if i > -1: s2 = s2[:i]

    l1, l2 = len(s1), len(s2)
    min = l1 if l1 < l2 else l2
    if max is not None:
        min = min if min < max else max
    for i in range(0,min):
        if s1[i] != s2[i]:
            return (s1[0:i] if i > 0 else '')
    return s1[0:min]

###############################################################################
def suffix_array(text, _step=16):
    """Analyze all common strings in the text.

    Short substrings of the length _step a are first pre-sorted. The are the 
    results repeatedly merged so that the garanteed number of compared
    characters bytes is doubled in every iteration until all substrings are
    sorted exactly.

    Arguments:
        text:  The text to be analyzed.
        _step: Is only for optimization and testing. It is the optimal length
               of substrings used for initial pre-sorting. The bigger value is
               faster if there is enough memory. Memory requirements are
               approximately (estimate for 32 bit Python 3.3):
                   len(text) * (29 + (_size + 20 if _size > 2 else 0)) + 1MB

    Return value:      (tuple)
      (sa, rsa, lcp)
        sa:  Suffix array                  for i in range(1, size):
               assert text[sa[i-1]:] < text[sa[i]:]
        rsa: Reverse suffix array          for i in range(size):
               assert rsa[sa[i]] == i
        lcp: Longest common prefix         for i in range(1, size):
               assert text[sa[i-1]:sa[i-1]+lcp[i]] == text[sa[i]:sa[i]+lcp[i]]
               if sa[i-1] + lcp[i] < len(text):
                   assert text[sa[i-1] + lcp[i]] < text[sa[i] + lcp[i]]
    >>> suffix_array(text='banana')
    ([5, 3, 1, 0, 4, 2], [3, 2, 5, 1, 4, 0], [0, 1, 3, 0, 0, 2])

    Explanation: 'a' < 'ana' < 'anana' < 'banana' < 'na' < 'nana'
    The Longest Common String is 'ana': lcp[2] == 3 == len('ana')
    It is between  tx[sa[1]:] == 'ana' < 'anana' == tx[sa[2]:]
    """
    tx = text
    size = len(tx)
    # step = min(max(_step, 1), len(tx))
    step = size
    sa = list(range(len(tx)))
    usa = sa
    print 'text', tx
    print 'size', size
    print 'step', step
    # print 'usa', usa
    for i, pos in enumerate(usa):
        st = tx[pos:pos + size]
        print i, st
    sa.sort(key=lambda i: tx[i:i + step])
    for i, pos in enumerate(sa):
        st = tx[pos:pos + size]
        print i, st
    # print 'sa', sa
    grpstart = size * [False] + [True]  # a boolean map for iteration speedup.
    # It helps to skip yet resolved values. The last value True is a sentinel.
    rsa = size * [None]
    stgrp, igrp = '', 0
    for i, pos in enumerate(sa):
        st = tx[pos:pos + step]
        # print i, st
        if st != stgrp:
            grpstart[igrp] = (igrp < i - 1)
            stgrp = st
            igrp = i
        rsa[pos] = igrp
        sa[i] = pos
    grpstart[igrp] = (igrp < size - 1 or size == 0)
    # print 'rsa', rsa
    # print 'grpstart', grpstart
    while grpstart.index(True) < size:
        # assert step <= size
        nextgr = grpstart.index(True)
        while nextgr < size:
            igrp = nextgr
            nextgr = grpstart.index(True, igrp + 1)
            glist = []
            for ig in range(igrp, nextgr):
                pos = sa[ig]
                if rsa[pos] != igrp:
                    break
                newgr = rsa[pos + step] if pos + step < size else -1
                glist.append((newgr, pos))
            glist.sort()
            for ig, g in groupby(glist, key=itemgetter(0)):
                g = [x[1] for x in g]
                sa[igrp:igrp + len(g)] = g
                grpstart[igrp] = (len(g) > 1)
                for pos in g:
                    rsa[pos] = igrp
                igrp += len(g)
        # print 'grpstart', grpstart
        step *= 2
    del grpstart
    ##########################################
    # create LCP array
    lcp = size * [None]
    h = 0
    for i in range(size):
        if rsa[i] > 0:
            j = sa[rsa[i] - 1]
            while i != size - h and j != size - h and tx[i + h] == tx[j + h]:
                h += 1
            lcp[rsa[i]] = h
            if h > 0:
                h -= 1
    if size > 0:
        lcp[0] = 0

    ##########################################
    # create NLCP array
    nlcp = size * [None]
    if size > 0:
        nlcp[0] = 0

    # ignores overlapping by the parameter 'abs(len(s1)-len(s2))'
    # it limits the max size of longest common subsequence to lower 
    # than difference between two suffixes 
    for i in range(0,len(sa)-1):
        s1 = tx[sa[i]:]
        s2 = tx[sa[i+1]:]
        # print '____s1,s2,dif,', s1, ':', s2, ':', abs(len(s1)-len(s2))
        nlcp[i+1] = len(longest_common_prefix(s1,s2,abs(len(s1)-len(s2))))
    ##########################################

    # print out the results as: i  sa  lcp nlcp suf
    print "-------------------------"
    print "  i  sa  lcp nlcp suf"
    print "-------------------------"
    for i, pos in enumerate(sa):
        st = tx[pos:pos + step]
        l = len(tx)
        print "%3s %3s %3s %3s   %ls" % (i, sa[i], lcp[i], nlcp[i], st)
    print "-------------------------"
    print tx, 'of size', len(tx)
    print "-------------------------"

    return sa, rsa, lcp, nlcp


###############################################################################
def contiguous_non_overlapping_longest_common_prefixes(text, _reverse=False):
    """Get contiguous non_overlapping longest common prefixes and their positions.
    >>> contiguous_non_overlapping_longest_common_prefixes('banana')
    cnlcp: {'an': [1, 3]}
    >>> contiguous_non_overlapping_longest_common_prefixes('AABABABBABBDCADDADDADD')
    cnlcp: {'A': [0, 1], 'ADD': [13, 16, 19], 'BAB': [4, 7]}

    """

    _text = text
    _cnlcp = {} # keep all cnlcp
    cnlcp = {} # keep only final result

    while True:

        sa, rsa, lcp, nlcp = suffix_array(_text)
        # print 'nlcp:', nlcp
        maxlen = max(nlcp)

        # extract the largest consecutive non-overlapping longest common prefixes 
        # with their positions
        __cnlcp = {}
        for maxlen in sorted(nlcp, reverse=True):
            # continue if no cnlcp is yet extracted
            if not __cnlcp:
                for i in range(1, len(_text)):
                    if nlcp[i] == maxlen and nlcp[i]:
                        j1, j2 = sa[i - 1], sa[i]
                        substring = _text[j1:j1 + maxlen]
                        # check if suffixes are consecutive
                        if abs(j1-j2) == nlcp[i]:
                            # check if suffixes have already been added
                            if not substring in __cnlcp:
                                __cnlcp[substring] = sorted([j1,j2])
                            else:
                                __cnlcp[substring] = sorted(set(__cnlcp[substring]+[j1,j2]))
            else:
                break

        print '__cnlcp', __cnlcp

        ###############################################################################
        # replace iterations in the original text by kleene character and at the same 
        # time update cnlcp array '___cnlcp' by discarding overlapping cnlcps
        ___cnlcp = {}
        __text = _text
        # --------------------------------
        # sort by the length of values then by values then by keys
        # priority given to the most repetitive, then lower in position, then by key 
        # for k in sorted(__cnlcp, key=lambda k: (-len(__cnlcp[k]),__cnlcp[k],k)):
        # --------------------------------
        # dictionary sorted in reverse by the length of values then by values with greater numbers then by keys
        from collections import OrderedDict
        for k, v in OrderedDict(sorted(__cnlcp.items(), key=lambda t: (len(t[1]), t[1]), reverse=_reverse)).items():
        # --------------------------------
            ___text = __text
            for i in __cnlcp[k]:
                if __text.find(k,i) == i:
                    if k in ___cnlcp:
                        ___cnlcp[k].append(i)
                    else:
                        ___cnlcp[k] = [i]
                    print 'replace', k, i, __text
                    for j in range(len(k)):
                        __text = __text[:i+j] + kleene + __text[i+j+1:]
            # refine overlapping: checks if only one cnlcp[k] added to ___cnlcp, so it will 
            # be removed and the text reversed to the previous state
            if ___cnlcp.get(k) and len(___cnlcp[k]) < 2:
                __text = ___text
                ___cnlcp.pop(k)

        print
        # remove repetitive kleene (!! not necessary anymore)
        # __text = re.sub('\'+kleene+'+', kleene, __text)
        print _text, " --> ", __text
        # discard iterations detected for kleene character
        if ___cnlcp.get(kleene): ___cnlcp.pop(kleene)
        print '___cnlcp:', ___cnlcp

        # update '_text' for the next iteration of loop
        _text = __text

        # update the 'cnlcp' 
        _cnlcp.update(__cnlcp)
        cnlcp.update(___cnlcp)
        print
        print '#################################################################'

        if not ___cnlcp:
            break

    # print
    # print 'cnlcp:', cnlcp
    # print
    return cnlcp, _cnlcp


###############################################################################
def print_out_kleen_closure(text,cnlcp):

    ###############################################################################
    ## print out in kleene closure
    ###############################################################################

    i = 0;
    kc = "" # kleen_closure
    # sort by values in (values,key) pairs
    for value, key in sorted([(value,key) for (key,value) in cnlcp.items()]):
        # print value, key
        while i < value[0]:
            kc += text[i]
            i = i + 1
        kc += ('(' + str(key) + ')*')
        i += len(key) * len(value)

    # copy the rest of string into the kleene closure
    kc += text[i:]

    print
    print bcolors.WARNING + "kleene closure:" + bcolors.ENDC
    print text, "-->", kc
    print

###############################################################################
# run following examples
# cnlcp, _cnlcp = contiguous_non_overlapping_longest_common_prefixes(str(sys.argv[1]))
# print_out_kleen_closure(str(sys.argv[1]), cnlcp)
# python cnlcp.py AABABABBABB
# python cnlcp.py CDCDDDCDCDDD
# python cnlcp.py ananana
# python cnlcp.py aabaababab
# python cnlcp.py banana
# python cnlcp.py AABABABBABBDCADDADDADD
# python cnlcp.py GGBGBBGBBGDDGDDC
# python cnlcp.py AABABABADDADDCABBABBABB
# python cnlcp.py GGBGBBGBBGDDGDDCGBBGBBGBB     (bug in print_out_kleen_closure print out)
# python cnlcp.py AABABABDADBDCABBABBABB
# python cnlcp.py EBFEGEFECEADECEADEAGEFECEBADEBCEADEAGEFECEBADEBCEADEAG
# python cnlcp.py ABABBBABABBJKJKJKLJKK
# python cnlcp.py AABAABDAABRHHGHHGUHHG
# python cnlcp.py AABAABDDHHGHHG
# python cnlcp.py AABABABBABBDCABB
# python cnlcp.py AABABABBABB
# python cnlcp.py BANANAKANN
# python cnlcp.py AABABABBABBKABAB

# does not work for this input: AaAaAaBbCaCaCaAaAaBbCaCa

###############################################################################
###############################################################################
###############################################################################
def read_conformant_ff_output(file):
    """Read a 'Conformant-FF' output and extract and record a 
    plan into a string
    """
    plan = open(file, 'r').read().strip()
    start = "step"
    end = "time spent"
    contengency = False
    if plan.find(start) > -1 and plan.find(end) > -1:
        plan = plan[plan.find(start)+len(start):plan.rfind(end)]
        contengency = True
    # print 'plan:\n', plan

    return plan.lower(), contengency

###############################################################################
def get_plan_actions_dict(plan):
    """It receives an extracted plan from a 'Conformant-FF' planner, and 
    get a dictionary of plan actions in which every action is associated 
    with number a number. The keys are the actions' numbers and the values
    are the actions in a list.

    >>> plan = " \
        0: RAMINIFICATE \
        1: FLUSH TOILET \
        2: ASSUME_KNOWLEDGE BASIS_KB KB_BOMB_1 \
        3: RAMINIFICATE \
        4: SHED_KNOWLEDGE KB_BOMB_1 BASIS_KB"
    >>> get_plan_actions_dict(plan)
    {0: ['raminificate'], 1: ['flush', 'toilet'], 2: ['assume_knowledge', 'basis_kb', 'kb_bomb_1'], 3: ['raminificate'], 4: ['shed_knowledge', 'kb_bomb_1', 'basis_kb']}

    """

    # ------------------------------------------------------------
    # put the plan in a dictionary: key is the action number and value is the action
    plan_actions = {}
    try:
        for ac in plan.split('\n'):
            ac = ac.split()
            if ac: plan_actions[int(ac[0].split(':')[0])] = ac[1:]
    except Exception as e:
        _plan = ""
        i = 0
        for ac in plan.split('\n'):
            # ac = ac.split()
            ac = filter(None,re.split('\W+',ac))
            _plan += str(i) + ": " + " ".join(ac) + "\n"
            if ac: 
                plan_actions[i] = ac
                i = i + 1
        plan = _plan
    except:
        print bcolors.FAIL
        print "the input plan is different:\n"
        print plan
        print "\nplan should be either represented as in 'Conformant-FF', e.g.,"
        print "0: RAMINIFICATE"
        print "1: FLUSH TOILET"
        print "2: ASSUME_KNOWLEDGE BASIS_KB KB_BOMB_1"
        print "3: RAMINIFICATE"
        print "4: SHED_KNOWLEDGE KB_BOMB_1 BASIS_KB"
        print "\n\nor as:"
        print "tack(gripper1,block10,block9)"
        print "drop(gripper1,block10)"
        print "unstack(gripper1,block9,block8)"
        print "collect(gripper1,block9)"
        print "unstack(gripper1,block8,block7)"
        print bcolors.ENDC
        exit()
    # print '\nplan_actions:\n', plan_actions
    # exit()
    return plan_actions, plan

###############################################################################
def get_map_plan_actions_dict(plan_actions):
    """It receives plan actions dictionary from 'get_plan_actions_dict' 
    and returns a map of plan actions with letters starting from 'A' to 'Z' 
    as well as a string representing the given plan.

    >>> plan_actions = \
        {0: ['raminificate'], 1: ['flush', 'toilet'], 2: ['assume_knowledge', 'basis_kb', 'kb_bomb_1'], 3: ['raminificate'], 4: ['shed_knowledge', 'kb_bomb_1', 'basis_kb']}
    >>> get_map_plan_actions_dict(plan_actions)
    map: {'raminificate': 'A', 'shed_knowledge': 'D', 'assume_knowledge': 'C', 'flush': 'B'}
    mapped_plan_actions: ABCAD

    """
    # ------------------------------------------------------------
    # create a map of plan actions: key is the action name and value is a letter
    map = {}
    c = 65
    for i in range(len(plan_actions)):
        if not plan_actions[i][0] in map:
            map[plan_actions[i][0]] = chr(c)
            c = c + 1
    # print '\nmap:\n', map

    # ------------------------------------------------------------
    # map the into a string in which each letter correspond to a plan action
    mapped_plan_actions = ""
    for a in plan_actions.values():
        mapped_plan_actions+=(map[a[0]])
    # print '\nmapped_plan_actions:\n', mapped_plan_actions

    return map, mapped_plan_actions

###############################################################################
def refine_cnlcp_branch_collect(cnlcp,branch,collect,map):

    # ------------------------------------------------------------
    # check the branch and collect come after each other
    # i.e., pop iterations which collect comes before branch
    if branch != None and collect != None: 
        b = map[branch.lower()]
        c = map[collect.lower()]
        keys_to_rm = []
        for key in cnlcp:
            b_l = sorted([m.start() for m in re.finditer(b, key)])
            c_l = sorted([m.start() for m in re.finditer(c, key)])
            if not b_l or not c_l or b_l[-1] > c_l[-1]:
                # print 'branch, collect:', b_l, c_l
                keys_to_rm.append(key)
        for k in keys_to_rm:
            cnlcp.pop(k)

    return cnlcp

###############################################################################
def get_generalized_plan(cnlcp,plan_actions):

    # old approach
    # # ------------------------------------------------------------
    # # detect different constants to replace them with variables
    # constants = {}
    # for k in cnlcp:
    #     constants[k] = []
    #     # split actions and put all constants in a list of list corresponding to each action
    #     lopp_constants = []
    #     for i in cnlcp[k]:
    #         lopp_constants.append(sum(plan_actions.values()[i:i+len(k)], []))
    #     # in first and second iterations look for different constants
    #     for i in range(len(lopp_constants[0])):
    #         if lopp_constants[0][i] != lopp_constants[1][i]:
    #             if lopp_constants[0][i] not in constants[k]:
    #                 constants[k].append(lopp_constants[0][i])
    # print 'constants:\n', constants

    # ------------------------------------------------------------
    # detect different constants to replace them with variables
    constants = {}
    for k in cnlcp:
        constants[k] = []
        # look only into the first and second iterations
        for j in range(cnlcp[k][0],cnlcp[k][1]):
            for i in range(len(plan_actions[j])):
                if plan_actions[j][i] != plan_actions[j+len(k)][i] and \
                   plan_actions[j][i] not in constants[k]:
                        constants[k].append(plan_actions[j][i])
    # print 'constants:\n', constants

    # ------------------------------------------------------------
    # transform plan into a new generalized plan with constants
    i = 0  # index for plan_actions
    j = 0  # index for plan_actions_gen
    k = 0  # subtract the index of removed actions to adjust the loop index
    plan_actions_gen = {}
    # sort by values in (values,key) pairs
    for value, key in sorted([(value,key) for (key,value) in cnlcp.items()]):
        # print value, key
        while i < value[0]:
            plan_actions_gen[j] = plan_actions[i]
            i = i + 1
            j = j + 1
        while i < value[1]:
            plan_actions_gen[j] = plan_actions[i]
            # replace the constants with variables
            for o in constants[key]:
                for x in [x for x,c in enumerate(plan_actions_gen[j]) if c==o]:
                    plan_actions_gen[j][x] = '?_'+o
                    # plan_actions_gen[j][x] = '?_'+filter(str.isalnum, o)
                    # plan_actions_gen[j][x] = '?'+filter(str.isalpha, o).upper()
            i = i + 1
            j = j + 1
        plan_actions_gen[j] = ['loop',str(value[0]-k)]
        j = j + 1
        k += len(key) * (len(value)-1) - 1
        i += len(key) * (len(value)-1)

    # plan_actions_gen[j:] = plan_actions[i:]
    while i < len(plan_actions):
        plan_actions_gen[j] = plan_actions[i]
        i = i + 1
        j = j + 1

    # ------------------------------------------------------------
    # record the generalized plan in a string 'plan_gen' for further dispatch
    plan_gen = ""
    for k in plan_actions_gen:
        plan_gen += str(k)+': '+" ".join(plan_actions_gen[k])+'\n'

    return plan_gen

###############################################################################
def write_out_plan(file,plan_gen):

    filename = os.path.splitext(file)[0]
    extension = os.path.splitext(file)[1]
    # print out the generalized plan in a file with '_gen' extension
    f = open(filename + '_gen' + extension,'w')
    f.write(plan_gen)
    f.close()
    return filename + '_gen' + extension


###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################

################################################################################
################################################################################

_reverse = True
cnlcp, _cnlcp = contiguous_non_overlapping_longest_common_prefixes(str(sys.argv[1]), _reverse)
print
print bcolors.WARNING + '\n_cnlcp (not refined):' + bcolors.ENDC
print _cnlcp
print bcolors.WARNING + '\ncnlcp (refined):' + bcolors.ENDC
print cnlcp 

values = sorted(cnlcp.values())
nlcs_values = [[j/2 for j in i] for i in values]
print nlcs_values

# split a list of numbers (nlcs_values) based on the distance of consecutive elements
_nlcs_values = []
for x in xrange(len(cnlcp.keys())):
    n = len(cnlcp.keys()[x])/2
    lst = nlcs_values[x]
    indices = [i + 1 for (x, y, i) in zip(lst, lst[1:], range(len(lst))) if n < abs(x - y)]
    result = [lst[start:end] for start, end in zip([0] + indices, indices + [len(lst)])]
    # print result
    _nlcs_values.extend(result)

print _nlcs_values
nlcs_values = _nlcs_values

# ----------------------
size = len(str(sys.argv[1]))/2
plan = {} # pass, skip, loop ([open, close] or [open] or [close] or [])
for i in range(size):
    plan[i] = ['keep',[]]

for v in nlcs_values:
    # print v
    i = v[0]
    plan[i]=['loop',['open']]
    while ((i+1) < v[1]):
        i = i + 1
        plan[i]=['loop',[]]
    plan[i][1].append('close')
    for i in range(v[1],v[-1]+(v[1]-v[0])):
        plan[i]=['skip',[]]

# print plan.values()
# ----------------------


print
print ':-assert(nlcs(', plan.values(), ')).'
f = open('/tmp/nlcs', 'w')
f.write(':-assert(nlcs('+str(plan.values())+')).')
f.close()
################################################################################
################################################################################


# print longest_common_prefix('ana','anana')

# text = "pickplacepickplace"
# print sorted(longest_common_substring(text).items())
