# Compiler settings
CC = clang

# Get SDK path
SDKROOT = $(shell xcrun --show-sdk-path)

# Binary name
TARGET = debounce

# Source files
SRC = debounce.m

# Default target
all: $(TARGET)

# Compile the binary
$(TARGET): $(SRC)
	$(CC) -isysroot $(SDKROOT) $< -fobjc-arc \
		-F$(SDKROOT)/System/Library/Frameworks \
		-framework Cocoa -framework Foundation \
		-L$(SDKROOT)/usr/lib -lobjc -o $@

# Install target
.PHONY: install
install: $(TARGET)
	cp $(TARGET) /usr/local/bin/

# Clean target
.PHONY: clean
clean:
	rm -f $(TARGET)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     : Build the debounce binary (default)"
	@echo "  install : Install debounce to /usr/local/bin/"
	@echo "  clean   : Remove built binary"
	@echo "  help    : Show this help message"