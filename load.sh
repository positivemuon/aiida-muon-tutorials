#/bin/bash

# Load material 

curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/archive/refs/heads/main.zip"

unzip -o aiida-muon-tutorials-main.zip
cd aiida-muon-tutorials-main/

curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/CoF2.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/Cu.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/Fe.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/LaFeAsO.aiida"
curl -JLO "ttps://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/handson.pdf"

# unpack data
find . -name '*.zip' -exec sh -c 'unzip -o "$1" -d "$(dirname "$1")"' _ {} \;

# load repos into aiida
find . -name '*.aiida' -exec verdi archive import {} \;

pip install --no-deps git+https://github.com/mikibonacci//aiidalab-qe.git@speedup-tree
pip install --no-deps git+https://github.com/positivemuon/aiida-muon.git@main
verdi daemon restart
