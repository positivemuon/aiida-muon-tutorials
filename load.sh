#/bin/bash

# Load material 

curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/archive/refs/heads/main.zip"

unzip aiida-muon-tutorials-main.zip
cd aiida-muon-tutorials-main/

curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/CoF2.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/Cu.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/Fe.aiida"
curl -JLO "https://github.com/positivemuon/aiida-muon-tutorials/releases/download/v0.0.1/LaFeAsO.aiida"

# unpack data
find . -name '*.zip' -exec sh -c 'unzip -o "$1" -d "$(dirname "$1")"' _ {} \;

# load repos into aiida
find . -name '*.aiida' -exec verdi archive import {} \;

pip install git+https://github.com/mikibonacci//aiidalab-qe.git@speedup-tree
pip install git+https://github.com/positivemuon/aiida-muon.git@main
pip install ipywidgets==7.8.5
verdi daemon restart
