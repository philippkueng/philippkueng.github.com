clean:
	bb quickblog clean

render:
	bb quickblog render
	cp robots.txt public/

watch:
	bb quickblog watch --port 8080
