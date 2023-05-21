import glob

for ans_path in sorted(glob.glob('ans/t_cv_*.txt')):
    print(f'checking {ans_path}')
    with open(ans_path) as f:
        ans = []
        for line in f.readlines()[:5]:
            line = line.split()
            excess3 = int(line[-3], 2)
            bcd = int(line[-1], 2)
            assert excess3 >= 3
            assert excess3 <= 12
            assert bcd == excess3 - 3