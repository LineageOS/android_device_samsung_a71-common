/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef INIT_SEC_H
#define INIT_SEC_H

#include <string.h>

enum device_variant {
    VARIANT_A715F = 0,
    VARIANT_M515F,
    VARIANT_MAX
};

typedef struct {
    std::string model;
    std::string codename;
} variant;

static const variant international_models = {
    .model = "SM-A715F",
    .codename = "a71"
};

static const variant international_models_m51 = {
    .model = "SM-M515F",
    .codename = "m51"
};

static const variant *all_variants[VARIANT_MAX] = {
    &international_models,
    &international_models_m51,
};

#endif // INIT_SEC_H
