[![Log4j Shield](https://i.ibb.co/0hLdyRV/logo.png)](https://github.com/xsultan/log4jshield)
[![](https://img.shields.io/badge/release-v1-brightgreen?style=flat)](https://github.com/xsultan/log4jshield) [![](https://img.shields.io/github/stars/xsultan/log4jshield.svg?style=flat)](https://github.com/xsultan/log4jshield/stargazers) [![](https://img.shields.io/github/forks/xsultan/log4jshield?style=flat)](https://github.com/xsultan/log4jshield/network/members) [![](https://img.shields.io/github/issues/xsultan/log4jshield.svg?style=flat)](https://github.com/xsultan/log4jshield/issues) [![](https://img.shields.io/github/repo-size/xsultan/log4jshield.svg?style=flat)](https://github.com/xsultan/log4jshield/) [![](https://img.shields.io/github/license/adilsoybali/Log4j-RCE-Scanner.svg?style=flat)](https://github.com/xsultan/log4jshield/blob/master/LICENSE) [![GitHub last commit](https://img.shields.io/github/last-commit/xsultan/log4jshield)](https://github.com/xsultan/log4jshield/commits/main)

[Demo](https://github.com/xsultan/log4jshield#Demo) •
[Feature](https://github.com/xsultan/log4jshield#Features) • [Requirements](https://github.com/xsultan/log4jshield#Requirements) • [Installation](https://github.com/xsultan/log4jshield#Installation) • [Usage](https://github.com/xsultan/log4jshield#Usage) • [Contributing](https://github.com/xsultan/log4jshield#Contributing) •
[Contact](https://github.com/xsultan/log4jshield#Contact)

# Log4j Shield - fast ⚡, scalable and easy to use

### No Log4j vulnerability left behind

Using this tool, you can scan for remote command execution vulnerability CVE-2021-44228 on Apache Log4j at multiple addresses.

> [Affected versions < 2.15.0](https://logging.apache.org/log4j/2.x/security.html)

## Features

- It can scan for the vulnerability within your system regardless of the naming convention of the library.
- Deep Searchs for the vulnerability within nested libraries, compressed and concatanted libraries.
- Creates a report of all Java ARchives (JAR) within your system or directory, the reports will contain the safe and vulnerabile JARs.
- Blazing fast ⚡, scalable and easy to use, (a system with more than 20k JARs takes about 3 mins)

## Demo

[![demo](https://asciinema.org/a/GekJp7Xi35XBOHm8yDUeHCYfS.svg)](https://asciinema.org/a/GekJp7Xi35XBOHm8yDUeHCYfS)

## Requirements

1. Nothing, just grab the script that's suitable to your system.

## Installation

1.  `git clone https://github.com/xsultan/log4jshield.git`
2.  `cd log4jshield`
3.  `chmod +x log4jshield.sh`
4.  If you'd like to make it callable move the script to your `bin` folder:
    `export PATH=$PATH:$(cd -)/log4jshield.sh`

## Usage

1. Navigate to your desired directory or go to your root path by typing `cd /`
2. Then run the tool
   ./log4jshield.sh
   This will start scanning for all the JARs, then it will generate a report which will be created in the same path you ran the tool at.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## Contact

[![Email](https://img.shields.io/static/v1?style=for-the-badge&message=Email&color=EA4335&logo=Gmail&logoColor=FFFFFF&label=)](mailto:sultansaw@gmail.com) [![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/xsultan) [![Twitter](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/xsultan)
