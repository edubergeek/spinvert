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

## Usage
To build them all use:
  docker-compose build
  
To launch them all at once:
  docker-compose up -d

To stop them all:
  docker-compose down

To get shell prompt for a particular code:
   - **SIR** - docker exec -it --user=mpirun spinvert-sir-1 /bin/bash
   - **HAZEL** - docker exec -it --user=mpirun spinvert-hazel-1 /bin/bash
   - **RH** - docker exec -it --user=mpirun spinvert-rh-1 /bin/bash
   - **DeSIRe** - docker exec -it --user=mpirun spinvert-desire-1 /bin/bash

To run an interactive session of a single code (rather than all of them):
   - **SIR** - docker run -it --user=mpirun spinvert_sir /bin/bash
   - **HAZEL** - docker run -it --user=mpirun spinvert_hazel /bin/bash
   - **RH** - docker run -it --user=mpirun spinvert_rh /bin/bash
   - **DeSIRe** - docker run -it --user=mpirun spinvert_desire /bin/bash

## Documentation
   - [**SIR**](https://github.com/BasilioRuiz/SIR-code/blob/master/manual/manual.pdf)
   - [**HAZEL**](https://aasensio.github.io/hazel2/index.html)
   - [**RH**](https://github.com/han-uitenbroek/RH/blob/master/docs/rhmanual.pdf)
   - **DeSIRe** *TBD*
