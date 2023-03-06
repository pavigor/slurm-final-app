FROM bitnami/ruby:2.7.4
MAINTAINER s018753@edu.slurm.io

################## BEGIN INSTALLATION ######################

RUN apt update -y && \
    apt install -y libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir --parents ~/.postgresql && \
    wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" \
    --output-document ~/.postgresql/root.crt && \
    chmod 0600 ~/.postgresql/root.crt


# Set the working directory to /app
WORKDIR /app

COPY Gemfile Gemfile

ENV LANG=en_us.UTF-8
ENV LC_ALL=C.UTF-8
ENV RACK_ENV=production

RUN gem install bundler --no-document
RUN bundle install
COPY *.rb ./
COPY modules modules
# Set the working directory to /
WORKDIR /
ADD startup.sh startup.sh

##################### INSTALLATION END #####################

CMD ["./startup.sh"]


