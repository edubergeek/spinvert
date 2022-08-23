# Build this image:  docker build -t mpi .
#

FROM spinvert_mpi

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>


# ------------------------------------------------------------
# Configure DeSIRe
# ------------------------------------------------------------

WORKDIR /

COPY desire20220404.tar desire20220404.tar
RUN tar xvf desire20220404.tar
RUN chown -R ${USER}:${USER} /desire

USER ${USER}
WORKDIR /desire/src
RUN make fc=gfortran install

# ------------------------------------------------------------
# Configure OpenMPI
# ------------------------------------------------------------

USER root

