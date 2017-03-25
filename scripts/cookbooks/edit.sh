API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/cookbooks/${ID}"
curl "${API}${URL_PATH}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
#  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "cookbook": {
      "title": "'"${TITLE}"'",
      "start_page": "'"${START}"'",
      "end_page": "'"${END}"'",
    }
  }'

echo
