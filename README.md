# xcompile
A simple github repository to show the way a C code is cross-compiled


```bash

xcompile/
├── .github/
│   └── workflows/
│       └── build.yml
├── main.c
├── Dockerfile
├── DockerfileForGcc
├── DockerfileForArm
├── Dockerfile
├──.gitignore
└── README.md

```

I installed docker and wsl2. the docker contains a ubuntu container.  how can I cross compile a C file?
<br>
Create a Dockerfile to set up the cross-compilation environment. This project is an example for cross-compiling a C file for ARM architecture
<br>

# Cross-compiling usind Docker
in powershell:
```bash
docker ps     #running containers
docker images #running images

cd d:/ttx/xcompile  #where Dockerfile is present
docker build -f Dockerfile  -t mycompile-c-x64 .         #This command will create a Docker image named compile-c-x64 using the Dockerfile in the current directory.
docket images                                          #check if the image has been  created
#docker run --rm -v ${pwd}:/app compile-c-x64:latest    #After building the image, you can run the container to compile your C file
docker create --name tempx mycompile-c-x64  # Create a container
docker cp tempx:/app/hello .                     #extract the created  file from the container to local disk
docker cp tempx:/app/libhellolibrary.so .
docker rm tempx

```

# WSL
## Install first Ubuntu  or any other Linux on Windows

in powersell:
```bash
winget --list --online
winget --install ubuntu  #or winget --install --distribution ubuntu-1.2.3
wsl --list --verbose
```

## Once Ubuntu installed, open an ubuntu shell
```bash
uname -a
lsb_release -a 
sudo apt update
sudo apt upgrade -y
#for cmake instalation you can do
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common wget
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-get install cmake
cmake --version
# for cross-compilation:
#compile your file and obtain the *.so as usual in Linux

```

 