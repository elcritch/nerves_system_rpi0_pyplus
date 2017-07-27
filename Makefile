
VERSION := $(shell cat ./VERSION)
GIT_REVISION := $(shell git rev-parse HEAD)

OUTDIR ?= ~/Images

all:
	echo "Compiling version ${VERSION} from git revisioon ${GIT_REVISION}"
	mix deps.get
	mix compile
	cd .nerves/artifacts/nerves_system_rpi0_pyplus-${VERSION}.armv6_rpi_linux_musl/ && \
	make system

copy:
	cp -v .nerves/artifacts/nerves_system_rpi0_pyplus-${VERSION}.armv6_rpi_linux_musl/images/nerves_system_rpi0_pyplus.fw $(OUTDIR)/nerves_system_rpi0_pyplus-v${VERSION}.fw
	cp -v .nerves/artifacts/nerves_system_rpi0_pyplus-${VERSION}.armv6_rpi_linux_musl/nerves_system_rpi0_pyplus.tar.gz $(OUTDIR)/nerves_system_rpi0_pyplus-v${VERSION}.tar.gz
	md5sum $(OUTDIR)/nerves_system_rpi0_pyplus-v${VERSION}.fw $(OUTDIR)/nerves_system_rpi0_pyplus-v${VERSION}.tar.gz

setup:
	mix local.hex
	mix local.rebar
	mix archive.install https://github.com/nerves-project/archives/raw/master/nerves_bootstrap.ez
	mix local.nerves

clean:
	rm -Rf .nerves/artifacts/
	rm -Rf _build

dist-clean: clean
	rm -Rf .nerves/
	rm -Rf _build
