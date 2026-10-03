FROM devuan/devuan:excalibur-2026-09-18

RUN    echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" > /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-security main contrib" >> /etc/apt/sources.list \
	&& dpkg --add-architecture i386 \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		bindgen bindgen:i386 \
		bison \
		build-essential \
		ca-certificates \
		catch2 \
		cbindgen cbindgen:i386 \
		ccache \
		clang \
		cmake \
		debhelper \
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
		libasound2-dev libasound2-dev:i386 \
		libavif-dev \
		libbenchmark-dev \
		libc6-dbg \
		libc6-dev-i386 \
		libcap-dev \
		libclang-19-dev libclang-19-dev:i386 \
		libclang-cpp19-dev libclang-cpp19-dev:i386 \
		libclang-dev \
		libclc-19:i386 \
		libclc-19-dev libclc-19-dev:i386 \
		libcups2-dev libcups2-dev:i386 \
		libdbus-1-dev libdbus-1-dev:i386 \
		libdisplay-info-dev \
		libdrm-dev libdrm-dev:i386 \
		libeis-dev \
		libelf-dev:i386 \
		libexpat1-dev:i386 \
		libfaudio-dev libfaudio-dev:i386 \
		libfontconfig-dev libfontconfig-dev:i386 \
		libfreetype-dev libfreetype-dev:i386 \
		libgl-dev libgl-dev:i386 \
		libglm-dev \
		libglvnd-core-dev:i386 \
		libgnutls28-dev libgnutls28-dev:i386 \
		libgstreamer-plugins-base1.0-dev \
		libgstreamer1.0-dev \
		libinput-dev \
		libjpeg-dev \
		libkrb5-dev libkrb5-dev:i386 \
		liblcms2-dev \
		libliftoff-dev \
		libllvmspirvlib-19-dev libllvmspirvlib-19-dev:i386 \
		libllvmspirvlib19.1 \
		libluajit-5.1-dev \
		libmpg123-dev \
		libncurses-dev \
		libncurses6 \
		libosmesa6-dev libosmesa6-dev:i386 \
		libpcap-dev \
		libpipewire-0.3-dev \
		libpixman-1-dev \
		libpng-dev \
		libpulse-dev libpulse-dev:i386 \
		librust-paste-dev librust-paste-dev:i386 \
		librust-proc-macro2-dev \
		librust-quote-dev \
		librust-syn-dev librust-syn-dev:i386 \
		librust-unicode-ident-dev \
		libsdl2-dev libsdl2-dev:i386 \
		libseat-dev \
		libsensors-dev libsensors-dev:i386 \
		libset-scalar-perl \
		libstb-dev \
		libstd-rust-1.85 \
		libstd-rust-dev \
		libtiff-dev \
		libudev-dev libudev-dev:i386 \
		libunwind-dev libunwind-dev:i386 \
		libusb-1.0-0-dev \
		libv4l-dev \
		libva-dev libva-dev:i386 \
		libva-drm2 \
		libva-glx2 \
		libva-wayland2 \
		libva-x11-2 \
		libva2 \
		libvdpau-dev libvdpau-dev:i386 \
		libvdpau1 \
		libvkd3d-dev libvkd3d-dev:i386 \
		libvulkan-dev libvulkan-dev:i386 \
		libwayland-dev libwayland-dev:i386 \
		libwayland-egl-backend-dev libwayland-egl-backend-dev:i386 \
		libwlroots-0.18-dev \
		libx11-dev libx11-dev:i386 \
		libx11-xcb-dev libx11-xcb-dev:i386 \
		libxcb-composite0-dev \
		libxcb-dri2-0 \
		libxcb-dri2-0-dev libxcb-dri2-0-dev:i386 \
		libxcb-dri3-dev libxcb-dri3-dev:i386 \
		libxcb-errors-dev \
		libxcb-ewmh-dev \
		libxcb-glx0-dev libxcb-glx0-dev:i386 \
		libxcb-icccm4-dev \
		libxcb-image0-dev \
		libxcb-present-dev libxcb-present-dev:i386 \
		libxcb-randr0-dev:i386 \
		libxcb-render-util0-dev \
		libxcb-render0-dev \
		libxcb-res0-dev \
		libxcb-shm0-dev libxcb-shm0-dev:i386 \
		libxcb-sync-dev libxcb-sync-dev:i386 \
		libxcb-xfixes0-dev libxcb-xfixes0-dev:i386 \
		libxcb-xinput-dev \
		libxcb1-dev \
		libxcomposite-dev libxcomposite-dev:i386 \
		libxcursor-dev libxcursor-dev:i386 \
		libxdamage-dev \
		libxext-dev libxext-dev:i386 \
		libxfixes-dev libxfixes-dev:i386 \
		libxi-dev libxi-dev:i386 \
		libxkbcommon-dev \
		libxkbregistry-dev \
		libxmu-dev \
		libxrandr-dev libxrandr-dev:i386 \
		libxrender-dev libxrender-dev:i386 \
		libxres-dev \
		libxshmfence-dev libxshmfence-dev:i386 \
		libxslt1-dev \
		libxtst-dev \
		libxxf86vm-dev libxxf86vm-dev:i386 \
		libyaml-0-2 \
		libz3-dev \
		libzstd-dev:i386 \
		lld \
		llvm \
		llvm-19-dev llvm-19-dev:i386 \
		llvm-19-tools \
		llvm-spirv-19 llvm-spirv-19:i386 \
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
		rustc rustc:i386 \
		rustfmt rustfmt:i386 \
		samba-dev \
		spirv-headers \
		valgrind valgrind:i386 \
		vkroots-headers \
		wayland-protocols \
		wget \
		xwayland \
		xz-utils \
		zlib1g-dev:i386 \
		zstd

# docker build --force-rm --no-cache --tag nafigat0r/devuan:6-dev ./
# ./annotate.sh devuan 6-dev 'Devuan 6 image for argon builids'
