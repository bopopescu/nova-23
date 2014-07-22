INSTALL_ENV=`python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"`
[ -d ${INSTALL_ENV}/nova/compute ] || mkdir -p ${INSTALL_ENV}/nova/compute
cp -r /usr/share/nova/ ${INSTALL_ENV}/nova
 
if [ -f /etc/nova/nova.conf.sample ];then
mv -f /etc/nova/nova.conf.sample /etc/nova/nova.conf
fi

