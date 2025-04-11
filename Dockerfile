FROM ubuntu:latest

RUN echo stage_1
# Install necessary packages
RUN apt-get update && apt-get install -y  build-essential 
RUN echo stage_2


# Set the working directory
WORKDIR /app
RUN echo stage_3

# Copy your C file into the container
COPY main.c .
RUN echo stage_4

# Compile the C file
RUN gcc -o hello main.c
RUN echo stage_5

RUN gcc  -o hello2 main.c
RUN gcc -shared -fPIC -o libhello2library.so main.c
RUN echo stage_6


#docker build -t mylibrary-builder3 .
#docker create --name tempx mylibrary-builder3
# docker cp tempx:/app/libhello2library.so .
# docker cp tempx:/app/hello2 .
# docker rm tempx
