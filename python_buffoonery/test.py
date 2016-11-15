from collections import Counter
from operator import itemgetter

with open("program.s") as f:
    wordcount = Counter(f.read().split())

for key, value in sorted(wordcount.items(), key=itemgetter(1), reverse=True): 
    if key[0].islower() == True: 
        print key," - ", value

