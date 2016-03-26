from random import randint, shuffle
from os import getcwd
import webbrowser
f=open("Challenge Puzzle.html", "w")
numbers=[]

letters = [ "A", "B", "C", "D", "E", "F", "G",
                "H", "I", "J", "K", "L" ,"M", "N", "O",
            "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y" ,"Z"]
months=["JANUARY"  , "FEBRUARY",  "MARCH"   ,  "APRIL"  ,   "MAY" ,  "JUNE" , "JULY",  "AUGUST",   "SEPTEMBER", "OCTOBER" ,  "NOVEMBER" , "DECEMBER" ]
shuffle(months)
monthsString=""
puzzle="<!DOCTYPE html><html><head><title>Puzzle Challenge Tier 1</title></head><body><h1>Puzzle Challenge Tier 1</h1><table><tr>"
def initializer(m):
    l =len(m)
    inv = randint(0,1)
    if inv:
        h   = randint(0,(50-l))
        v   = randint(0,(50-l))
    else:
        h   = randint(l,50)
        v   = randint(l,50)
    return h, v, l, inv
def comp(list1, list2):
    for val in list1:
        if val in list2:
            return False
    return True

def horizontal(m):
    global numbers
    in_ = initializer(m)
    temp=[]
    for i in range(0, (in_[2]-1)):
        if in_[3]:
            p = in_[0]*50 + in_[1] + i
        else:
            p = in_[0]*50 + in_[1] - i
        temp.append(p)
    if comp(numbers,temp):
        numbers += temp
    else:
        horizontal(m)
def vertical(m):
    global numbers
    in_ = initializer(m)
    temp=[]
    for i in range(1, in_[2]):
        if in_[3]:
            p = (in_[0]+i)*50 + in_[1]
        else:
            p = (in_[0]-i)*50 + in_[1]
        temp.append(p)
    if comp(numbers,temp):
        numbers += temp
    else:
        vertical(m)

def diagonal(m):
    global numbers
    in_ = initializer(m)
    temp=[]
    for i in range(0, (in_[2]-1)):
        if in_[3]:
            p = (in_[0]+i)*50 + in_[1] + i
        else:
            p = (in_[0]-i)*50 + in_[1] - i
        temp.append(p)
    if comp(numbers,temp):
        numbers += temp
    else:
        horizontal(m)

for i in range(0,11):
    monthsString += months[i]
    if i < 4:
        horizontal  (months[i])
    elif i < 8:
        vertical(months[i])
    else:
        diagonal(months[i])

month_index=0
for i in range(0, 2500):
    if i in numbers:
        idx = numbers.index(i)
        puzzle += "<td>"+monthsString[idx]+"</td>"
    else:
        puzzle += "<td>"+letters[randint(0,25)]+"</td>"    
    if i % 50 == 49:
        puzzle += "</tr><tr>"
puzzle +="</tr></table></body></html>"
f.write(puzzle)
f.close()
br= getcwd()+"/Challenge Puzzle.html"
webbrowser.open(br, new=2)
