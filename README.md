dotfiles
========

A collection of my personal dotfiles.

## help
*nginx & php-fpm*
`File not found error`
1. Set ProtectHome=false in /etc/systemd/system/multi-user.target.wants/php-fpm.service
2. systemctl daemon-reload
3. systemctl restart nginx
4. systemctl restart php-fpm
