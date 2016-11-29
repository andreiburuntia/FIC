from collections import Counter
words=[]
with open('program.s') as f:
    for line in f:
        if (line.split(None, 1)[0])[0].islower():
            words.append(line.split(None, 1)[0])
counter=Counter(words)
print counter