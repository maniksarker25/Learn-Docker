# FROM ubuntu

# RUN apt-get update
# RUN apt-get install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
# RUN apt-get upgrade -y
# RUN apt-get install -y nodejs

# COPY package.json package.json
# COPY package-lock.json package-lock.json
# COPY main.js main.js

# RUN npm install 

# ENTRYPOINT ["node","main.js"]

# Use the official Ubuntu base image
FROM ubuntu:latest

# Set up environment variables for non-interactive apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update, install curl, and set up Node.js repository
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Check if node and npm are installed properly
RUN node -v && npm -v

# Set the working directory inside the container
WORKDIR /app

# Copy package.json, package-lock.json, and other source files
COPY package.json package-lock.json ./
COPY main.js ./

# Install npm dependencies
RUN npm install

# Command to run the app
CMD ["node", "main.js"]



# terminal =>  docker build -t maniksarker/docker-node .    => for create image and store in docker hub