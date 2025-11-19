import os, sys

def change_output():
    log_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "python_output.log")
    log_file = open(log_path, "w", encoding="utf-8")
    sys.stdout = log_file
    sys.stderr = log_file
    
def get_data():
    if len(sys.argv) < 2:
        print("[Python in DotcLUI]: specify the path to the input file")
        sys.exit(1)
    input_path = sys.argv[1]
    with open(input_path, "r", encoding="utf-8") as f:
        text = f.read()
    script_dir = os.path.dirname(os.path.abspath(__file__))
    dotcLUI_dir = os.path.dirname(script_dir)
    output_path = os.path.join(dotcLUI_dir, "style", "style.json")
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    return text, output_path