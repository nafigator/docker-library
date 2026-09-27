FROM devuan/devuan:excalibur-2026-09-18

RUN    echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" > /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur main contrib" >> /etc/apt/sources.list \
	&& echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
	&& echo "deb-src http://mirror.yandex.ru/mirrors/devuan/merged excalibur-updates main contrib" >> /etc/apt/sources.list \
    && echo "deb     http://mirror.yandex.ru/mirrors/devuan/merged excalibur-security main contrib" >> /etc/apt/sources.list \
    && dpkg --add-architecture i386 \
	&& apt update \
	&& DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
		build-essential devscripts equivs ca-certificates zstd \
    	gcc-multilib g++-multilib \
		clang lld llvm \
		ccache flex bison pkg-config \
		libc6-dev-i386 \
		libx11-dev libx11-dev:i386 \
		libxext-dev libxext-dev:i386 \
		libxrender-dev libxrender-dev:i386 \
		libxrandr-dev libxrandr-dev:i386 \
		libxi-dev libxi-dev:i386 \
		libxcursor-dev libxcursor-dev:i386 \
		libxfixes-dev libxfixes-dev:i386 \
		libxcomposite-dev libxcomposite-dev:i386 \
		libfreetype-dev libfreetype-dev:i386 \
		libfontconfig-dev libfontconfig-dev:i386 \
		libgnutls28-dev libgnutls28-dev:i386 \
		libasound2-dev libasound2-dev:i386 \
		libpulse-dev libpulse-dev:i386 \
		libdbus-1-dev libdbus-1-dev:i386 \
		libunwind-dev libunwind-dev:i386 \
		libgl-dev libgl-dev:i386 \
		libvulkan-dev libvulkan-dev:i386 \
		libsdl2-dev libsdl2-dev:i386 \
		libudev-dev libudev-dev:i386 \
		libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev \
		libosmesa6-dev libosmesa6-dev:i386 \
		libcups2-dev libcups2-dev:i386 \
		libkrb5-dev libkrb5-dev:i386 \
		samba-dev ocl-icd-opencl-dev \
		libpcap-dev libusb-1.0-0-dev libv4l-dev \
		libxml2-dev libxslt1-dev \
		libjpeg-dev libpng-dev libtiff-dev \
		libmpg123-dev liblcms2-dev \
		libfaudio-dev libfaudio-dev:i386 \
		libvkd3d-dev libvkd3d-dev:i386 \
		libwayland-dev wayland-protocols libxkbregistry-dev \
		wget xz-utils git \
		cmake meson ninja-build \
		dpkg-dev debhelper fakeroot quilt \
		glslang-tools hwdata \
		catch2 \
		libpipewire-0.3-dev \
		libx11-xcb-dev libxdamage-dev \
		libxxf86vm-dev libxtst-dev libxres-dev libxmu-dev \
		libxkbcommon-dev libcap-dev libavif-dev libpixman-1-dev \
		libseat-dev libinput-dev xwayland \
		libxcb-composite0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-res0-dev \
		libdrm-dev libdisplay-info-dev libliftoff-dev libluajit-5.1-dev \
		libbenchmark-dev libglm-dev libstb-dev \
		libwlroots-0.18-dev spirv-headers vkroots-headers \
		libxcb-dri3-dev libxcb-errors-dev libxcb-image0-dev libxcb-present-dev \
		libxcb-render-util0-dev libxcb-render0-dev libxcb-shm0-dev \
		libxcb-sync-dev libxcb-xfixes0-dev libxcb-xinput-dev libxcb1-dev \
		libeis-dev

# docker build --force-rm --no-cache --tag nafigat0r/devuan:6-dev ./
# ./annotate.sh devuan 6-dev 'Devuan 6 image for argon builids'
