function erp_test
  env ACTIVE_RECORD_LOG_LEVEL=3 SPEC_DISABLE_FACTORY_LINT=true SPEC_DISABLE_WEBPACK_COMPILE=true TEST_PATH=$argv make test
end
