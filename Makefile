docker-image:
	docker build -t iris-writeback-api .

docker-run:
	docker run -d --name iris-writeback-api -e PORT=3010 -e DEV=True -e JENA_PROTOCOL=http -e JENA_URL=127.0.0.1 -e JENA_PORT:3030 -p 3010:3010 iris-writeback-api