all: avflist

clean:
		rm *.o

avflist: main.o
		$(CC) -Wall -framework Foundation -framework AVFoundation -o $@ $(LDFLAGS) $^

%.o: %.m
		$(CC) -Wall -c -fobjc-arc -o $@ $(OBJCFLAGS) $<
