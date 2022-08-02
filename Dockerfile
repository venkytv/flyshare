FROM rootgg/plik:latest

COPY plikd.cfg .
COPY run.sh .

CMD ./run.sh
