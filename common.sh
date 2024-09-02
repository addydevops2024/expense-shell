stat(){

  if [ $? -eq 0 ]; then

    echo "Success"
    else
      echo "failure"
      exit 2

  fi
}