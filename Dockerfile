FROM node:12-buster

# Install git
RUN apt-get update && apt-get install -y git lib32stdc++6 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create application folder
RUN mkdir /app

# Create application user
RUN useradd -u 123 -U -m -s /bin/false arma && usermod -G users arma

# Download Arma Server Web Manager
RUN git clone https://github.com/Dahlgren/arma-server-web-admin.git /app

# Install node dependencies for the application
WORKDIR /app
RUN npm install

# Copy start application script
COPY start.sh /app/

# Start application
CMD ./start.sh

# Declare application port
EXPOSE 3000
