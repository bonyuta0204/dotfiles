function fish_prompt
    test $SSH_TTY
    and printf (set_color -o green)$USER'@'(hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"

    # Main
    echo -n (set_color 39BAE6 cyan)(prompt_pwd) (set_color -o FF3333 red)'>'(set_color -o FFEE99 yellow)'>'(set_color -o C2D94C green)'>'
    set_color normal

    # Git
    set last_status $status
    printf '%s ' (__fish_git_prompt)
    set_color normal

end
