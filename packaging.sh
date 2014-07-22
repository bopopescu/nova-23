#! /bin/bash

LOG_FILE=/tmp/packaging.log
LOG_MESSAGE="Details in ${LOG_FILE}"

echo 'Starting packaging...'
[ -f '$LOG_FILE' ] && rm -f ${LOG_FILE}


echo 'Pack compute...'
mv -f setup.cfg setup.cfg.bak
echo 'Prepare setup.cfg'
cp -f nova-compute.cfg setup.cfg
echo 'Build rpm package...'
python setup.py bdist_rpm >> ${LOG_FILE} 2>&1
if [ $? -ne 0 ]; then
  echo "Error: build compute rpm package failed. ${LOG_MESSAGE}"
  exit 1
fi

echo 'Pack successfully, rpm packages are in dist/ directory'
mv setup.cfg.bak setup.cfg
exit 0
