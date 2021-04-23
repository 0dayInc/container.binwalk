# container.binwalk
## **Table of Contents ** ##
- [Keep Us Caffeinated](#keep-us-caffeinated)
- [What](#what)
- [Why](#why)
- [How](#how)
- [Dependencies](#dependencies)
- [Usage](#usage)
- [Contributing](#contributing)

### **Keep Us Caffeinated** ###
If you've found this project useful we invite you to take a brief moment to keep us caffeinated:

[![Coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://buymeacoff.ee/0dayinc)

## **What** ##
container.binwalk is a project maintained by 0day Inc.  This project is comprised of the means to build and deploy a docker container with binwalk and its 3rd party dependencies for firmware analysis.

## **Why** ##
Binwalk is a fast, easy to use tool for analyzing, reverse engineering, and extracting firmware images.  One of its strengths (and arguably one of its weaknesses) is that it relies upon numerous third-party tools to analyze firmware and carry out the task of extraction.  This project was started to faciliate in the installation of as many binwalk dependencies as possible to empower security researchers to focus more on firmware security and less about the tooling to accomplish their objective(s).

## **How** ##
container.binwalk starts with a base container of Kali rolling.  From there binwalk and its respective dependencies are installed to mazimize the potential of security research.  A volume is mounted in /tmp to enable security researchers to leverage 0dayinc/container.binwalk to access firmware files stored in your local /tmp folder.

## **Dependencies** ##
- Docker Desktop
- Packer (Only if you're interested in contributing - see [Contributing](#contributing))  

## **Usage** ##
```
$ docker run --privileged --volume /tmp:/tmp --rm -it 0dayinc/container.binwalk -c "binwalk -Me /tmp/<TARGET_FIRMWARE_FILE> 2> /tmp/binwalk_error.log"
```
or
```
$ docker run --privileged --volume /tmp:/tmp --rm -it 0dayinc/container.binwalk -c "find /tmp/<TARGET_FIRMWARE_DIR> -type f -execdir binwalk -Me {} \; 2> /tmp/binwalk_error.log"
```

We leverage:
```
... 2> /tmp/binwalk_error.log
```
to log any errors that may be used to improve upon the build process (i.e. implement new extraction tools, address bugs, etc.)

## **Contributing**
If you're interested in contributing to this project, fork, make changes, and submit a pull request.

```
$ git clone https://github.com/0dayinc/container.binwalk && cd container.binwalk/build
```
