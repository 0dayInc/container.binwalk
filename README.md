# container.binwalk
## What:
container.binwalk is a project maintained by 0day Inc.  This project is comprised of the means to build and deploy a docker container with binwalk and its 3rd party dependencies.  The goal is to maximize the benefits of binwalk to get security researchers up and running as fast as possible. 

## Why:
Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extracting firmware images.  One of its strengths (and arguably one of its weaknesses) is that it relies upon numerous third-party tools to analyze firmware and carry out the task of extraction.  This project was started to faciliate in the installation of as many binwalk dependencies as possible to empower security researchers to focus on security of firmware and less about the tooling to accomplish their objective(s).

## How:
container.binwalk starts with a base container of Kali rolling.  From there binwalk and its respective dependencies are installed to mazimize the potential of security research.

## Dependencies:
* Docker Desktop
* Vagrant
* Packer (If you're interested in contributing - see Contributing)  

## Installation:
```
git clone https://github.com/0dayinc/container.binwalk && cd container.binwalk && ./install.sh
```

## Usage:
```
docker run -it container.binwalk binwalk
```

## Contributing:
If you're interested in contributing to this project, fork, make changes, and submit a pull request.
