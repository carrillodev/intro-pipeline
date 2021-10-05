#!/bin/sh
# A simple script with a function


add_user() {
  USER=$1
  PASSWORD=$2
  shift; shift;
  #Having shifted twice, the rest is now comments...
  COMMENTS=$@
  echo "Adding user $USER ..."
  echo useradd -c "$COMMENTS" $USER
  echo password $USER $PASSWORD
  ECHO "Added user $USER ($COMMENTS) with pass $PASSWORD
}

###
# cuerpo principal del script comienza aqui
echo "Starting script ..."
add_user bob sanchez Bob el constructor
add_user felipe badpassword Felipe Carrillo
add_user pedro bestpassword Pedro Carmona
echo "el final de nuestro script ..."
echo "GL HF"
