# Makefile minimal pour OS_USER_2

CC         := gcc
CFLAGS     := -Wall -O2
SRC_DIR    := src

# SDL2 via sdl2-config (Homebrew, apt, etc.)
SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_LDFLAGS:= $(shell sdl2-config --libs)
IMGFLAGS   := -lSDL2_image -lSDL2_ttf
THREADS    := -pthread

SERVER     := server
CLIENT     := client

.PHONY: all clean

all: $(SERVER) $(CLIENT)

$(SERVER):
	$(CC) $(CFLAGS) $(SRC_DIR)/server.c -o $(SERVER) $(THREADS)

$(CLIENT):
	$(CC) $(CFLAGS) $(SRC_DIR)/sh13.c -o $(CLIENT) \
	  $(SDL_CFLAGS) $(SDL_LDFLAGS) $(IMGFLAGS) $(THREADS)

clean:
	rm -f $(SERVER) $(CLIENT)
