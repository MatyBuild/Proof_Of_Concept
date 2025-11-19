FROM nginx:alpine

# Zkopíruj HTML soubor do adresáře Nginx
COPY index.html /usr/share/nginx/html/

# Exponuj port 80
EXPOSE 80

# Nginx se spustí automaticky
CMD ["nginx", "-g", "daemon off;"]
