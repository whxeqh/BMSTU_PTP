import sys
import math

def calc_rse(data_file_path):
    with open(data_file_path, 'r') as file:
        data = [int(num) for num in file]
    avg = sum(data) / len(data)
    s_sq = sum((num - avg) ** 2 for num in data) / (len(data) - 1)
    s = math.sqrt(s_sq)
    std_err = s / math.sqrt(len(data))
    rse = (std_err / avg) * 100

    return rse

if __name__ == "__main__":
    data_file_path = sys.argv[1]
    rse_value = calc_rse(data_file_path)
    print(rse_value)
