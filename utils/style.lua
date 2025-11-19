local style = {}
    style.ssff = false

    function style.from_file(style_file)
        style.ssff = true
        os.execute("DotcLUI\\utils\\python\\run_python.bat " .. style_file)
    end

    function style.get_ssff()
        return style.ssff
    end

return style