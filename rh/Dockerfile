# Build this image:  docker build -t mpi .
#

#FROM nvcr.io/nvidia/rapidsai/rapidsai:22.02-cuda11.2-runtime-ubuntu20.04
FROM spinvert_mpi
# FROM phusion/baseimage

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>

#ENV USER mpirun

# ------------------------------------------------------------
# Configure Application
# ------------------------------------------------------------

WORKDIR /
RUN git clone https://github.com/han-uitenbroek/RH.git
RUN chown -R ${USER}:${USER} /RH

USER ${USER}
WORKDIR /RH
RUN make

WORKDIR /RH/rhf1d
RUN make

WORKDIR /RH/rhsc2d
RUN make

WORKDIR /RH/rhsc3d
RUN make

WORKDIR /RH/rhsphere
RUN make
WORKDIR /RH

# ------------------------------------------------------------
# Do more stuff as root 
# ------------------------------------------------------------

USER root

