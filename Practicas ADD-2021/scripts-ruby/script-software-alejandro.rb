puts "[INFO] Ejecutando script"

if ARGV.size == 0
  puts "Ejecuta el script con --help"
  exit 1
end

if ARGV[0] == "--help"
  puts "Usage:"
  puts "systemctl [OPTIONS] [FILENAME]"
  puts "Options:"
  puts "--help, mostrar esta ayuda"
  puts "--version, mostrar información sobre el autor del script y fecha de creacion"
  puts "--status FILENAME, comprueba si puede instalar/desinstalar"
  puts "--run FILENAME, instalada/desisntalada el software indicado"
  puts "Description"
  puts "Este script se encarga de instalar/desinstalar el software indicado en el fichero FILENAME."
  puts "Ejemplo de FILENAME"
  puts "tree:install"
  puts "nmap:install"
  puts "atomix:remove"
end

if ARGV[0] == "--status"
  puts "[INFO] Consultando status en #{ARGV[1]}"

  a= `cat #{ARGV[1]}`
  b = a.split("\n")
  b.each do |x|
    c = `zypper info #{x}|grep instalado|grep Sí |wc -l`.chop
    if c == "1"
      puts "* Estado = #{x}(Instalado)"
    else
      puts "*Estado = #{x}(No instalado)"
    end
  end
end

if ARGV[0] == "--version"
puts "Autor del script: Alejandro"
puts "Fecha de creación: 20/02/21"
end

if ARGV[0] == "--run"
  puts "[INFO] Consultando los programas a instalar en #{ARGV[1]}"
  puts "Eres el usuario: "
    system("whoami")

  a= `cat #{ARGV[1]}`
  b = a.split("\n")
  b.each do |x|
    d = x.split(":")
      if d[1] == "install"
        system("zypper install #{ d[0]}")
      else d[1]  == "remove"
        system("zypper remove #{d[0]}")
    end
  end
end
