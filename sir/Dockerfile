# Build this image:  docker build -t mpi .
#

FROM spinvert_mpi

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>

RUN apt-get update && apt-get install -y zip


# ------------------------------------------------------------
# Configure Python/SciPy/AstroPy/Jupyter
# ------------------------------------------------------------

WORKDIR /

RUN git clone https://github.com/BasilioRuiz/SIR-code.git
WORKDIR /SIR-code
COPY sir2020_04new.zip sir2020_04new.zip
RUN unzip sir2020_04new.zip
RUN mv sir2020_04new src

WORKDIR /
RUN chown -R ${USER}:${USER} /SIR-code

USER ${USER}
WORKDIR /SIR-code/src
RUN make fc=gfortran

# ------------------------------------------------------------
# Configure OpenMPI
# ------------------------------------------------------------


# ------------------------------------------------------------
# Copy MPI4PY example scripts
# ------------------------------------------------------------

USER root
