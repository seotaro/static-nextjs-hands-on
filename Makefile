
PROJECT_ID := 
HOSTING_BUCKET := static-nextjs-hands-on
HOSTING_BUCKET_LOCATION := ASIA-NORTHEAST1


init:
	gsutil mb -p $(PROJECT_ID) -l $(HOSTING_BUCKET_LOCATION) -c STANDARD -b off  gs://$(HOSTING_BUCKET)
	gsutil iam ch allUsers:objectViewer gs://$(HOSTING_BUCKET)
	gsutil web set -m index.html -e 404.html gs://$(HOSTING_BUCKET)


deploy:
	gsutil -m \
		-h "Cache-Control:public,no-cache,max-age=0" \
		cp -r out/* gs://$(HOSTING_BUCKET)
