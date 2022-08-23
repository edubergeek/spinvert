# Build this image:  docker build -t mpi .
#

FROM spinvert_mpi

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>


# ------------------------------------------------------------
# Configure DeSIRe
# ------------------------------------------------------------

WORKDIR /

COPY desire20220404.tar.gz desire20220404.tar.gz
RUN tar xzvf desire20220404.tar.gz
RUN chown -R ${USER}:${USER} /desire

USER ${USER}
WORKDIR /desire/src
RUN make fc=gfortran install

# ------------------------------------------------------------
# Configure OpenMPI
# ------------------------------------------------------------

USER root

