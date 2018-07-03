function fish_prompt
    test $SSH_TTY
    and printf (set_color -o green)$USER'@'(hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"

    # Main
    echo -n (set_color  cyan)(prompt_pwd) (set_color -o red)'>'(set_color -o yellow)'>'(set_color -o green)'>'

    # Git
    set last_status $status
    printf '%s ' (__fish_git_prompt)
    set_color normal

end
