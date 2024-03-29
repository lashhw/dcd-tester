import glob
import os
import sys
import filecmp

for ans_path in sorted(glob.glob(f'{sys.argv[1]}/*.txt')):
    try:
        stu_path = os.path.basename(ans_path)
        with open(ans_path) as f:
            ans = f.readlines()
        with open(stu_path) as f:
            stu = f.readlines()
        same_lines = sum(1 for x, y in zip(ans, stu) if x == y)
        total_lines = len(ans)
        percentage = 'correct' if filecmp.cmp(ans_path, stu_path, shallow=False) else same_lines/total_lines
        print(f'{stu_path}: {same_lines}/{total_lines} ({percentage})')
    except FileNotFoundError:
        print(f'{stu_path}: file not found')