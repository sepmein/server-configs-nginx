server {
  # don't forget to tell on which port this server listens
  listen 80;

  # listen on the www host
  server_name www.gtimi.com;

  # and redirect to the non-www host (declared below)
  return 301 $scheme://gtimi.com$request_uri;

  # Path for static files
  root /var/www/gtimi/public;

  #Specify a charset
  charset utf-8;

  # Custom 404 page
  error_page 404 /404.html;

  # Include the basic h5bp config set
  include h5bp/basic.conf;
}
