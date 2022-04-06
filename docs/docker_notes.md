# Miscellaneous commands

## Building, sending and launching a Dockerfile on another machine with same architecture
    docker build -t at3flo/sht .
    docker save at3flo/sht:latest -o sht_docker.tar
    rsync -chavzP --stats -e 'ssh -p 8822' sht_docker.tar matbgn@192.168.8.10:/home/matbgn/swisshockeytool-bootstrap/sht_docker.tar

To load an image on the target machine, run

    docker load < auto_scan_arm64.tar

Then double-check the list of your pulled images with `docker images`