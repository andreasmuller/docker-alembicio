build:
	docker build -t alembicio .

run:
	docker run -i -p 9090:9090 -v /Users/shyal/dev/alembicio/src/:/src/ -t alembicio 

test:
	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/abcecho

	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/abctree

	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/pyalembic
