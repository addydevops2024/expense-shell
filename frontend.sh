echo installing nginx and adding the expense.conf file along with start and enabling the nginx
dnf install nginx -y && cp expense.conf /etc/nginx/default.d/expense.conf && systemctl start nginx && systemctl enable nginx

echo removing the original nginx content
rm -rf /usr/share/nginx/html/*

echo downloading the frontend
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
cd /usr/share/nginx/html

echo unzipping
unzip /tmp/frontend.zip

echo restarting nginx
systemctl restart nginx


echo -e "\e[32mFrontend installed successfully\e[0m"