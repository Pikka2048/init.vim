return {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  config = function()
    require("gen").setup({
      model = "qwen2.5-coder", -- The default model to use.
        quit_map = "q", -- set keymap to close the response window
        retry_map = "<c-r>", -- set keymap to re-send the current prompt
        accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
        host = "localhost", -- The host running the Ollama service.
        port = "11434", -- The port on which the Ollama service is listening.
        display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
        show_prompt = false, -- Shows the prompt submitted to Ollama. Can be true (3 lines) or "full".
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        file = false, -- Write the payload to a temporary file to keep the command short.
        hidden = false, -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
        init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
        -- Function to initialize Ollama
        command = function(options)
            local body = {model = options.model, stream = true}
            return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a command string.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        -- list_models = '<omitted lua function>', -- Retrieves a list of model names
        result_filetype = "markdown", -- Configure filetype of the result buffer
        debug = false -- Prints errors and the command which is run.
   })
    require("gen").prompts["Summarize"] = {
      prompt = "以下を要約してください:\n$text",
      replace = true,
    }
    require("gen").prompts["Ask"] = { prompt = "以下の文章について、$input:\n$text" }
    require("gen").prompts["Make_List"] = {
      prompt = "文章をマークダウンリストに変換してください:\n$text",
      replace = true,
    }
    require("gen").prompts["Make_Table"] = {
      prompt = "文章をマークダウンテーブルに変換してください:\n$text",
      replace = true,
    }
    require("gen").prompts["Review_Code"] = {
      prompt = "以下のコードをレビューし、簡潔な提案を行ってください:\n```$filetype\n$text\n```",
    }
    require("gen").prompts["Enhance_Code"] = {
      prompt = "以下のコードを改良し、結果は```$filetype\n...\n```という形式で出力してください:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }
    require("gen").prompts["Change_Code"] = {
      prompt = "以下のコードについて、$input、結果は```$filetype\n...\n```という形式で出力してください:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```",
    }
  end,
}

