from utils_for_python import *
change_output()
text, output_path = get_data()

with open(output_path, "w", encoding="utf-8") as f:
    f.write(text)
    
print("alright okey")