# Salt Stack
## 3.4 Comprobar conectividad
Instalar el servicio salt-Master: zypper install salt-master.service

Instalar el servicio salt-minion: zypper install salt.minion.service

![](./1.png)

Aceptar al minion

![](./2.png)

Comprobar conectividad

![](./3.png)

![](./4.png)

## 4.5 Aplicar estados (apache)

Creamos ddirectorio base y devel donde guardaremos los estados

![](./5.png)

Creamos el root.conf

![](./6.png)

Creamos el init.sls

![](./7.png)

Utilizamos el comando salt '*' state.apply apache

![](./9.png)

Se ha aplicado correctamente el estados

![](./10.png)

![](./11.png)

![](./12.png)

## 5.1 Aplicar estados (users)

Creamos el init.sls con los parametros para crear los usuarios dentro del grupo mazinger

![](./13.png)

Aplicamos el estado con el comando salt '*' state.apply users

![](./14.png)

Podemos comprobar como se aplicaron los 3 usuarios correctamente

![](./15.png)

## 5.2 Aplicar estados (files)

Creamos el init.sls designando sus directorios y colocamos sus respectivos permisos

![](./16.png)

Aplicamos el estado con el comando salt '*' state.apply files

![](./17.png)
![](./18.png)

Se aplico el estado correctamente

## Intento de ampliación de estado apache

 ![](./19.png)
