<#

Protocol    Port    Example                                 Notes
--------    ----    -------                                 -----

http(s)     80/443  https://github.com/jquery/jquery.git    read/write access
                                                            can demand password for authentication
                                                            (anonymous read, authenticated write, etc)
                                                            
git         9418    git://github.com/jquery/jquery.git      read-only access
                                                            anonymous access only

ssh         22      git@github.com/jquery/jquery.git        read/write access
                                                            uses SSH keys for authentication

file        n/a     D:\dev\git\jquery                       read/write access
                                                            local only

#>