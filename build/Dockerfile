
FROM harbor.cloudminds.com/hari/harix-auto-test-oss-janus-build-base:20201231 as build

RUN cd janus-gateway && \
	git checkout v0.10.4 && \
	sh autogen.sh && \
	./configure --prefix=/usr/local && \
	make && \
	make install && \
	make configs

FROM harbor.cloudminds.com/hari/harix-auto-test-oss-janus-run-base:20201231

COPY --from=build /usr/lib/libsrtp2.so.1 /usr/lib/libsrtp2.so.1
RUN ln -s /usr/lib/libsrtp2.so.1 /usr/lib/libsrtp2.so

COPY --from=build /usr/lib/libnice.la /usr/lib/libnice.la
COPY --from=build /usr/lib/libnice.so.10.10.0 /usr/lib/libnice.so.10.10.0
RUN ln -s /usr/lib/libnice.so.10.10.0 /usr/lib/libnice.so.10
RUN ln -s /usr/lib/libnice.so.10.10.0 /usr/lib/libnice.so

COPY --from=build /usr/local/bin/janus /usr/local/bin/janus
COPY --from=build /usr/local/bin/janus-cfgconv /usr/local/bin/janus-cfgconv
COPY --from=build /usr/local/etc/janus /usr/local/etc/janus
COPY --from=build /usr/local/lib/janus /usr/local/lib/janus
COPY --from=build /usr/local/share/janus /usr/local/share/janus

ENV BUILD_DATE=${BUILD_DATE}
ENV GIT_BRANCH=${GIT_BRANCH}
ENV GIT_COMMIT=${GIT_COMMIT}
ENV VERSION=${VERSION}

EXPOSE 10000-10200/udp
EXPOSE 8188
EXPOSE 8088
EXPOSE 8089
EXPOSE 8889
EXPOSE 8000
EXPOSE 7088
EXPOSE 7089

WORKDIR /app/

COPY bin bin

CMD ["/app/bin/startup.sh"]
