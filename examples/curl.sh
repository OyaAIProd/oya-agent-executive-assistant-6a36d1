#!/bin/bash
# Chat with Executive Assistant via cURL
# Replace a2a_your_key_here with your actual API key from http://localhost:3000/api-keys

# First message — starts a new thread
curl -X POST http://localhost:3000/api/v1/chat/completions \
  -H "Authorization: Bearer a2a_your_key_here" \
  -H "Content-Type: application/json" \
  -d '{"model":"gemini/gemini-2.0-flash","messages":[{"role":"user","content":"Hello"}]}'

# Continue a conversation using thread_id from the first response:
curl -X POST http://localhost:3000/api/v1/chat/completions \
  -H "Authorization: Bearer a2a_your_key_here" \
  -H "Content-Type: application/json" \
  -d '{"model":"gemini/gemini-2.0-flash","messages":[{"role":"user","content":"Follow up question"}],"thread_id":"thread_id_from_previous_response"}'
