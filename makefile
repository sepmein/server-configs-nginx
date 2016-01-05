# nginx test
PWD = $(shell pwd)
DISTPWD = $(PWD)/dist
test:
	nginx -t -c $(PWD)/nginx.conf 

#copy files to dist
copy:
	mkdir dist
	cp -a nginx.conf ./dist
	cp -a mime.types ./dist
	cp -a sites-available ./dist
	cp -a sites-enabled ./dist
	cp -a h5bp ./dist

ansible:
	ansible-playbook playbook_copyNginxConfigToDigitaloceanAndRestart.yaml

# remove dist folder
clean:
	rm -r dist

release: test copy ansible clean