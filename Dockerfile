FROM anapsix/alpine-java:8_jdk

ENV GRADLE_VERSION "2.7"
ENV GRADLE_HOME "/opt/gradle"
ENV TESTS_DIR="/opt/tests"
ENV TERM 'xterm'

WORKDIR /opt
RUN apk update;
RUN apk add curl unzip
RUN curl -L  "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"  -o ./gradle.zip && \
    unzip ./gradle.zip && rm /opt/gradle.zip && \
    mv /opt/gradle* gradle

ENV PATH $GRADLE_HOME/bin:$PATH

ADD ./tests $TESTS_DIR
ADD ./docker/run_tests.sh $TESTS_DIR
WORKDIR $TESTS_DIR
RUN ./start_gradle_wrapper.sh && ./gradlew build --refresh-dependencies --exclude-task test
