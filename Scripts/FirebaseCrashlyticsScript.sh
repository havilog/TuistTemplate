if [ "${CONFIGURATION}" != "Debug" ]; then
    "${PODS_ROOT}/FirebaseCrashlytics/run"
    "${PODS_ROOT}/FirebaseCrashlytics/upload-symbols" -gsp ${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist -p ios ${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}
fi
