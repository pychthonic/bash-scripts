"""
I'm going to write python scripts that do the same
thing as the bash scripts, just cause.
"""

import os
import sys

def in_path(file_name):
    path = os.environ['PATH']
    path_dir_list = path.split(':')
    found = False
    if file_name[0] == '/':
        if os.access(file_name, os.X_OK):
            print("Filename refers to an executable but not found in PATH variable directory list.")
        else:
            print("Filename does not refer to an executable and not in PATH variable directory list.")
    else:
        for directory in path_dir_list:
            full_file_name = os.path.join(directory, file_name)
            if os.path.isfile(full_file_name):
                print(f"Found in PATH environment variable directory: {full_file_name}")
                found = True
                if os.access(full_file_name, os.X_OK):
                    print(f"{full_file_name} is executable.")
                else:
                    print(f"{full_file_name} is not executable.")
        if not found:
            print(f"{file_name} not found in PATH environment variable directories. Executable status unknown since the file could not be located.")


if __name__ == '__main__':  
    file_name = sys.argv[1] 
    in_path(file_name)

