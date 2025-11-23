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

def parser(dli: str) -> dict:
    style = {}
    dli = dli.replace("\n", "&").lstrip()[1:-2]
    block = dli.split("},&{")
    for i in range(len(block)):
        style_etp1 = block[i].split(":", 1)
        if len(style_etp1) < 2:
            continue
        component_name = style_etp1[0]
        style_notspited = style_etp1[1].lstrip("&").rstrip("&").split(",&")
        if component_name not in style:
            style[component_name] = {}
        for prop in style_notspited:
            if '-' in prop:
                key, value = prop.split('-', 1)
                key = key.strip()
                if value.startswith('"') and value.endswith('"'):
                    value = value[1:-1]
                try: value = int(value)
                except ValueError: pass
                if isinstance(value, str) and value.startswith(("rgb", "rgba", "love")):
                    try:
                        args_str = value.split("(", 1)[1].rsplit(")", 1)[0]
                        args = []
                        for x in args_str.split(","):
                            x = x.strip()
                            if '.' in x: args.append(float(x))
                            else: args.append(int(x))
                        value = args
                    except Exception:
                        pass
                style[component_name][key] = value
    return style