# This file is part of MXE.
# See index.html for further information.

PKG             := qtdeclarative
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 2768fab8f3d81cfb67e101e94194cb4f90d4efa4
$(PKG)_SUBDIR    = $(subst qtbase,qtdeclarative,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qtdeclarative,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qtdeclarative,$(qtbase_URL))
$(PKG)_DEPS     := gcc qtbase qtsvg qtxmlpatterns

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
