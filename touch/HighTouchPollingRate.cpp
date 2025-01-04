/*
 * Copyright (C) 2024-2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <fstream>

#include "HighTouchPollingRate.h"

namespace vendor {
namespace lineage {
namespace touch {
namespace V1_0 {
namespace samsung {

bool HighTouchPollingRate::isSupported() {
    std::ifstream file(TSP_CMD_LIST_NODE);
    if (file.is_open()) {
        std::string line;
        while (getline(file, line)) {
            if (!line.compare("set_game_mode")) return true;
        }
        file.close();
    }
    return false;
}

// Methods from ::vendor::lineage::touch::V1_0::IHighTouchPollingRate follow.
Return<bool> HighTouchPollingRate::isEnabled() {
    std::ifstream file(TSP_CMD_RESULT_NODE);
    if (file.is_open()) {
        std::string line;
        getline(file, line);
        if (!line.compare("set_game_mode,1:OK")) return true;
        file.close();
    }
    return false;
}

Return<bool> HighTouchPollingRate::setEnabled(bool enabled) {
    std::ofstream file(TSP_CMD_NODE);
    file << "set_game_mode," << (enabled ? "1" : "0");
    return true;
}

}  // namespace samsung
}  // namespace V1_0
}  // namespace touch
}  // namespace lineage
}  // namespace vendor
