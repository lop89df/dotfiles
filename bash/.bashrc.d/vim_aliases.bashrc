#!/bin/bash

session_dir=${HOME}/.vim/sessions

left_pattern="${session_dir}/left_working.vim*"
right_pattern="${session_dir}/right_working.vim*"

left_files=( $left_pattern )
right_files=( $right_pattern )

alias vimleft="vim -S ${left_files[0]}"
alias vimright="vim -S ${right_files[0]}"

