FROM devuan/devuan:excalibur-2026-09-18

RUN    echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" > /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-proposed-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-security main contrib" >> /etc/apt/sources.list \
	&& echo 'Acquire::http::Timeout "20";\nAcquire::ftp::Timeout "20";\nAcquire::Retries "40";' > /etc/apt/apt.conf.d/99timeout \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		bindgen \
		bison \
		build-essential \
		ca-certificates \
		cargo \
		catch2 \
		cbindgen \
		ccache \
		clang-22 \
		cmake \
		debhelper \
		debhelper-compat \
		devscripts \
		directx-headers-dev \
		dpkg-dev \
		equivs \
		fakeroot \
		flex \
		g++-multilib \
		gcc-multilib \
		git \
		glslang-tools \
		hwdata \
		libasound2-dev \
		libavif-dev \
		libbenchmark-dev \
		libcap-dev \
		libclang-22-dev \
		libclang-cpp22-dev \
		libclang-rt-22-dev \
		libclc-22 \
		libclc-22-dev \
		libcups2-dev \
		libdbus-1-dev \
		libdisplay-info-dev \
		libdrm-dev \
		libeis-dev \
		libfaudio-dev \
		libfontconfig-dev \
		libfreetype-dev \
		libgl-dev \
		libglm-dev \
		libgnutls28-dev \
		libgstreamer-plugins-base1.0-dev \
		libgstreamer1.0-dev \
		libinput-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblcms2-dev \
		libliftoff-dev \
		libllvm22 \
		libluajit-5.1-dev \
		libmpg123-dev \
		libncurses-dev \
		libncurses6 \
		libosmesa6-dev \
		libpcap-dev \
		libpipewire-0.3-dev \
		libpixman-1-dev \
		libpng-dev \
		libpulse-dev \
		librust-paste-dev \
		librust-proc-macro2-dev \
		librust-quote-dev \
		librust-syn-dev \
		librust-unicode-ident-dev \
		libsdl2-dev \
		libseat-dev \
		libsensors-dev \
		libset-scalar-perl \
		libstb-dev \
		libstd-rust-1.85 \
		libstd-rust-dev \
		libtiff-dev \
		libudev-dev \
		libunwind-dev \
		libusb-1.0-0-dev \
		libv4l-dev \
		libva-dev \
		libva-drm2 \
		libva-glx2 \
		libva-wayland2 \
		libva-x11-2 \
		libva2 \
		libvdpau-dev \
		libvdpau1 \
		libvkd3d-dev \
		libvulkan-dev \
		libwayland-dev \
		libwayland-egl-backend-dev \
		libwlroots-0.18-dev \
		libx11-dev \
		libx11-xcb-dev \
		libxcb-composite0-dev \
		libxcb-dri2-0 \
		libxcb-dri2-0-dev \
		libxcb-dri3-dev \
		libxcb-errors-dev \
		libxcb-ewmh-dev \
		libxcb-glx0-dev \
		libxcb-icccm4-dev \
		libxcb-image0-dev \
		libxcb-present-dev \
		libxcb-render-util0-dev \
		libxcb-render0-dev \
		libxcb-res0-dev \
		libxcb-shm0-dev \
		libxcb-sync-dev \
		libxcb-xfixes0-dev \
		libxcb-xinput-dev \
		libxcb1-dev \
		libxcomposite-dev \
		libxcursor-dev \
		libxdamage-dev \
		libxext-dev \
		libxfixes-dev \
		libxi-dev \
		libxkbcommon-dev \
		libxkbregistry-dev \
		libxmu-dev \
		libxrandr-dev \
		libxrender-dev \
		libxres-dev \
		libxshmfence-dev \
		libxslt1-dev \
		libxtst-dev \
		libxxf86vm-dev \
		libyaml-0-2 \
		libz3-dev \
		lld-22 \
		llvm-22 \
		llvm-22-dev \
		llvm-22-tools \
		meson \
		ninja-build \
		ocl-icd-opencl-dev \
		pkg-config \
		python3-mako \
		python3-markupsafe \
		python3-ply \
		python3-pygments \
		python3-yaml \
		quilt \
		rustc \
		rustfmt \
		samba-dev \
		spirv-headers \
		sudo \
		valgrind \
		vkroots-headers \
		wayland-protocols \
		wget \
		xwayland \
		xz-utils \
		zstd \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/archives/*

# Установка bindgen версии 0.72.1 для совместимости с LLVM 22
RUN cargo install bindgen-cli --version '=0.72.1' --locked

RUN cd /tmp \
	&& rm -rf SPIRV-LLVM-Translator-22.1.7 \
	&& wget https://github.com/KhronosGroup/SPIRV-LLVM-Translator/archive/refs/tags/v22.1.7.tar.gz \
	&& tar -xzf v22.1.7.tar.gz \
	&& cd SPIRV-LLVM-Translator-22.1.7 \
	&& mkdir build && cd build \
	&& cmake -DCMAKE_BUILD_TYPE=Release \
			-DBUILD_SHARED_LIBS=ON \
			-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
			-DLLVM_DIR=/usr/lib/llvm-22/lib/cmake/llvm \
			-DCMAKE_INSTALL_PREFIX=/usr \
			.. \
	&& make -j$(nproc) \
	&& make install \
	&& ldconfig \
	&& cd / \
	&& rm -rf /tmp/SPIRV-LLVM-Translator-22.1.7 \
	&& rm -f /tmp/v22.1.7.tar.gz

RUN useradd -u 1000 -m dev \
	&& mkdir -p /etc/sudoers.d \
	&& echo "ALL ALL = (ALL) NOPASSWD: /usr/bin/apt, /usr/bin/apt-get" > /etc/sudoers.d/apt \
	&& echo "ALL ALL = (ALL) NOPASSWD: /usr/bin/dpkg" > /etc/sudoers.d/dpkg \
	&& visudo -cf /etc/sudoers.d/apt \
	&& visudo -cf /etc/sudoers.d/dpkg \
	&& for f in apt dpkg; do \
		chmod 0440 "/etc/sudoers.d/$f"; \
		chown root:root "/etc/sudoers.d/$f"; \
	done

# docker build --force-rm --no-cache --tag nafigat0r/devuan:6-dev ./
# ./annotate.sh devuan 6-dev 'Devuan 6 image for Argon Forge builids'
