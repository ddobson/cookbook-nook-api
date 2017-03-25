API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/cookbooks/${ID}/recipes"
curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
    "recipe": {
      "name": "'"${NAME}"'",
      "start_page": "'"${START}"'",
      "end_page": "'"${END}"'"
    }
  }'

echo
