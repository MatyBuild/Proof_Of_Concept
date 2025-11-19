FROM httpd:2.4-alpine

# Zkopíruj HTML soubor do adresáře Apache
COPY index.html /usr/local/apache2/htdocs/

# Exponuj port 80
EXPOSE 80
