# Cliente para autenticación LDAP
### 1. Preparativos

Ir a MV Cliente

nmap -Pn 172.19.17.33 | grep -P '389|636'

![texto](./1.png)

ldapsearch -H ldap://172.19.17.33:389 -W -D "cn=Directory manager" -b "dc=ldap17,dc=curso2021" "(uid=*)" | grep dn

![texto](./2.png)

## 2. Configurar auntenticación LDAP

### 2.1 Crear conexión con el servidor

Ir MV Cliente

Asegurarnos de tener el hostname y el hosts bien

![texto](./3.png)

Ir a Yast -> cliente LDAP y Kerberos

Configurar como la imagen de ejemplo:

![texto](./4.png)

Al final Probar conexión

![texto](./6.png)

## 2.2 Comprobar conexiones

id mazinger

![texto](./7.png)

su -l mazinger

![texto](./8.png)

getent passwd mazinger

![texto](./9.png)

cat /etc/passwd | grep mazinger

![texto](./10.png)
