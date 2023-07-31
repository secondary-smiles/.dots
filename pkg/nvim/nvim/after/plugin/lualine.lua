require('lualine').setup {
  options = {
    theme = "auto",

    section_separators = '',
    component_separators = ''
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },

    lualine_x = { 'filename', 'filesize', 'filetype' },
    lualine_y = { 'selectioncount', 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
