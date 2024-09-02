if [ $# -ne 1 ]; then
  echo "Input missing for the password"
exit 1
fi

dnf install mysql-server -y &>> /tmp/roboshop.log
if [ $? -eq 0 ]; then

  echo "mysql server installed successfully"
  else
    echo "mysql server installation failed"
    exit 2

fi
systemctl enable mysqld &>> /tmp/roboshop.log

if [ $? -eq 0 ]; then

  echo "mysql server enabled successfully"
  else
    echo "mysql server enable failed"
    exit 2

fi
systemctl start mysqld &>> /tmp/roboshop.log

if [ $? -eq 0 ]; then

  echo "mysql server started successfully"
  else
    echo "mysql server start failed"
    exit 2

fi
mysql_secure_installation --set-root-pass $1