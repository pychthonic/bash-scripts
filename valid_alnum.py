# Shortest program ever. Python version of Script # 2
# in "Wicked Cool Scripts" by Dave Taylor and Brandon Perry

def check_alnum(input_string):
    if input_string.isalnum():
        return True
    else:
        return False

if __name__ == "__main__":
    input_string = input("Enter string to test: ")
    if check_alnum(input_string):
        print('String is alphanumeric.')
    else:
        print('String is not alphanumeric.')
