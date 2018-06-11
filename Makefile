TAGS ?= "sqlite vbuffalo"
INSTALL ?= install -v -tags ${TAGS} ./...

GO_BIN ?= go
GO_GET ?= $(GO_BIN) get -tags "sqlite vbuffalo" -v -t github.com/gobuffalo/buffalo/...

ifeq ("$(GO_BIN)","vgo")
	GO_GET = vgo version
endif

deps:
	$(GO_BIN) install -v github.com/gobuffalo/packr/packr

install: deps
	packr
	$(GO_GET)
	$(GO_BIN) $(INSTALL)
	packr clean

test: deps
	$(GO_BIN) test -tags ${TAGS} ./...