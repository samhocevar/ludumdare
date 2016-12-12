#!/usr/bin/env python3

# Compute a table of distances between PICO-8 colours

import math

table = [
    (0x00, 0x00, 0x00), # black
    (0x1d, 0x2b, 0x53), # dark_blue
    (0x7e, 0x25, 0x53), # dark_purple
    (0x00, 0x87, 0x51), # dark_green
    (0xab, 0x52, 0x36), # brown
    (0x5f, 0x57, 0x4f), # dark_gray
    (0xc2, 0xc3, 0xc7), # light_gray
    (0xff, 0xf1, 0xe8), # white
    (0xff, 0x00, 0x4d), # red
    (0xff, 0xa3, 0x00), # orange
    (0xff, 0xec, 0x27), # yellow
    (0x00, 0xe4, 0x36), # green
    (0x29, 0xad, 0xff), # blue
    (0x83, 0x76, 0x9c), # indigo
    (0xff, 0x77, 0xa8), # pink
    (0xff, 0xcc, 0xaa), # peach
]

def sq(x):
    return x * x

print('static int const pico8_dist[256] = {')
for a in range(16):
    s = '    '
    for b in range(16):
        ra, ga, ba = table[a]
        rb, gb, bb = table[b]
        dist = sq(ra - rb) + sq(ga - gb) + sq(ba - bb)
        s += '%d, ' % (int(math.sqrt(dist)))
    print(s)
print('};')

