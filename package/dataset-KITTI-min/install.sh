#! /bin/bash

# PACKAGE_DIR
# INSTALL_DIR

# KITTI_MIN_URL

KITTI_NAME="KITTI minimal validation dataset"
#####################################################################
echo ""
echo "Downloading ${KITTI_NAME} from '${KITTI_MIN_URL}' ..."

wget -c ${KITTI_MIN_URL} -O ${KITTI_MIN_ARCHIVE}

if [ "${?}" != "0" ] ; then
  echo "Error: Downloading ${KITTI_NAME} from '${KITTI_MIN_URL}' failed!"
  exit 1
fi

#####################################################################
echo ""
echo "Calculating the MD5 hash of '${KITTI_MIN_ARCHIVE}' ..."
KITTI_MIN_MD5_CALC=($(md5sum ${KITTI_MIN_ARCHIVE}))
if [ "${?}" != "0" ] ; then
  echo "Error: Calculating the MD5 hash of '${KITTI_MIN_ARCHIVE}' failed!"
  exit 1
fi

#####################################################################
echo ""
echo "Validating the MD5 hash of '${KITTI_MIN_ARCHIVE}' ..."
echo "Calculated MD5 hash: ${KITTI_MIN_MD5_CALC}"
echo "Reference MD5 hash: ${KITTI_MIN_MD5}"
if [ "${KITTI_MIN_MD5_CALC}" != "${KITTI_MIN_MD5}" ] ; then
  echo "Error: Validating the MD5 hash of '${KITTI_MIN_ARCHIVE}' failed!"
  exit 1
fi

#####################################################################
echo ""
echo "Unpacking '${KITTI_MIN_ARCHIVE}' ..."

cd ${INSTALL_DIR}
tar xvf ${KITTI_MIN_ARCHIVE}
if [ "${?}" != "0" ] ; then
  echo "Error: Unpacking '${KITTI_MIN_ARCHIVE}' failed!"
  exit 1
fi

#####################################################################
echo ""
echo "Deleting '${KITTI_MIN_ARCHIVE}' ..."

rm ${KITTI_MIN_ARCHIVE}
if [ "${?}" != "0" ] ; then
  echo "Error: Deleting '${KITTI_MIN_ARCHIVE}' failed!"
  exit 1
fi

#####################################################################
echo ""
echo "Successfully installed ${KITTI_NAME} ..."
exit 0


exit 0
