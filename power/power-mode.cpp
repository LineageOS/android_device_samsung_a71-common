/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/file.h>

#include <aidl/android/hardware/power/BnPower.h>

using ::aidl::android::hardware::power::Mode;

namespace aidl {
namespace android {
namespace hardware {
namespace power {
namespace impl {

bool isDeviceSpecificModeSupported(Mode type, bool* _aidl_return) {
    switch (type) {
        case Mode::DOUBLE_TAP_TO_WAKE:
            *_aidl_return = true;
            return true;
        default:
            return false;
    }
}

bool setDeviceSpecificMode(Mode type, bool enabled) {
    switch (type) {
        case Mode::DOUBLE_TAP_TO_WAKE:
            ::android::base::WriteStringToFile(enabled ? "aot_enable,1" : "aot_enable,0",
                                               "/sys/class/sec/tsp/cmd");
            return true;
        default:
            return false;
    }
}

}  // namespace impl
}  // namespace power
}  // namespace hardware
}  // namespace android
}  // namespace aidl
