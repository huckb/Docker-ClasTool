FROM rootproject/root:6.22.08-centos7
LABEL maintainer="huckb@canisius.edu"

COPY clas_lib /usr/local/clas_lib
COPY clas_pack /usr/local/clas_pack
COPY ClasTool /usr/local/ClasTool

ENV OS_NAME Linux
ENV OSNAME Linux
ENV CLAS_PACK /usr/local/clas_pack
ENV CLAS_LIB /usr/local/clas_lib
ENV CLASTOOL /usr/local/ClasTool
ENV PATH ${CLASTOOL}/bin/${OSNAME}:${PATH}
ENV ROOT_INCLUDE_PATH ${CLASTOOL}/include:${ROOT_INCLUDE_PATH}
ENV LD_LIBRARY_PATH ${CLASTOOL}/slib/${OS_NAME}:${LD_LIBRARY_PATH}

RUN cd /usr/local/ClasTool \
	&& make all
ENTRYPOINT ["/bin/bash"]
