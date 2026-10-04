FROM lpenz/devuan-daedalus-i386

RUN    echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" > /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-security main contrib" >> /etc/apt/sources.list \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt full-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		bindgen \
		bison \
		build-essential \
		cbindgen \
		ccache \
		clang-19 \
		cmake \
		debhelper \
		devscripts \
		dpkg-dev \
		equivs \
		fakeroot \
		flex \
		glslang-tools \
		libaudit-dev \
		libc6-dev \
		libclang-19-dev \
		libclang-cpp19-dev \
		libclc-19 \
		libclc-19-dev \
		libdbus-1-dev \
		libdrm-dev \
		libegl1-mesa-dev \
		libelf-dev \
		libexpat1-dev \
		libgbm-dev \
		libgcrypt20-dev \
		libgles2-mesa-dev \
		libglvnd-core-dev \
		libglvnd-dev \
		libglx-mesa0 \
		libllvm19 \
		libllvmspirvlib-19-dev \
		liblzma-dev \
		libpciaccess-dev \
		librust-paste-dev \
		librust-syn-dev \
		libsensors-dev \
		libsystemd-dev \
		libudev-dev \
		libunwind-dev \
		libva-dev \
		libvdpau-dev \
		libvulkan-dev \
		libwayland-dev \
		libwayland-egl-backend-dev \
		libx11-dev \
		libx11-xcb-dev \
		libxcb-dri2-0-dev \
		libxcb-dri3-dev \
		libxcb-glx0-dev \
		libxcb-present-dev \
		libxcb-randr0-dev \
		libxcb-shm0-dev \
		libxcb-sync-dev \
		libxcb-xfixes0-dev \
		libxdamage-dev \
		libxext-dev \
		libxfixes-dev \
		libxrandr-dev \
		libxshmfence-dev \
		libxxf86vm-dev \
		libzstd-dev \
		linux-libc-dev \
		lld-19 \
		llvm-19 \
		llvm-19-dev \
		llvm-19-tools \
		llvm-spirv-19 \
		meson \
		ninja-build \
		pkg-config \
		pkgconf \
		python3 \
		python3-mako \
		python3-packaging \
		python3-pip \
		python3-ply \
		python3-requests \
		python3-setuptools \
		python3-wheel \
		python3-yaml \
		quilt \
		rustc \
		rustfmt \
		spirv-headers \
		spirv-tools \
		valgrind \
		wayland-protocols \
		x11proto-dev \
		zlib1g-dev

# docker build --force-rm --no-cache --tag nafigat0r/devuan:6-dev-i386 ./
# ./annotate.sh devuan 6-dev 'Devuan 6 image for Argon Forge i386 builids'
