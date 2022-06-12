exec = nightskylang.out
sources = $(wildcard src/*.c)
objects = $(sources:.c=.o)
flags = -g

$(exec): $(objects)
	gcc $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	gcc -c $(flags) $< -o $@

install:
	make
	cp ./nightskylang.out /usr/local/bin/nightskylang 

clean:
	-rm *.out
	-rm *.o
	-rm src/*.o
