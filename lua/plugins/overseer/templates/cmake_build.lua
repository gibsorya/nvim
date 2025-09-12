return {
    name = "CMake Build",
    builder = function()
        local cmake = require("cmake-tools")
        cmake.run_build()
    end,
    condition = {
        kind = "build",
        filetype = "cmake, cpp, c, h, hpp",
    },
    on_finish = function(task)
        require("notify")("CMake build finished")
    end,
}