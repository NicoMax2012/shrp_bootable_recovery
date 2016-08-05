#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

# Unit tests
include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_MODULE := recovery_unit_test
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_STATIC_LIBRARIES := libverifier
LOCAL_SRC_FILES := unit/asn1_decoder_test.cpp
LOCAL_SRC_FILES += unit/recovery_test.cpp
LOCAL_C_INCLUDES := bootable/recovery
LOCAL_SHARED_LIBRARIES := liblog
include $(BUILD_NATIVE_TEST)

# Component tests
include $(CLEAR_VARS)
LOCAL_CLANG := true
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MODULE := recovery_component_test
LOCAL_C_INCLUDES := bootable/recovery
LOCAL_SRC_FILES := component/verifier_test.cpp
LOCAL_FORCE_STATIC_EXECUTABLE := true
LOCAL_STATIC_LIBRARIES := \
    libbase \
    libverifier \
    libcrypto_utils \
    libcrypto \
    libminui \
    libminzip \
    libcutils \
    libc

testdata_out_path := $(TARGET_OUT_DATA_NATIVE_TESTS)/recovery
testdata_files := $(call find-subdir-files, testdata/*)

GEN := $(addprefix $(testdata_out_path)/, $(testdata_files))
$(GEN): PRIVATE_PATH := $(LOCAL_PATH)
$(GEN): PRIVATE_CUSTOM_TOOL = cp $< $@
$(GEN): $(testdata_out_path)/% : $(LOCAL_PATH)/%
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN)
include $(BUILD_NATIVE_TEST)
