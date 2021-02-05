# Create cypress container -dit
# docker build . -t cypress:3.2.0
# docker run -dit -v $PWD:/e2e -w /e2e --name cypress.3.2.0 cypress:3.2.0
# docker run -dit -v C:/Projects_Jenkins/cypress-target:/e2e -w /e2e --name cypress.3.2.0 cypress:3.2.0
# old ex: docker run -dit -p 5000:80 -p 3000:8080 --name vue-docker-12 vue-docker:12
# 3.7 3.73 3.84 3.94 3.10.1 alpine:3.9
# // hacks people have said may fix cypress...
# unset NODE_OPTIONS
# npm install -g cypress --unsafe-perm --silent

FROM cypress/base:12.1.0

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1
ARG CYPRESS_VERSION="3.2.0"

RUN echo "whoami: $(whoami)"
RUN npm config -g set user $(whoami)
RUN npm install -g "cypress@${CYPRESS_VERSION}"
RUN cypress verify

# Cypress cache and installed version
RUN cypress cache path
RUN cypress cache list

# versions of local tools
RUN echo  " node version:    $(node -v) \n" \
  "npm version:     $(npm -v) \n" \
  "yarn version:    $(yarn -v) \n" \
  "debian version:  $(cat /etc/debian_version) \n" \
  "user:            $(whoami) \n"

# ENTRYPOINT ["cypress", "run"]
