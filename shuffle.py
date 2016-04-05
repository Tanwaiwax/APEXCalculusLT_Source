#!/usr/local/bin/python3

#exit()

import random

random.seed(0)

"""
differentiation:
2.3: 11-25
2.4: 15-29
2.5: 7-28
2.6: 5-26

integration (indefinite, definite):
7.1: 3-75, 76-83
7.2: 4-38, 39-47
7.3: 4-26, 27-33
7.4: 5-26, 27-32
7.5: 7-25, 26-29

series: (is chap 8 in the source)
9.2: 6-44
9.3: 5-40
9.4: 5-34
9.5: 5-20
"""

problemsets = {
    '2':{3:[1],4:[3],5:[1],6:[1,2]},
    '6i':{1:range(1,8),2:[None,1,2],3:[None,1],4:[1],8:[1,2]},
    '6d':{1:[None,8],2:[3],3:[2],4:[2],8:[3]},
    '8':{2:[None,1,3,4,2],3:range(1,5),4:[1,2,3],5:[1]}
    }

problems = {}
    
for chap,sects in problemsets.items():
    problems[chap] = {}
    for sect,setlist in sects.items():
        problems[chap][sect] = []
        if setlist[0] is None:
            problems[chap][sect].append(setlist.pop(0))
        for probset in setlist:
            probsetname = 'exercises/0{}_0{}_exset_0{}.tex'.format(chap[0],sect,probset)
            with open(probsetname) as opened:
                for line in opened:
                    if line.startswith(r'\exinput{exercises'):
                        problems[chap][sect].append(line.rstrip())

evens = {}
odds = {}
for chap,sects in problems.items():
    evens[chap] = []
    odds[chap] = []
    for sect,probs in sects.items():
        evens[chap] += probs[1::2]
        odds[chap] += probs[::2]
    while None in odds[chap]:
        odds[chap].remove(None)

for chap in odds.keys():
    random.shuffle(evens[chap])
    random.shuffle(odds[chap])
    
probstowrite = 40

newprobs = {}
def createprobs(chap):
    newprobs[chap] = odds[chap]+evens[chap]
    newprobs[chap][:probstowrite:2] = random.sample(odds[chap],(probstowrite+1)//2)
    newprobs[chap][1:probstowrite:2] = random.sample(evens[chap],probstowrite//2)
    del newprobs[chap][probstowrite:]

for chap in ['2','6i','8']:
    createprobs(chap)

probstowrite = 15

createprobs('6d')

with open('exercises/02_cr_exset_01.tex','w') as chapreview:
    chapreview.write(r'{\noindent In Exercises}'+"\n")
    chapreview.write("{, compute the derivative of the given relation.}\n")
    chapreview.write("\n".join(newprobs['2']))

with open('exercises/06_cr_exset_01.tex','w') as chapreview:
    chapreview.write(r'{\noindent In Exercises}'+"\n")
    chapreview.write("{, evaluate the indefinite integral.}\n")
    chapreview.write("\n".join(newprobs['6i']))
with open('exercises/06_cr_exset_02.tex','w') as chapreview:
    chapreview.write(r'{\noindent In Exercises}'+"\n")
    chapreview.write("{, evaluate the definite integral.}\n")
    chapreview.write("\n".join(newprobs['6d']))

with open('exercises/08_cr_exset_01.tex','w') as chapreview:
    chapreview.write(r'{\noindent In Exercises}'+"\n")
    chapreview.write("{, determine whether the series converges absolutely, converges conditionally, or diverges.}\n")
    chapreview.write("\n".join(newprobs['8']))
