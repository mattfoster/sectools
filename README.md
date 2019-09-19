# Kali Security Tools Image

This is a container with a few security tools, based on Kali Linux. 

I took the entrypoint.sh script from 
[raesene's containertools](https://github.com/raesene/alpine-containertools) project and
updated it to work with `ip addr`. 

## Tools

## Instructions

As with containertools...

        docker run -d -p 2200:22 drmpf/???

        docker ps - Get the container name

        docker logs <container> to get the root password

        ssh root@<ip>
