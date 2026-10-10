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
		debhelper-compat \
		devscripts \
		dpkg-dev \
		equivs \
		fakeroot \
		flex \
		git \
		glslang-tools \
		hwdata \
		libaudit-dev \
		libavif-dev \
		libbenchmark-dev \
		libc6-dev \
		libcap-dev \
		libcatch2-dev \
		libclang-19-dev \
		libclang-cpp19-dev \
		libclc-19 \
		libclc-19-dev \
		libdbus-1-dev \
		libdisplay-info-dev \
		libdrm-dev \
		libegl1-mesa-dev \
		libeis-dev \
		libelf-dev \
		libexpat1-dev \
		libgbm-dev \
		libgcrypt20-dev \
		libgles2-mesa-dev \
		libglm-dev \
		libglvnd-core-dev \
		libglvnd-dev \
		libglx-mesa0 \
		libinput-dev \
		libliftoff-dev \
		libllvm19 \
		libllvmspirvlib-19-dev \
		libluajit-5.1-dev \
		liblzma-dev \
		libpciaccess-dev \
		libpipewire-0.3-dev \
		libpixman-1-dev \
		libpng-dev \
		libpugixml-dev \
		librust-paste-dev \
		librust-syn-dev \
		libsdl2-dev \
		libseat-dev \
		libsensors-dev \
		libstb-dev \
		libsystemd-dev \
		libudev-dev \
		libunwind-dev \
		libva-dev \
		libvdpau-dev \
		libvulkan-dev \
		libwayland-dev \
		libwayland-egl-backend-dev \
		libwlroots-0.18-dev \
		libx11-dev \
		libx11-xcb-dev \
		libxcb-composite0-dev \
		libxcb-dri2-0-dev \
		libxcb-dri3-dev \
		libxcb-errors-dev \
		libxcb-ewmh-dev \
		libxcb-glx0-dev \
		libxcb-icccm4-dev \
		libxcb-image0-dev \
		libxcb-present-dev \
		libxcb-randr0-dev \
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
		libxkbcommon-dev \
		libxmu-dev \
		libxrandr-dev \
		libxrender-dev \
		libxres-dev \
		libxshmfence-dev \
		libxtst-dev \
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
		sudo \
		valgrind \
		vkroots-headers \
		wayland-protocols \
		wget \
		x11proto-dev \
		xwayland \
		zlib1g-dev

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

# docker build --force-rm --no-cache --tag nafigat0r/devuan:6-dev-i386 ./
# ./annotate.sh devuan 6-dev-i386 'Devuan 6 image for Argon Forge i386 builids'
