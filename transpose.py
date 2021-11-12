#!usr/bin/env python
import sys
from typing import List # using python 3.8 for some reason

if __name__ == "__main__":
    inpath: str = sys.argv[1]
    transposed_path: str = sys.argv[2]
    with open(inpath) as ifile:
        lines: List[str] = [line.strip() for line in ifile]

    with open(transposed_path, "w+") as ofile:
        # iterate over each column of the file
        for note in zip(*lines):
            ofile.write("".join(note)+"\n")
