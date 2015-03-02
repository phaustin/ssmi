FROM debian:7.4

MAINTAINER Phil Austin

RUN apt-get update && apt-get install -y wget bzip2
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet http://repo.continuum.io/miniconda/Miniconda-3.8.3-Linux-x86_64.sh && \
    /bin/bash /Miniconda-3.8.3-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda-3.8.3-Linux-x86_64.sh && \
    /opt/conda/bin/conda install --yes conda==3.9.0
RUN apt-get install -y gfortran &&  apt-get install -y git && \
    apt-get install -y make && apt-get install -y g++
RUN git clone https://github.com/phaustin/e582.git
ENV PATH /opt/conda/bin:$PATH
ENV LD_RUN_PATH /e582/ssmi/fortran/lib
RUN conda install -y cython && conda install -y h5py && \
    conda install -y ipython && conda install -y cmake && \
    conda install pandas && conda install pytables && \
    echo 'export LD_RUN_PATH=/e582/ssmi/fortran/lib' > /etc/profile.d/rpath.sh
    


