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

def parser(text: str) -> dict:
    text = text.replace("\n", "").replace(" ", "").strip()
    if not text or text == "{}":
        return {}

    if text.startswith('{') and text.endswith('}'):
        text = text[1:-1]

    blocks = text.split('},{')
    result = {}

    for block in blocks:
        if ':' not in block:
            continue

        block_name, props_part = block.split(':', 1)
        props = {}

        if props_part:
            for prop in props_part.split(','):
                if not prop:
                    continue

                if prop.endswith(')') and '(' in prop:
                    try:
                        paren_idx = prop.rindex('(')
                        prefix = prop[:paren_idx]
                        numbers_str = prop[paren_idx+1:-1]

                        if '-' in prefix:
                            key, mode = prefix.rsplit('-', 1)
                        else:
                            key, mode = "color", prefix  # fallback

                        numbers = []
                        for x in numbers_str.split('.'):
                            if '.' in x:
                                numbers.append(float(x))
                            else:
                                try:
                                    numbers.append(int(x))
                                except ValueError:
                                    numbers.append(x)

                        props[key] = [mode, numbers]

                    except Exception:
                        props[prop] = prop
                else:
                    if '-' in prop:
                        key, val = prop.split('-', 1)
                        if val == "true":
                            props[key] = True
                        elif val == "false":
                            props[key] = False
                        elif val.replace('.', '', 1).replace('-', '', 1).isdigit():
                            props[key] = float(val) if '.' in val else int(val)
                        else:
                            props[key] = val
                    else:
                        props[prop] = True

        result[block_name] = props

    return result