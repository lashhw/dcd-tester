import glob
import os
import sys

YELLOW = '\033[93m'
GREEN ='\033[92m' 
DEFAULT = '\033[0m'

for ans_path in sorted(glob.glob(f'{sys.argv[1]}/*.txt')):
    stu_path = os.path.basename(ans_path)
    with open(ans_path) as f:
        ans = f.readlines()
    with open(stu_path) as f:
        stu = f.readlines()
    same_lines = sum(1 for x, y in zip(ans, stu) if x == y)
    total_lines = len(ans)
    color = GREEN if same_lines == total_lines else YELLOW
    print(f'{color}{stu_path}: {same_lines}/{total_lines} ({same_lines/total_lines:.4}){DEFAULT}')