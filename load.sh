#/bin/bash

# Load material 

curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/archive/refs/heads/main.zip"

unzip aiida-muon-tutorials-main.zip
cd aiida-muon-tutorials-main/

# unpack data
find . -name '*.zip' -exec sh -c 'unzip -o "$1" -d "$(dirname "$1")"' _ {} \;

# load repos into aiida
find . -name '*.aiida' -exec verdi archive import {} \;


