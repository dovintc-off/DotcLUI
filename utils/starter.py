import os
import json

script_dir = os.path.dirname(os.path.abspath(__file__))
style_dir = os.path.join(script_dir, "..", "style")
style_file = os.path.join(style_dir, "style.json")

os.makedirs(style_dir, exist_ok=True)

data = {
    "message": "HELLO"
}

with open(style_file, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=4)

print(f"Файл сохранён: {style_file}")