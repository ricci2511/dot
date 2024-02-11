-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap

-- Keep cursor centered for half-page scrolls and search jumps
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Nicer keymaps to paste from yank register
keymap.set("n", "<Leader>.p", '"0p')
keymap.set("n", "<Leader>.P", '"0P')
keymap.set("v", "<Leader>.p", '"0p')

-- Change/delete to black hole
keymap.set("n", "<Leader>.c", '"_c')
keymap.set("n", "<Leader>.C", '"_C')
keymap.set("v", "<Leader>.c", '"_c')
keymap.set("v", "<Leader>.C", '"_C')
keymap.set("n", "<Leader>.d", '"_d')
keymap.set("n", "<Leader>.D", '"_D')
keymap.set("v", "<Leader>.d", '"_d')
keymap.set("v", "<Leader>.D", '"_D')

keymap.set("n", "x", '"_x') -- Cut always to black hole
