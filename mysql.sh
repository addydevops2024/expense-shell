source common.sh

if [ $# -ne 1 ]; then
  echo "Input missing for the password"
exit 1
fi

dnf install mysql-server -y &>> /tmp/roboshop.log
stat $?
systemctl enable mysqld &>> /tmp/roboshop.log

stat $?
systemctl start mysqld &>> /tmp/roboshop.log

stat $?
mysql_secure_installation --set-root-pass $1