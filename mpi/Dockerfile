# Build this image:  docker build -t mpi .
#

FROM ubuntu:18.04
# FROM phusion/baseimage

#MAINTAINER Ole Weidner <ole.weidner@ed.ac.uk>
MAINTAINER Curt Dodds <dodds@hawaii.edu>

ENV USER mpirun

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/${USER}

#RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

RUN apt-get update -y

RUN apt-get install -y --no-install-recommends sudo apt-utils cron
RUN apt-get install -y --no-install-recommends openssh-server
RUN apt-get install -y --no-install-recommends python3-dev python3-numpy python3-pip python3-virtualenv python3-scipy
RUN apt-get install -y --no-install-recommends gcc gfortran libopenmpi-dev openmpi-bin openmpi-common openmpi-doc binutils
RUN apt-get install -y ffmpeg libsm6 libxext6 build-essential libbz2-dev git
RUN apt-get install -y vim
RUN apt-get install -y jupyter-notebook

RUN apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir /var/run/sshd
RUN echo 'root:${USER}' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# ------------------------------------------------------------
# Add an 'mpirun' user
# ------------------------------------------------------------

RUN adduser --uid 1011 --disabled-password --gecos "" ${USER}
#RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# ------------------------------------------------------------
# Set-Up SSH with our Github deploy key
# ------------------------------------------------------------

ENV SSHDIR ${HOME}/.ssh/

RUN mkdir -p ${SSHDIR}
WORKDIR ${SSHDIR}
RUN ssh-keygen -N "xyzzy" -C 'mpirun user' -f id_rsa
RUN cat id_rsa.pub >${SSHDIR}/authorized_keys

WORKDIR /
ADD ssh/config ${SSHDIR}/config
#ADD ssh/id_rsa.mpi ${SSHDIR}/id_rsa
#ADD ssh/id_rsa.mpi.pub ${SSHDIR}/id_rsa.pub
#ADD ssh/id_rsa.mpi.pub ${SSHDIR}/authorized_keys

RUN chmod -R 600 ${SSHDIR}* && \
    chown -R ${USER}:${USER} ${SSHDIR}

RUN pip3 install --upgrade pip

USER ${USER}
RUN  pip install --user -U setuptools \
    && pip install --user mpi4py

# ------------------------------------------------------------
# Configure Python/SciPy/AstroPy/Jupyter
# ------------------------------------------------------------

WORKDIR /ml
RUN pip3 install --user pprintpp astropy scipy treecorr healpy camb corner emcee fitsio


# ------------------------------------------------------------
# Configure OpenMPI
# ------------------------------------------------------------

USER root

RUN rm -fr ${HOME}/.openmpi && mkdir -p ${HOME}/.openmpi
ADD default-mca-params.conf ${HOME}/.openmpi/mca-params.conf
RUN chown -R ${USER}:${USER} ${HOME}/.openmpi/mca-params.conf

COPY etc/bashrc ${HOME}/.bashrc
RUN chmod -R 600 ${HOME}/.bashrc && chown -R ${USER}:${USER} ${HOME}/.bashrc

COPY etc/bashrc /root/.bashrc
COPY etc/start-jupyter.sh /rapids/utils/start-jupyter.sh


# ------------------------------------------------------------
# Copy MPI4PY example scripts
# ------------------------------------------------------------

ENV JUPYTER_ENABLE_LAB=no
ENV TRIGGER 1

ADD mpi4py_benchmarks ${HOME}/mpi4py_benchmarks
RUN chown -R ${USER}:${USER} ${HOME}/mpi4py_benchmarks

RUN mkdir -p ${HOME}/.local/share/jupyter/runtime
RUN chown -R ${USER}:${USER} ${HOME}/.local/share/jupyter

RUN mkdir -p ${HOME}/.ipython
RUN chown -R ${USER}:${USER} ${HOME}/.ipython


#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
CMD ["cron", "-f"]
