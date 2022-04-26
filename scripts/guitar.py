import time
import random

#  chords = 'Am,A,Bbm,Bb,Bm,B,Cm,C,Dbm,Db,D,Eb,E,F,F#,G,G#'.split(',')
chords = 'Am A Cm C C7 D D7 Dm Eb E Em F Fm \
    F# F#m G Gm'.split()


while True:
    print(random.choice(chords))
    time.sleep(2)

