build:
	docker build -t alembicio .

run_reload:
	docker run -i -p 9090:9090 -v /Users/shyal/dev/alembicio/src/:/src/ -t alembicio 

run:
	docker run -i -p 9090:9090 -t alembicio 

test:

	echo "####### ABCECHO #######"

	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/abcecho

	echo "####### ABCTREE #######"

	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/abctree

	echo "####### PYALEMBIC #######"

	curl \
	--data-binary "@test_data/rocket.abc" \
	http://localhost:9090/pyalembic
