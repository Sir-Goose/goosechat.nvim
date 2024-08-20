import os
import sys
from groq import Groq

def completion(prompt):
  assert len(prompt) / 4.5 < 8192, "Prompt must be shorter than context length." # needs to be replaced with actual tokeniser
  client = Groq(
    api_key=get_api_key(),
  )
  chat_completion = client.chat.completions.create(
    messages=[
      {
        "role": "user",
        "content": prompt,
      }
    ],
    model="llama3-8b-8192",
)
  return chat_completion.choices[0].message.content

def get_api_key():
  try:
    with open('key.txt', 'r') as file:
      api_key = file.read().strip()
    return api_key
  except FileNotFoundError:
    raise FileNotFoundError("Error: The file key.txt was not found.") from None
  except IOError:
    raise IOError("Error: Unable to read the file key.txt.") from None

if __name__ == "__main__":
    prompt = sys.stdin.read().strip()
    response = completion(prompt)
    print(response)
