# Vagrant con VirtualBox
## 1.Instalar Vagrant

Instalar Vagrant.

Si vamos a trabajar Vagrant con MV de VirtualBox, hay que comprobar que las versiones de ambos son compatibles entre sí.

  vagrant version, para comprobar la versión actual de Vagrant.

![Txt](./1.png)

## 2.Proyecto Celtics
### 2.1 Imagen, caja o box

vagrant box add BOXNAME, descargar la caja que necesitamos a través de vagrant.

![Txt](./2.png)

vagrant box list, lista las cajas/imágenes disponibles actualmente en nuestra máquina.

![Txt](./3.png)

### 2.2 Directorio

Crear un directorio para nuestro proyecto. Donde XX es el número de cada alumno

Crear el fichero Vagrantfile de la siguiente forma:

![Txt](./4.png)

### 2.3 Comprobar

Debemos estar dentro de vagrantXX-celtics.

vagrant up, para iniciar una nueva instancia de la máquina.

![Txt](./5.png)

Veremos que se a creado la maquina en nuesto VirtualBox

![Txt](./6.png)

vagrant ssh: Conectar/entrar en nuestra máquina virtual usando SSH.

![Txt](./7.png)

## 3. Proyecto Hawks
### 3.1 Creamos proyecto Hawks

Crear carpeta vagrantXX-hawks. Entrar en el directorio.

Crear proyecto Vagrant.

Configurar Vagrantfile para usar nuestra caja BOXNAME y hostname = "nombre-alumnoXX-hawks".

![Txt](./8.png)

Modificar el fichero Vagrantfile, de modo que el puerto 4567 del sistema anfitrión sea enrutado al puerto 80 del ambiente virtualizado.

config.vm.network :forwarded_port, host: 4567, guest: 80

vagrant ssh, entramos en la MV

![Txt](./9.png)

Veremos que se ha realizado la configuración de puertos

Instalamos apache2.

![Txt](./10.png)

Hacemos un vagrant reload en el caso de que queramos actualizar la caja

![Txt](./11.png)

### 3.2 Comprobar


En el HOST-CON-VAGRANT (Máquina real). Comprobaremos que el puerto 4567 está a la escucha.

vagrant port para ver la redirección de puertos de la máquina Vagrant.

![Txt](./12.png)

En HOST-CON-VAGRANT, abrimos el navegador web con el URL http://127.0.0.1:4567. En realidad estamos accediendo al puerto 80 de nuestro sistema virtualizado.

![Txt](./13.png)

## 4. Suministro

vagrant halt, apagamos la MV.

![Txt](./14.png)

vagrant destroy y la destruimos para volver a empezar.

![Txt](./15.png)

### 4.1 Proyecto Lakers (Suministro mediante shell script)


Crear directorio vagrantXX-lakers para nuestro proyecto.

Entrar en dicha carpeta.

Crear la carpeta html y crear fichero html/index.html con el siguiente contenido:

![Txt](./16.png)

Crear el script install_apache.sh, dentro del proyecto con el siguiente contenido:

![Txt](./17.png)

Incluir en el fichero de configuración Vagrantfile lo siguiente:

config.vm.hostname = "nombre-alumnoXX-lakers"

config.vm.provision :shell, :path => "install_apache.sh", para indicar a Vagrant que debe ejecutar el script install_apache.sh dentro del entorno virtual.

config.vm.synced_folder "html", "/var/www/html", para sincronizar la carpeta exterior html con la carpeta interior. De esta forma el fichero "index.html" será visible dentro de la MV.

![Txt](./18.png)

vagrant up, para crear la MV.

![Txt](./19.png)

>Podremos notar, al iniciar la máquina, que en los mensajes de salida se muestran mensajes que indican cómo se va instalando el paquete de Apache que indicamos.


Para verificar que efectivamente el servidor Apache ha sido instalado e iniciado, abrimos navegador en la máquina real con URL http://127.0.0.1:4567.

![Txt](./20.png)

### 4.2 Proyecto Raptors (Suministro mediante Puppet)


Crear directorio vagrantXX-raptors como nuevo proyecto Vagrant.

Modificar el archivo Vagrantfile de la siguiente forma:

![Txt](./21.png)

Ahora hay que crear el fichero manifests/nombre-del-alumnoXX.pp, con las órdenes/instrucciones Puppet para instalar un programa determinado

![Txt](./22.png)

vagrant up

![Txt](./23.png)

Ahí se puede apreciar que se a instalado correctamente el paquete que le solicite a puppet en este caso php

![Txt](./24.png)

## 5 Proyecto Bulls

### 5.1 Preparar la MV VirtualBox


Crear una MV VirtualBox nueva o usar una que ya tengamos.

Instalar OpenSSH Server en la MV en mi caso ya estaba instalando

Ir a la MV de VirtualBox:

su

useradd -m vagrant

su - vagrant

mkdir -pm 700 /home/vagrant/.ssh

wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys

![Txt](./25.png)

chmod 0600 /home/vagrant/.ssh/authorized_keys

chown -R vagrant /home/vagrant/.ssh

![Txt](./26.png)

#### sudoers

Añadir vagrant ALL=(ALL) NOPASSWD: ALL a /etc/sudoers.

![Txt](./27.png)

#### Añadir las VirtualBox Guest Additions

Debemos asegurarnos que tenemos instalado las VirtualBox Guest Additions con una versión compatible con el host anfitrión.

root@hostname:~# modinfo vboxguest |grep version

![Txt](./28.png)

Apagar la MV

### 5.2 Crear caja Vagrant


Vamos a crear una nueva carpeta vagrantXX-bulls, para este nuevo proyecto vagrant.

VBoxManage list vms, comando de VirtualBox que muestra los nombres de nuestras MVs. Elegiar una de las máquinas (VMNAME).

![Txt](./29.png)

Nos aseguramos que la MV de VirtualBox VMNAME está apagada.

vagrant package --base VMNAME nombre-alumnoXX.box, parar crear nuestra propia caja.

Comprobamos que se ha creado el fichero nombre-alumnoXX.box en el directorio donde hemos ejecutado el comando.

![Txt](./30.png)

vagrant box add nombre-alumno/bulls nombre-alumnoXX.box, añadimos la nueva caja creada por nosotros, al repositorio local de cajas vagrant de nuestra máquina.

![Txt](./31.png)

![Txt](./32.png)

vagrant box list, consultar ahora la lista de cajas Vagrant disponibles.

![Txt](./33.png)

### 5.3 Usar la nueva caja


Crear un nuevo Vagrantfile para usar nuestra caja.

![Txt](./37.png)

Levantamos la MV.

![Txt](./36.png)

Nos debemos conectar sin problemas (vagant ssh).

![Txt](./35.png)
