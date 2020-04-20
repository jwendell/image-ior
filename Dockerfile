FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

ARG VERSION=1.1.0
ARG ISTIO_VERSION=1.4.6
ARG COPR_ORG=maistra
ARG COPR_REPO=istio-1.1
ARG SHA=undefined

LABEL com.redhat.component="maistra-ior"
LABEL name="maistra/istio-ior-ubi8"
LABEL version=${VERSION}
LABEL istio_version=${ISTIO_VERSION}
LABEL summary="Red Hat IOR OpenShift container image"
LABEL description="Red Hat IOR OpenShift container image"
LABEL io.k8s.display-name="Red Hat IOR"
LABEL io.openshift.tags="istio"
LABEL io.openshift.expose-services=""
LABEL maintainer="Istio Feedback <istio-feedback@redhat.com>"
LABEL sha=${SHA}

ENV container="oci"
ENV ISTIO_VERSION=${ISTIO_VERSION}

#RUN curl -Ls https://copr.fedorainfracloud.org/coprs/g/${COPR_ORG}/${COPR_REPO}/repo/epel-8/group_${COPR_ORG}-${COPR_REPO}-epel-8.repo -o /etc/yum.repos.d/${COPR_REPO}-epel-8.repo && \
RUN curl -Ls https://copr.fedorainfracloud.org/coprs/${COPR_ORG}/${COPR_REPO}/repo/epel-8/${COPR_ORG}-${COPR_REPO}-epel-8.repo -o /etc/yum.repos.d/${COPR_REPO}-epel-8.repo && \
    microdnf update -y && \
    microdnf install -y ior-${VERSION} && \
    microdnf clean all
WORKDIR /tmp/

ENTRYPOINT [ "/usr/bin/ior"]
