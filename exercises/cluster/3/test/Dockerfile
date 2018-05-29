FROM python
COPY . /test
WORKDIR /test
RUN pip install robotframework
RUN pip install robotframework-requests
CMD ["/test/test.robot"] 
ENTRYPOINT ["robot"]