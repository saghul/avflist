all: avflist

clean:
		rm *.o

avflist: main.o
		$(CC) -Wall -framework Foundation -framework AVFoundation -framework CoreMedia -o $@ $(LDFLAGS) $^

%.o: %.m
		$(CC) -Wall -c -fobjc-arc -o $@ $(OBJCFLAGS) $<
