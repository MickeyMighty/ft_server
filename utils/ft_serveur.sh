scripts=/usr/local/bin
trap "echo'Control-C cannot be used' ; sleep 1; clear; continue" 1 2 3

menu_main()
{
RET=menu_main
while true
do
clear
date
cat << "EOT"
                -------------------------------------
                            Menu Ft_serveur
                -------------------------------------

                        a )  Documentation
                        b )  Init Docker (not avaible)
                        c )  ft_server \1 (Clean all the Containers and Images)
                        d )  Start ft_serveur \2
                        e )  Open ft_serveur \3
                        f )  Git Pull
                        g )  Git push
                        h )  Clean docker

                        q )  QUIT (Leave this menu program)


Please type a choiceletter (from the above choices) then press the RETURN key

EOT

read answer
clear
case "$answer" in
[Aa]*) menu_doc ;;
[Bb]*) Not avaible ;;
[Cc]*) ft_clean ;;
[Dd]*) cd .. && echo "docker build -t poet . && docker run -it -p 80:80 -p 443:443 poet" > test.sh ;;
[Ee]*) open https://localhost ;;
[Ff]*) update ;;
[Gg]*) push ;;
[Qq]*)  echo "Quitting the menu program" ; exit 0 ;;
*)      echo "Please choose an option which is displayed on the menu" ;;
esac
echo ""
echo "PRESS RETURN FOR THE MENU"
read dummy
done
}

ft_clean()
{
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
clear
echo "########################################################################"
echo "#                              IMAGES :                                #"
echo "########################################################################"
echo "\n"
docker image ls
echo "\n"
echo "########################################################################"
echo "#                            CONTAINERS :                              #"
echo "########################################################################"
echo "\n"
docker container ls
echo "\n"
echo "########################################################################"
echo "#                           DOCKER PS -A :                             #"
echo "########################################################################"
echo "\n"
docker ps -a
echo "\n"
}

menu_doc()
{
RET=menu_main
while true
do
clear
date
cat << "EOT"
                -------------------------------------
                       Documentation (links)
                -------------------------------------

               Before : 1 ) Docker ?
                        2 ) Docker ? /2
                        3 ) Nginx ?
                        4 ) Wordpress ?
                        5 ) PhpMyAdmin ?
               After :
                        a )  Install Lemp stack Debian Buster ?
                        b )  Install PhpMyAdmin with Nginx ?
                        c )  Docker ?
                        d )  Serveur ?
                        e )  apt-get ?
                        f )  Dockerfile ?
                        g )  Command Docker ?
                        h )  Port 80 & Port 443 ?
                        i )  Set Up Nginx Server Blocks (Virtual Hosts) ?
                        j ) Install php extension for PhpMyadmin ?
                        k ) For secure link

                        r )  return to the Main Menu
                        q )  QUIT (Leave this menu program)


Please type a choiceletter (from the above choices) then press the RETURN key

EOT

read answer
clear
case "$answer" in
[1]*) open https://doc.ubuntu-fr.org/docker ;;
[2]*) https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker ;;
[3]*) open https://www.grafikart.fr/tutoriels/nginx-692 ;;
[4]*) open https://fr.wordpress.com ;;
[5]*) open https://www.phpmyadmin.net/ ;;
[Aa]*) open https://www.linuxbabe.com/debian/install-lemp-stack-debian-10-buster ;;
[Bb]*) open https://www.itzgeek.com/how-tos/linux/debian/how-to-install-phpmyadmin-with-nginx-on-debian-10.html ;;
[Cc]*) open https://wiki.debian.org/Docker ;;
[Dd]*) open https://fr.wikipedia.org/wiki/Serveur_informatique/Utilisations ;;
[Ee]*) open https://doc.ubuntu-fr.org/apt-get ;;
[Ff]*) open https://www.arolla.fr/blog/2016/09/quelques-precisions-dockerfile/ ;;
[Gg]*) open https://tech.gamuza.fr/docker-les-commandes-de-base.html ;;
[Hh]*) open https://www.howtogeek.com/233383/why-was-80-chosen-as-the-default-http-port-and-443-as-the-default-https-port/ ;;
[Ii]*) open https://www.digitalocean.com/community/tutorials/how-to-set-up-nginx-server-blocks-virtual-hosts-on-ubuntu-16-04 ;;
[Jj]*) open https://www.digitalocean.com/community/tutorials/how-to-install-phpmyadmin-from-source-debian-10 ;;
[Kk]*) open https://github.com/FiloSottile/mkcert ;;
[Rr]*) menu_main ;;
[Qq]*)  echo "Quitting the menu program" ; exit 0 ;;
*)      echo "Please choose an option which is displayed on the menu" ;;
esac
echo ""
echo "PRESS RETURN FOR THE MENU"
read dummy
done
}

#gestion des parametres
while getopts h os
do case "$o" in
    h)      usage;;
    s)      shortcuts;;
    esac
done

echo $1

# common
[ $# -ge 2 ] && usage
[ $# -eq 0 ] && menu_main

# shortcuts
#[ "$1" == "doc" ] && menu_doc
#[ "$1" == "fs" ] && menu_main

echo "option menu not found type mysmit"
