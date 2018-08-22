#!/bin/bash
clear
echo █▀▀ █▀▀ ▀▀█▀▀ █░░█ █▀▀█
echo ▀▀█ █▀▀ ░░█░░ █░░█ █░░█
echo ▀▀▀ ▀▀▀ ░░▀░░ ░▀▀▀ █▀▀▀
echo.
echo.
echo.
echo.
apt update && apt upgrade -y
apt install nload htop -y
curl -sSL https://install.pi-hole.net | bash
clear
echo █▀▀ █▀▀ ▀▀█▀▀ █░░█ █▀▀█
echo ▀▀█ █▀▀ ░░█░░ █░░█ █░░█
echo ▀▀▀ ▀▀▀ ░░▀░░ ░▀▀▀ █▀▀▀
(
echo # Package generated configuration file
echo # See the sshd_config(5) manpage for details
echo # What ports, IPs and protocols we listen for
echo Port 5261
echo # Use these options to restrict which interfaces/protocols sshd will bind to
echo #ListenAddress ::
echo #ListenAddress 0.0.0.0
echo Protocol 2
echo # HostKeys for protocol version 2
echo HostKey /etc/ssh/ssh_host_rsa_key
echo HostKey /etc/ssh/ssh_host_dsa_key
echo HostKey /etc/ssh/ssh_host_ecdsa_key
echo HostKey /etc/ssh/ssh_host_ed25519_key
echo #Privilege Separation is turned on for security
echo UsePrivilegeSeparation yes
echo # Lifetime and size of ephemeral version 1 server key
echo KeyRegenerationInterval 3600
echo ServerKeyBits 1024
echo # Logging
echo SyslogFacility AUTH
echo LogLevel INFO
# Authentication:
echo LoginGraceTime 120
echo PermitRootLogin yes
echo StrictModes yes
echo RSAAuthentication yes
echo PubkeyAuthentication yes
echo #AuthorizedKeysFile	%h/.ssh/authorized_keys
echo # Don't read the user's ~/.rhosts and ~/.shosts files
echo IgnoreRhosts yes
echo # For this to work you will also need host keys in /etc/ssh_known_hosts
echo RhostsRSAAuthentication no
echo # similar for protocol version 2
echo HostbasedAuthentication no
echo # Uncomment if you don't trust ~/.ssh/known_hosts for RhostsRSAAuthentication
echo #IgnoreUserKnownHosts yes
echo # To enable empty passwords, change to yes (NOT RECOMMENDED)
echo PermitEmptyPasswords no
echo # Change to yes to enable challenge-response passwords (beware issues with
echo # some PAM modules and threads)
echo ChallengeResponseAuthentication no
echo # Change to no to disable tunnelled clear text passwords
echo PasswordAuthentication yes
echo # Kerberos options
echo #KerberosAuthentication no
echo #KerberosGetAFSToken no
echo #KerberosOrLocalPasswd yes
echo #KerberosTicketCleanup yes
echo # GSSAPI options
echo #GSSAPIAuthentication no
echo #GSSAPICleanupCredentials yes
echo X11Forwarding yes
echo X11DisplayOffset 10
echo PrintMotd no
echo PrintLastLog yes
echo TCPKeepAlive yes
echo #UseLogin no
echo #MaxStartups 10:30:60
echo #Banner /etc/issue.net
echo # Allow client to pass locale environment variables
echo AcceptEnv LANG LC_*
echo Subsystem sftp /usr/lib/openssh/sftp-server
echo UsePAM yes
)>sshd_config
clear
yes | cp -rf sshd_config /etc/ssh/sshd_config
service sshd restart
clear
echo 							DONE
