import glob

for ans_path in sorted(glob.glob('ans/t_cv_*.txt')):
    print(f'checking {ans_path}')
    with open(ans_path) as f:
        for line in f.readlines():
            line = line.split()
            excess3 = int(line[-3], 2)
            bcd = int(line[-1], 2)
            assert excess3 >= 3
            assert excess3 <= 12
            assert bcd == excess3 - 3