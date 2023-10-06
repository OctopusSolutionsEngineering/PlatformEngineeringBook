FROM mcr.microsoft.com/devcontainers/base:ubuntu
# Install the xz-utils package
RUN apt-get update && apt-get install -y xz-utils ruby-full build-essential zlib1g-dev dos2unix libegl1 libopengl0 epubcheck libxdamage1  libxkbcommon-x11-0
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
RUN gem install jekyll bundler jekyll-contentful-data-import
ENV RUN CALIBRE_INSTALLER_LOCAL_URL=https://octopus-sales-engineering.s3.ap-southeast-2.amazonaws.com/calibre-6.13.0-x86_64.txz
RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin version=6.13.0
