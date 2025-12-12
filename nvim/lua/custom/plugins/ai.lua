return {
  {
    'robitx/gp.nvim',
    config = function()
      local conf = {
        openai_api_key = os.getenv 'OPENAI_API_KEY',
        providers = {
          openai = {
            disable = true,
            endpoint = 'https://api.openai.com/v1/chat/completions',
          },
          copilote = {
            endpoint = 'https://api.githubcopilot.com/chat/completions',
            secret = os.getenv 'OPENAI_API_KEY',
          },
        },
        cmd_prefix = 'AI',
        agents = {
          {
            provider = 'copilote',
            name = 'gpt-4.1',
            disable = false,
            chat = true,
            command = true,
            model = { model = 'gpt-4.1' },
            system_prompt = 'You are an experienced senior developer. Do not just agree with plans; briefly reason about them, reveal holes, and when applicable offer alternative solutions.',
          },
        },

        -- Minimal hook declarations using gp templating variables ({{selection}}, {{filename}}, {{filetype}})
        hooks = {
          Explain = function(gp, params)
            local template = table.concat({
              'You are a senior software engineer. Explain the given code (selection if provided, otherwise the whole file).',
              'Respond in Markdown only with:',
              '1) One-line summary.',
              '2) Behavior overview (3-6 bullets).',
              '3) Edge-cases and likely bugs (bulleted).',
              '4) Small actionable improvements (bulleted).',
              '5) Minimal example or usage if relevant.',
              'Constraints: concise, no preamble.',
              '',
              'Context:',
              'Filename: {{filename}}',
              'Filetype: {{filetype}}',
              'Code:\n```{{filetype}}\n{{selection}}\n```',
            }, '\n')

            local agent = gp.get_chat_agent()
            gp.logger.info('Explain using agent: ' .. (agent and agent.name or 'unknown'))
            gp.Prompt(params, gp.Target.popup, agent, template)
          end,

          Implement = function(gp, params)
            local template = table.concat({
              'Implement or complete the provided code. If a selection is provided, return ONLY the code snippet that should replace the selection.',
              'If no selection is provided, return the full file content with implemented changes.',
              'Preserve style/indentation and make minimal changes necessary to implement the requested behavior.',
              '',
              'Context:',
              'Filename: {{filename}}',
              'Filetype: {{filetype}}',
              'Code:\n```{{filetype}}\n{{selection}}\n```',
            }, '\n')

            local agent = gp.get_command_agent()
            gp.logger.info('Implement using agent: ' .. (agent and agent.name or 'unknown'))
            gp.Prompt(params, gp.Target.rewrite, agent, template)
          end,

          Fix = function(gp, params)
            local template = table.concat({
              'Fix the provided code. If diagnostics are available, address them; otherwise, fix obvious bugs and small mistakes.',
              'If a selection is provided, return ONLY the fixed snippet to replace the selection.',
              'If no selection is provided, return the corrected full file content only.',
              'Constraints: minimal changes, preserve style, avoid large refactors.',
              '',
              'Context:',
              'Filename: {{filename}}',
              'Filetype: {{filetype}}',
              'Code:\n```{{filetype}}\n{{selection}}\n```',
            }, '\n')

            local agent = gp.get_command_agent()
            gp.logger.info('Fix using agent: ' .. (agent and agent.name or 'unknown'))
            gp.Prompt(params, gp.Target.rewrite, agent, template)
          end,
        },
      }

      require('gp').setup(conf)

      -- which-key mappings using which-key.add style, keep <leader>A as the prefix
      local ok, wk = pcall(require, 'which-key')
      local prefix = conf.cmd_prefix or 'AI'
      local ai = prefix -- used for command strings, e.g. "<cmd>AIChatNew<cr>"
      -- command helpers
      local function ncmd(cmd)
        return '<cmd>' .. ai .. cmd .. '<cr>'
      end
      local function vcmd(cmd)
        return ":<C-u>'<,'>" .. ai .. cmd .. '<cr>'
      end

      if ok and wk and wk.add then
        -- VISUAL mode mappings (mode v)
        local v = { mode = { 'v' }, nowait = true, remap = false }
        local visual_entries = {
          { '<leader>a<C-t>', vcmd 'ChatNew tabnew', desc = 'ChatNew tabnew' },
          { '<leader>a<C-v>', vcmd 'ChatNew vsplit', desc = 'ChatNew vsplit' },
          { '<leader>a<C-x>', vcmd 'ChatNew split', desc = 'ChatNew split' },
          { '<leader>aa', vcmd 'Append', desc = 'Visual Append (after)' },
          { '<leader>ab', vcmd 'Prepend', desc = 'Visual Prepend (before)' },
          { '<leader>ac', vcmd 'ChatNew', desc = 'Visual Chat New' },
          { '<leader>ag', group = 'generate into new ..' },
          { '<leader>age', vcmd 'Enew', desc = 'Visual GpEnew' },
          { '<leader>agn', vcmd 'New', desc = 'Visual GpNew' },
          { '<leader>agp', vcmd 'Popup', desc = 'Visual Popup' },
          { '<leader>amt', vcmd 'Tabnew', desc = 'Visual GpTabnew' }, -- note: avoid collision with <leader>A t below
          { '<leader>agv', vcmd 'Vnew', desc = 'Visual GpVnew' },
          { '<leader>ai', vcmd 'Implement', desc = 'Implement selection' },
          { '<leader>an', ncmd 'NextAgent', desc = 'Next Agent' },
          { '<leader>al', ncmd 'SelectAgent', desc = 'Select Agent' },
          { '<leader>ap', vcmd 'ChatPaste', desc = 'Visual Chat Paste' },
          { '<leader>ar', vcmd 'Rewrite', desc = 'Visual Rewrite' },
          { '<leader>as', ncmd 'Stop', desc = 'GpStop' },
          { '<leader>at', vcmd 'ChatToggle', desc = 'Visual Toggle Chat' },
          { '<leader>aw', group = 'Whisper' },
          { '<leader>awa', vcmd 'WhisperAppend', desc = 'Whisper Append' },
          { '<leader>awb', vcmd 'WhisperPrepend', desc = 'Whisper Prepend' },
          { '<leader>awe', vcmd 'WhisperEnew', desc = 'Whisper Enew' },
          { '<leader>awn', vcmd 'WhisperNew', desc = 'Whisper New' },
          { '<leader>awp', vcmd 'WhisperPopup', desc = 'Whisper Popup' },
          { '<leader>awr', vcmd 'WhisperRewrite', desc = 'Whisper Rewrite' },
          { '<leader>awt', vcmd 'WhisperTabnew', desc = 'Whisper Tabnew' },
          { '<leader>awv', vcmd 'WhisperVnew', desc = 'Whisper Vnew' },
          { '<leader>aww', vcmd 'Whisper', desc = 'Whisper' },
          { '<leader>ax', vcmd 'Context', desc = 'Visual GpContext' },
        }
        for _, e in ipairs(visual_entries) do
          table.insert(v, e)
        end

        -- NORMAL mode mappings (mode n)
        local n = { mode = { 'n' }, nowait = true, remap = false }
        local normal_entries = {
          { '<leader>a<C-t>', ncmd 'ChatNew tabnew', desc = 'New Chat tabnew' },
          { '<leader>a<C-v>', ncmd 'ChatNew vsplit', desc = 'New Chat vsplit' },
          { '<leader>a<C-x>', ncmd 'ChatNew split', desc = 'New Chat split' },
          { '<leader>aa', ncmd 'Append', desc = 'Append (after)' },
          { '<leader>ab', ncmd 'Prepend', desc = 'Prepend (before)' },
          { '<leader>ac', ncmd 'ChatNew', desc = 'New Chat' },
          { '<leader>af', ncmd 'ChatFinder', desc = 'Chat Finder' },
          { '<leader>ag', group = 'generate into new ..' },
          { '<leader>age', ncmd 'Enew', desc = 'GpEnew' },
          { '<leader>agn', ncmd 'New', desc = 'GpNew' },
          { '<leader>agp', ncmd 'Popup', desc = 'Popup' },
          { '<leader>amt', ncmd 'Tabnew', desc = 'GpTabnew' },
          { '<leader>agv', ncmd 'Vnew', desc = 'GpVnew' },
          { '<leader>an', ncmd 'NextAgent', desc = 'Next Agent' },
          { '<leader>al', ncmd 'SelectAgent', desc = 'Select Agent' },
          { '<leader>ar', ncmd 'Rewrite', desc = 'Inline Rewrite' },
          { '<leader>as', ncmd 'Stop', desc = 'GpStop' },
          { '<leader>at', ncmd 'ChatToggle', desc = 'Toggle Chat' },
          { '<leader>aw', group = 'Whisper' },
          { '<leader>awa', ncmd 'WhisperAppend', desc = 'Whisper Append (after)' },
          { '<leader>awb', ncmd 'WhisperPrepend', desc = 'Whisper Prepend (before)' },
          { '<leader>awe', ncmd 'WhisperEnew', desc = 'Whisper Enew' },
          { '<leader>awn', ncmd 'WhisperNew', desc = 'Whisper New' },
          { '<leader>awp', ncmd 'WhisperPopup', desc = 'Whisper Popup' },
          { '<leader>awr', ncmd 'WhisperRewrite', desc = 'Whisper Inline Rewrite' },
          { '<leader>awt', ncmd 'WhisperTabnew', desc = 'Whisper Tabnew' },
          { '<leader>awv', ncmd 'WhisperVnew', desc = 'Whisper Vnew' },
          { '<leader>aww', ncmd 'Whisper', desc = 'Whisper' },
          { '<leader>ax', ncmd 'Context', desc = 'Toggle GpContext' },
        }
        for _, e in ipairs(normal_entries) do
          table.insert(n, e)
        end

        -- INSERT mode mappings (mode i)
        local i = { mode = { 'i' }, nowait = true, remap = false }
        local insert_entries = {
          { '<leader>a<C-t>', ncmd 'ChatNew tabnew', desc = 'New Chat tabnew' },
          { '<leader>a<C-v>', ncmd 'ChatNew vsplit', desc = 'New Chat vsplit' },
          { '<leader>a<C-x>', ncmd 'ChatNew split', desc = 'New Chat split' },
          { '<leader>aa', ncmd 'Append', desc = 'Append (after)' },
          { '<leader>ab', ncmd 'Prepend', desc = 'Prepend (before)' },
          { '<leader>ac', ncmd 'ChatNew', desc = 'New Chat' },
          { '<leader>af', ncmd 'ChatFinder', desc = 'Chat Finder' },
          { '<leader>ag', group = 'generate into new ..' },
          { '<leader>age', ncmd 'Enew', desc = 'GpEnew' },
          { '<leader>agn', ncmd 'New', desc = 'GpNew' },
          { '<leader>agp', ncmd 'Popup', desc = 'Popup' },
          { '<leader>amt', ncmd 'Tabnew', desc = 'GpTabnew' },
          { '<leader>agv', ncmd 'Vnew', desc = 'GpVnew' },
          { '<leader>an', ncmd 'NextAgent', desc = 'Next Agent' },
          { '<leader>al', ncmd 'SelectAgent', desc = 'Select Agent' },
          { '<leader>ar', ncmd 'Rewrite', desc = 'Inline Rewrite' },
          { '<leader>as', ncmd 'Stop', desc = 'GpStop' },
          { '<leader>at', ncmd 'ChatToggle', desc = 'Toggle Chat' },
          { '<leader>Ax', ncmd 'Context', desc = 'Toggle GpContext' },
        }
        for _, e in ipairs(insert_entries) do
          table.insert(i, e)
        end

        -- register all
        wk.add { v, n, i }
      else
        -- fallback simple mappings: normal + visual + insert prefixes using <leader>A
        local mappings = {
          -- Normal
          { mode = 'n', lhs = '<leader>ae', rhs = '<cmd>' .. prefix .. 'Explain<CR>', desc = 'Explain selection / file' },
          { mode = 'n', lhs = '<leader>ai', rhs = '<cmd>' .. prefix .. 'Implement<CR>', desc = 'Implement selection / file' },
          { mode = 'n', lhs = '<leader>af', rhs = '<cmd>' .. prefix .. 'Fix<CR>', desc = 'Fix selection / file' },
          -- Visual
          { mode = 'v', lhs = '<leader>ae', rhs = ":<C-u>'<,'>" .. prefix .. 'Explain<CR>', desc = 'Explain selection' },
          { mode = 'v', lhs = '<leader>ai', rhs = ":<C-u>'<,'>" .. prefix .. 'Implement<CR>', desc = 'Implement selection' },
          { mode = 'v', lhs = '<leader>af', rhs = ":<C-u>'<,'>" .. prefix .. 'Fix<CR>', desc = 'Fix selection' },
          -- Insert (map to normal commands)
          { mode = 'i', lhs = '<leader>ae', rhs = '<cmd>' .. prefix .. 'Explain<CR>', desc = 'Explain selection / file' },
          { mode = 'i', lhs = '<leader>ai', rhs = '<cmd>' .. prefix .. 'Implement<CR>', desc = 'Implement selection / file' },
          { mode = 'i', lhs = '<leader>af', rhs = '<cmd>' .. prefix .. 'Fix<CR>', desc = 'Fix selection / file' },
        }
        for _, m in ipairs(mappings) do
          vim.keymap.set(m.mode, m.lhs, m.rhs, { silent = true, desc = m.desc })
        end
      end
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    requires = {
      'copilotlsp-nvim/copilot-lsp',
    },
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {}
    end,
  },
}
