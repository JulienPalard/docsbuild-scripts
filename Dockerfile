FROM ubuntu:bionic

WORKDIR /docsbuild

COPY . /docsbuild

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-venv build-essential fonts-freefont-otf git python-dev  python-virtualenv latexmk  texlive texlive-latex-extra texlive-latex-recommended texlive-fonts-recommended texlive-lang-all texlive-xetex xindy zip rsync locales && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN mkdir -p www logs build_root && python3 -m venv build_root/venv/ && build_root/venv/bin/python -m pip install -r requirements.txt
