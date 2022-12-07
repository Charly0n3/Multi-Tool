
#!/bin/bash

# Autor: Ch4rly0n3
# Descripción: este programa ofrece varias opciones, comparación de tamaño de ficheros o directorios, y creación de copias de seguridad tanto de ficheros como de directorios y busqueda en fichero passwd. 
# Si tienes problemas con los colores, ejecuta el script con "sh"

clear
username=$(whoami)

if [ $(id -u) -ne 0 ];
   then
       echo "\e[31m [ERROR] \e[0m \e[33m Debes de ser root para ejecutar este programa :( \e[0m"
       echo "Bye Bye.."
       sleep 2
       exit 1
fi

opc=0

# mientras la variable opc sea igual o menos que 4 se seguirá haciendo el bucle

while [ $opc -ne 4 ] ; do

# BANNER

echo
echo

     toilet --metal MULTI-TOOL -f future

echo
echo
echo "\e[37m 1. \e[0m \e[32m Compara ficheros o directorios por tamaño \e[0m"
echo
echo "\e[37m 2. \e[0m \e[32m Busqueda en /etc/passwd \e[0m"
echo
echo "\e[37m 3. \e[0m \e[32m Crear respaldo de fichero o directorio \e[0m"
echo
echo "\e[37m 4. \e[0m \e[31m Salir \e[0m"
echo

# recojemos la opción en la variable opc

echo
read -p "Seleccione una opción: " opc
echo

# usamos case para darnos a elegir entre varias opciones

case $opc in


     1) # Compara ficheros o directorios por tamaño.
        echo
        echo "Ahora dime que quieres comparar.."
        echo
        sleep 1

# Creo otro programa con case dentro de un bucle while dentro de la opción donde recogerá lo que queremos hace
        opt=0

        while [ $opt -ne 4 ]; do
                 echo
                 echo "\e[37m 1. \e[0m \e[32m Comparar ficheros. \e[0m"
                 echo
                 echo "\e[37m 2. \e[0m \e[32m Comparar directorios. \e[0m"
                 echo
                 echo "\e[37m 3. \e[0m \e[32m Limpiar menú anterior \e[0m"
                 echo
                 echo "\e[37m 4. \e[0m \e[32m Salir \e[0m"
                 echo

                 echo "\e[33m [ SELECCIONE UNA OPCIÓN (1,2,3,4) ] --> \e[0m"
                 read opt

                 case $opt in


                      1) #Compara ficheros

                      # Lógica fichero 1

size_uno=$(du -hc $fichero_uno | grep "total" | cut -f 1)
                      echo
                      echo "Digame la \e[33m [ RUTA ABSOLUTA ] \e[0m de el primer fichero para comparar: "
                      echo
                      read fichero_uno

                           if [ -f $fichero_uno ];

                           then

                               echo "$fichero_uno pesa: $size_uno" 2> /dev/null

                           else

                               echo "\e[31m [ERROR] \e[0m  \e[33m Debes de poner la ruta de un fichero, no de un directorio. \e[0m" 2> /dev/null
                               sleep 1

                           fi

                      # Lógica fichero 2

size_dos=$(du -hc $fichero_dos | grep "total" | cut -f 1)

                      echo
                      echo "Digame el segundo fichero \e[33m [ RUTA ABSOLUTA ]: \e[0m"
                      echo
                      read fichero_dos

                           if [ -f $fichero_dos ];

                           then

                               echo "$fichero_dos pesa: \e[33m $size_dos \e[0m" 2> /dev/null

                           else

                               echo "\e[30m [ERROR] \e[0m \e[32m Debes de poner la ruta de un fichero, no de un directorio. \e[0m" 2> /dev/null
                               sleep 1

                            fi

                            if [ $size_uno \> $size_dos ];

                                        then
                                                 echo
                                                 echo  "\e[32m $fichero_uno \e[0m pesa más que \e[32m $fichero_dos \e[0m"
                                                 echo

                                        else
                                                 echo
                                                 echo "\e[32m $fichero_dos \e[0m  pesa más que \e[32m $fichero_uno \e[0m"
                                                 echo
                                        fi
                        ;;

                      2) # Compara directorios

                         # Lógica Directorio 1

sizedir_uno=$(du -hc $directorio_uno | grep "total" | cut -f 1)
                      echo
                      echo "Digame la \e[33m [ RUTA ABSOLUTA ] \e[0m de el primer directorio para comparar: "
                      echo
                      read directorio_uno

                           if [ -d $directorio_uno ];

                           then

                               echo "$directorio_uno pesa: $sizedir_uno" 2> /dev/null

                           else

                               echo "\e[31m [ERROR] \e[0m  \e[33m Debes de poner la ruta de un directorio, no de un fichero. \e[0m" 2> /dev/null
                               sleep 1

                           fi

                      # Lógica directorio 2

sizedir_dos=$(du -hc $fichero_dos | grep "total" | cut -f 1)

                      echo
                      echo "Digame el segundo directorio \e[33m [ RUTA ABSOLUTA ]: \e[0m"
                      echo
                      read directorio_dos

                           if [ -d $directorio_dos ];

                           then

                               echo "$directorio_dos pesa: \e[33m $sizedir_dos \e[0m" 2> /dev/null

                           else

                               echo "\e[30m [ERROR] \e[0m \e[32m Debes de poner la ruta de un Directorio, no de un fichero. \e[0m" 2> /dev/null
                               sleep 1

                            fi

                            if [ $sizedir_uno \> $sizedir_dos ];

                                        then
                                                 echo
                                                 echo  "\e[32m $directorio_uno \e[0m pesa más que \e[32m $directorio_dos \e[0m"
                                                 echo

                                        else
                                                 echo
                                                 echo "\e[32m $directorio_dos \e[0m  pesa más que \e[32m $directorio_uno \e[0m"
                                                 echo
                                        fi

                        ;;


                      3) # Limpia menú anterior

                        clear

                        ;;

                      4) # Salir
                        echo "4. Salir"
                        sleep 2
                        ;;

                  esac
           done
        ;;

# Busca información en el directorio /etc/passwd

     2)

        read -p "Dime qué quieres buscar dentro de passwd [Shell, nombre, UID, GID..]: " parametro
        echo
        echo "\e[33m Su información es: \e[0m "
        echo
        cat /etc/passwd | grep $parametro
        sleep 2
        ;;

     3)

# Se creará un directorio para almacenar el respaldo del directorio o fichero

        mkdir /backups/ 2> /dev/null

        fecha=$(date +%F)

        echo "Dime el directorio o fichero para hacerle la copia comprimida \e[31m [Pon la ruta absoluta correctamente]: \e[0m "
        read fichero
        echo "A continuación dime el nombre de la copia: "
        read nombre

        if [ -d $fichero ];
           then
                tar -czvf /backups/$nombre$fecha.tar.gz $fichero
                echo "\e[33m Su copia de seguridad ha sido creada en /backups \e[0m"
        fi

        if [ -f $fichero ];
           then
               mkdir /backups/files 2> /dev/null
               tar -czvf /backups/files/$nombre$fecha.tar.gz $fichero
               echo "\e[33m Su copia de seguridad ha sido creada en /backups/files \e[0m"
        fi

        sleep 2
        ;;

# Salir del programa
     4)
        echo "Saliendo Del programa"
        echo "."
        sleep 1
        echo ".."
        sleep 1
        ;;



     *)
        echo "Esta no es una opción válida"
        clear
        ;;


esac
done

# Fin del programa


