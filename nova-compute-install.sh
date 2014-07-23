INSTALL_ENV=`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
[ -d ${INSTALL_ENV}/nova/compute ] || mkdir -p ${INSTALL_ENV}/nova/compute
cp -rf /usr/share/nova/* ${INSTALL_ENV}/nova
cp -rf /usr/local/etc/rc.d/init.d/nova* /etc/init.d
cp  /usr/local/etc/rc.d/init.d/* /etc/rc.d/init.d/

[ -d /etc/nova ] || mkdir /etc/nova
cp /usr/local/etc/nova/* /etc/nova
cp /usr/local/*.py ${INSTALL_ENV}/nova/
 
if [ -f /etc/nova/nova.conf.sample ];then
mv -f /etc/nova/nova.conf.sample /etc/nova/nova.conf
fi

