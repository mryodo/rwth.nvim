<div align="center">
  <h1>RWTH.nvim</h1>
  <p>Based on stellar <a href="https://github.com/oskarnurm/koda.nvim">Koda.nvim</a> using official <a href = "https://github.com/ifs-rwth-aachen/RWTH-Colors" >RWTH colors</a> </p>
    <p>A minimalist(-ish) theme for <a href="https://github.com/neovim/neovim">Neovim</a>, written in Lua</p>
</div>

|            | Dark Theme                                                                                                          | Light Theme                                                                                                          |
| ---------- | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Syntax** | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/syntax-dark.png?raw=true" width="600" alt="rwth"  /> | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/syntax-light.png?raw=true" width="600" alt="rwth"  /> |

<details>
<summary>mini-start</summary>

|              | Dark Theme                                      | Light Theme                                       |
| ------------ | ----------------------------------------------- | ------------------------------------------------- |
| `mini-start` | ![assets/start-dark.png](assets/start-dark.png) | ![assets/start-light.png](assets/start-light.png) |

</details>

<details><summary>mini-files</summary>

|              | Dark Theme                                                                                                         | Light Theme                                                                                                         |
| ------------ | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| `mini-files` | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/files-dark.png?raw=true" width="600" alt="rwth"  /> | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/files-light.png?raw=true" width="600" alt="rwth"  /> |

</details>

<details><summary>telescope</summary>

|             | Dark Theme                                                                                                             | Light Theme                                                                                                             |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `telescope` | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/telescope-dark.png?raw=true" width="600" alt="rwth"  /> | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/telescope-light.png?raw=true" width="600" alt="rwth"  /> |

</details>

<details><summary>Active Pmenu</summary>

|                    | Dark Theme                                                                                                              | Light Theme                                                                                                              |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| **Active `Pmenu`** | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/completion-dark.png?raw=true" width="600" alt="rwth"  /> | <img src="https://github.com/mryodo/rwth.nvim/blob/main/assets/completion-light.png?raw=true" width="600" alt="rwth"  /> |

</details>

## Installation

Using `vim.pack`:

```lua
  vim.pack.add({ src =  "https://github.com/mryodo/rwth.nvim" })
  require("rwth").setup({
    transparent = false
  })
  vim.cmd("colorscheme rwth-dark")
```

**Bug fix**: if you encounter not loaded artifacts in `Pmenu` and statusline, add

```lua
later(function()
  vim.cmd("colorscheme rwth-dark")
end)
```

to reload the colorscheme again.

## Features

The theme based its architecture entirely on the incredible [koda.nvim](https://github.com/oskarnurm/koda.nvim/tree/main). **Please support @oskarnurm !**

Theme was built for personal use on top on the [MiniMax config](https://github.com/nvim-mini/MiniMax). **Please support @echasnowski !**

- light (`rwth-light`) and dark (`rwth-dark`) colorschemes based on the RWTH colors;
- plugin support inherited from [koda.nvim](https://github.com/oskarnurm/koda.nvim/tree/main#supported-plugins);
- additional highlights for [bento.nvim](https://github.com/serhez/bento.nvim);
- additional styling for [mini.nvim](https://github.com/nvim-mini/mini.nvim/tree/bcb4b2688b38f5c48ada025abe130d41840e11d5)
  - centered `mini.pick` with contrasting background;
  - `mini.files` at the bottom with contrasting background;
- additional styling for `telescope.nvim`.

I am also using a keymap for light/dark switch:

```lua
  vim.keymap.set(
    'n',
    '\\b',
    function()
      if vim.o.background == "light" then
        vim.o.background = "dark"
        vim.cmd.colorscheme("rwth-dark")
        vim.cmd("RWTHFetch")
        vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50")
      else
        vim.o.background = "light"
        vim.cmd.colorscheme("rwth-light")
        vim.cmd("RWTHFetch")
        vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50")
      end
    end,
    { desc = "new Toggle 'background'" }
  )
```

## Known artifacts

- [ ] preview for `mini.pick` uses contrasting background and destroys the text. should be changed in accordance with `telescope`
- [ ] literally everything is horrible, please push problems!

## Extras

Extra color configs for [Ghostty](https://ghostty.org/), [Lazygit](https://github.com/jesseduffield/lazygit), and [Kitty](https://sw.kovidgoyal.net/kitty/) can be found in [extras](extras/). To use them, refer to their respective documentation.

---

<div align="center">
  <h2>no one of us can be free until everybody is free</h2>
</div>
