import json
from utils_for_python import *
change_output()
text, output_path = get_data()
x = True

if not x:
    with open("text.txt", "w", encoding="utf-8") as f:
        f.write(str(parser(text)))

if x:
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(parser(text), f, ensure_ascii=False, indent=4)
    
print("\nalright okey")