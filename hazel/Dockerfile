# Build this image:  docker build -t mpi .
#

#FROM nvcr.io/nvidia/rapidsai/rapidsai:22.02-cuda11.2-runtime-ubuntu20.04
FROM spinvert_mpi
# FROM phusion/baseimage

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>

#ENV USER mpirun

#ENV DEBIAN_FRONTEND=noninteractive \
#    HOME=/home/${USER}


#RUN mkdir -p /usr/lib/python3.8/site-packages
#RUN chmod 777 /usr/lib/python3.8/site-packages

USER ${USER}
#USER root

# ------------------------------------------------------------
# Configure Application
# ------------------------------------------------------------

RUN pip3 install --user h5py configobj asciitree cython


ENV FC gfortran
ENV CC gcc
ENV CXX g++
WORKDIR /ml
RUN git clone https://github.com/aasensio/hazel2.git
WORKDIR /ml/hazel2
RUN python3 setup.py install --user
WORKDIR /ml

# ------------------------------------------------------------
# Do more stuff as root 
# ------------------------------------------------------------

USER root

ENV JUPYTER_ENABLE_LAB=no

# ------------------------------------------------------------
# Configure startup
# ------------------------------------------------------------

#EXPOSE 22
