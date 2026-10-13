FROM devuan/devuan:excalibur-2026-09-18

RUN    echo "deb     http://sledjhamr.org/devuan/merged excalibur main contrib" > /etc/apt/sources.list \
	&& echo "deb-src http://sledjhamr.org/devuan/merged excalibur main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://sledjhamr.org/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://sledjhamr.org/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://sledjhamr.org/devuan/merged excalibur-security main contrib" >> /etc/apt/sources.list \
	&& echo 'Acquire::http::Timeout "60";\nAcquire::ftp::Timeout "60";\nAcquire::Retries "40";' > /etc/apt/apt.conf.d/99timeout \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		bindgen \
		bison \
		build-essential \
		ca-certificates \
		catch2 \
		cbindgen \
		ccache \
		clang \
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
		libc6-dbg \
		libcap-dev \
		libclang-19-dev \
		libclang-cpp19-dev \
		libclang-dev \
		libclc-19 \
		libclc-19-dev \
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
		libllvmspirvlib-19-dev \
		libllvmspirvlib19.1 \
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
		lld \
		llvm \
		llvm-19-dev \
		llvm-19-tools \
		llvm-spirv-19 \
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
