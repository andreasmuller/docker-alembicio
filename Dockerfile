FROM debian:jessie

RUN apt-get update && apt-get install -y git make g++ python-pip cmake wget libboost-all-dev libz-dev python-dev libboost-python-dev python-numpy libhdf5-dev

RUN pip install tornado

RUN wget http://download.savannah.nongnu.org/releases/openexr/ilmbase-2.2.0.tar.gz && \
    tar xvf ilmbase-2.2.0.tar.gz && \
    cd ilmbase-2.2.0 && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf ilmbase-2.2.0 ilmbase-2.2.0.tar.gz

RUN wget http://download.savannah.gnu.org/releases/openexr/pyilmbase-2.2.0.tar.gz && \
    tar xvf pyilmbase-2.2.0.tar.gz && \
    cd pyilmbase-2.2.0 && \
    ./configure --disable-ilmbasetest && \
    make install && \
    cd .. && \
    rm -rf pyilmbase-2.2.0 pyilmbase-2.2.0.tar.gz

RUN git clone https://github.com/alembic/alembic && \
    cd alembic && \
    cmake -DALEMBIC_PYILMBASE_PYIMATH_LIB=/usr/local/lib/libPyImath.so -DUSE_PYALEMBIC=ON -DUSE_HDF5=ON -DALEMBIC_LIB_USES_BOOST=ON . && \
    make -j 4 install && \
    cd .. && \
    cp /alembic/python/PyAlembic/alembic.so /usr/local/lib/ && \
    rm -rf alembic

RUN mkdir -p /usr/local/lib/python/

ADD src/* /src/

WORKDIR /src

CMD PYTHONPATH=/usr/local/lib python torabc.py