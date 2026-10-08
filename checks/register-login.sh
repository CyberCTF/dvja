#!/bin/sh
# Register a user, then log in as that user: the application writes to and reads from its
# database (the login redirects to home.action).
u="check$$"
curl -s -o /dev/null -d "name=Check" -d "login=$u" -d "email=$u@example.test" \
  -d "password=check-pass" -d "passwordConfirmation=check-pass" http://app:8080/register.action
curl -s -o /dev/null -D - -d "login=$u" -d "password=check-pass" http://app:8080/login.action \
  | grep -qi '^location:.*home'
