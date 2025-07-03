
import subprocess

exfiles = subprocess.run('grep --files-with-matches ALT-TEXT-TO-BE-DETERMINED exercises/*',
                        capture_output=True, shell=True).stdout.decode().splitlines()

def getcontainingfile(input:str) -> str:
    input = input.removesuffix('.tex')
    exfile = subprocess.run(f'grep --files-with-matches {input} exercises/*', capture_output=True, shell=True).stdout.decode().splitlines()
    if not exfile:
        exfile = subprocess.run(f'grep --files-with-matches {input} text/*', capture_output=True, shell=True).stdout.decode().splitlines()
    return exfile[0] if exfile else exfile

for exfile in exfiles:
    filechain = [exfile]
    while filechain[-1]:
        filechain.append(getcontainingfile(filechain[-1]))
    filechain.pop()
    print(' has '.join(reversed(filechain)))
