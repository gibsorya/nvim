return {
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local osys = require("cmake-tools.osys")
			require("cmake-tools").setup({
				cmake_command = "cmake", -- this is used to specify cmake command path
				ctest_command = "ctest", -- this is used to specify ctest command path
				cmake_use_preset = true,
				cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
				cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
				cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
				cmake_build_directory = function()
					if osys.iswin32 then
						return "build\\${variant:buildType}"
					end
					return "build/${variant:buildType}"
				end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
				cmake_compile_commands_options = {
					action = "soft_link", -- available options: soft_link, copy, lsp, none
					-- soft_link: this will automatically make a soft link from compile commands file to target
					-- copy:      this will automatically copy compile commands file to target
					-- lsp:       this will automatically set compile commands file location using lsp
					-- none:      this will make this option ignored
					target = vim.loop.cwd(), -- path to directory, this is used only if action == "soft_link" or action == "copy"
				},
				cmake_variants_message = {
					short = { show = true }, -- whether to show short message
					long = { show = true, max_length = 40 }, -- whether to show long message
				},
				cmake_notifications = {
					runner = { enabled = true },
					executor = { enabled = true },
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
					refresh_rate_ms = 100, -- how often to iterate icons
				},
				cmake_virtual_text_support = true, -- Show the target related to current file using virtual text (at right corner)
				cmake_use_scratch_buffer = false, -- A buffer that shows what cmake-tools has done
				cmake_executor = { -- executor to use
					name = "quickfix", -- name of the executor
					opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for executors
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "belowright", -- "bottom", "top"
							size = 10,
							auto_close_when_success = true, -- typically, you can use it with the true option; it will auto-close the quickfix buffer if the execution is successful.
						},
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom,
							on_close = function(t)
								t:close()
							end,
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"toggleterm",
									direction = "horizontal",
									autos_croll = true,
									quit_on_exit = "success",
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(_) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Main Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 10,

							-- Window handling
							single_terminal_per_instance = true, -- Single instance, multiple windows
							single_terminal_per_tab = true, -- Single instance per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable

							-- Running Tasks
							start_insert = false, -- If you want to enter terminal with :startinsert
							focus = false, -- Focus on cmake terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						}, -- terminal executor uses the values in cmake_terminal
					},
				},
				cmake_runner = { -- runner to use
					name = "toggleterm", -- name of the runner
					opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
					default_opts = { -- a list of default and possible values for runners
						quickfix = {
							show = "always", -- "always", "only_on_error"
							position = "belowright", -- "bottom", "top"
							size = 10,
							encoding = "utf-8",
							auto_close_when_success = false, -- typically, you can use it with the true option; it will auto-close the quickfix buffer if the execution is successful.
						},
						toggleterm = {
							direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
							close_on_exit = false, -- whether close the terminal when exit
							auto_scroll = true, -- whether auto scroll to the bottom
							kill_on_exit = true,
						},
						overseer = {
							new_task_opts = {
								strategy = {
									"terminal",
									direction = "horizontal",
									auto_scroll = true,
								},
							}, -- options to pass into the `overseer.new_task` command
							on_new_task = function(_) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
						},
						terminal = {
							name = "Runner Terminal",
							prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
							split_direction = "horizontal", -- "horizontal", "vertical"
							split_size = 10,

							-- Window handling
							single_terminal_per_instance = true, -- Single instance, multiple windows
							single_terminal_per_tab = true, -- Single instance per tab
							keep_terminal_static_location = true, -- Static location of the viewport if avialable

							-- Running Tasks
							start_insert = true, -- If you want to enter terminal with :startinsert
							focus = true, -- Focus on cmake terminal when cmake task is launched.
							do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
						},
					},
				},
				cmake_notifications = {
					runner = { enabled = false },
				}
			})
		end,
	},
	{

		"stevearc/overseer.nvim",
		opts = {},
		config = function()
			require("overseer").setup()
		end,
	},
}
