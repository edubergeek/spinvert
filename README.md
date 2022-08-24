# spinvert
Docker Compose containers with 4 Spectropolarimetric Inversion codes plus MPI

## Attributions
These inversion codes were used in the 2022 NCAR HAO/NSO [Summer Spectrolpolarimetry School](https://www2.hao.ucar.edu/events/workshop/spectropolarimetry-2022/inversion-codes).

These are SIR, Hazel, RH and DeSIRe:
- **SIR** - Stokes Inversion based on Response functions [(Ruiz Cobo & Del Toro Iniesta, 1992)](https://ui.adsabs.harvard.edu/abs/1992ApJ...398..375R/abstract)
- **HAZEL** - HAnle and ZEeman Light [(Asensio Ramos et al., 2008)](https://ui.adsabs.harvard.edu/abs/2008ApJ...683..542A/abstract)
- **RH** - Rybicki & Hummer code [(Uitenbroek, 2001)](https://ui.adsabs.harvard.edu/abs/2001ApJ...557..389U/abstract)
- **DeSIRe** - Departure coefficient aided Stokes Inversion based on Response functions [(Ruiz Cobo et al., 2022.)](https://www.dropbox.com/sh/q75ixw4bnsw67eu/AAAPfCXCey6R4S1epJb_Yu3Ca?dl=0)

For running parallelized codes a modified copy of Ole Weidner's [Docker OpenMPI repo](https://github.com/oweidner/docker.openmpi) is included. The sshd service is not activated but the MPI is available.

If /scratch exists it will be mapped into the container.

## Usage
To build them all use:
  docker-compose build
  
To launch them all at once:
  docker-compose up -d

To stop any or all running services:
  docker-compose down
  
To launch just one code:
  docker-compose up -d sir|hazel|rh|desire

To get shell prompt for a particular code:
   - **SIR** - docker exec -it spinvert-sir-1 /bin/bash
   - **HAZEL** - docker exec -it spinvert-hazel-1 /bin/bash
   - **RH** - docker exec -it spinvert-rh-1 /bin/bash
   - **DeSIRe** - docker exec -it spinvert-desire-1 /bin/bash

For a quick and easy Jupyter Notebook:
  1. cd spinvert
  1. docker-compose up -d hazel
  1. docker exec -it spinvert-hazel-1 /bin/bash
  1. cd /scratch
  1. jnb
  1. copy the token that is displayed
  1. open a browser to localhost:8888 (ssh port forwarding is useful here)
  1. paste the token from above and hit Return
  
## Documentation
   - [**SIR**](https://github.com/BasilioRuiz/SIR-code/blob/master/manual/manual.pdf)
   - [**HAZEL**](https://aasensio.github.io/hazel2/index.html)
   - [**RH**](https://github.com/han-uitenbroek/RH/blob/master/docs/rhmanual.pdf)
   - **DeSIRe** *TBD*
