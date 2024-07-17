import sys
import statistics
import os

data_file_path = sys.argv[1]
target_file_path = sys.argv[2]

file_list = os.listdir(os.path.dirname(data_file_path))
file_list.sort(key=lambda x: int(x.split('.')[0]))

with open(target_file_path, 'a') as file:
    for txt_file in file_list:
        size = os.path.splitext(txt_file)[0] 
        with open(os.path.join(os.path.dirname(data_file_path), txt_file), 'r') as f:
            content = f.read().splitlines()
        arr = [int(line) for line in content]
        file.write(f"{size} ")
        file.write(f"{min(arr)} ")
        file.write(f"{statistics.quantiles(arr, n=4)[0]} ")
        file.write(f"{statistics.median(arr)} ")
        file.write(f"{statistics.quantiles(arr, n=4)[-1]} ")
        file.write(f"{max(arr)} ")
        file.write(f"{statistics.mean(arr):.2f}\n")
