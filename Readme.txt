Инструкция по смене дефолтных паролей на VM:
Все делаем из корня папки с файлами!

1) Устанавливаем на хост с которого будем работать Ansible
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible

2) Прописываем в файле инвентаризации айпишники нужных VM.
sudo vim /etc/ansible/hosts
Сам файл:
[servers]
server1 ansible_host=203.0.113.111 # Три примера сервера server1 = название ansible_host = айпишники
server2 ansible_host=203.0.113.112
server3 ansible_host=203.0.113.113

[all:vars]
ansible_python_interpreter=/usr/bin/python3 # говорим чтобы использовался python3, так как он в последних версиях ОС используется.


3) Для конекта между хостом и клиентами нам необходим rsa ключ, формируем его.
ssh-keygen
Делаем passphrase - это пароль от открытого ключа

4) Далее выполняем скрипт на каждом ЛогинНеРута@айпишник для возможности подключения с рута:
ssh ЛогинНеРута@айпишник 'bash -s' < rootPermit.sh

5) Далее мы копируем открытую часть ключа на каждый root@айпишник:
ssh-copy-id root@айпишник

6) После этого устанавливаем Python3:
sudo apt-get update
sudo apt-get install python3

7) Устанавливаем библиотеку python3 для Ansible:
sudo pip3 install passlib

8) В файле change-password.yml в строчку mypassword, можно задать нужный пароль:
sudo ansible-playbook change-password.yml

9) Выполняем скрипт, чтобы сделать как было в ssh config:
ssh ЛогинНеРута@айпишник 'bash -s' < rootNoPermit.sh

