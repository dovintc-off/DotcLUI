local python = {}

    function python.new(style_file)
        os.execute("DotcLUI\\utils\\python\\run_python.bat " .. style_file)
    end

return python