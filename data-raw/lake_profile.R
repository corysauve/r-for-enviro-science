plankton_raw <- readr::read_csv(here::here("data-raw/raw", "plankton.csv"))
water_chem_raw <- readr::read_csv(here::here("data-raw/raw", "water_chemistry.csv"))

plankton_clean <- plankton_raw %>%
  dplyr::slice(1:4, 6:10) %>%
  dplyr::select(-lake, -sample_type)

lake_profile <- water_chem_raw %>%
  dplyr::slice(1:3, 5, 7:10, 12) %>%
  dplyr::select(-sample_type) %>%
  dplyr::left_join(plankton_clean, by = "depth") %>%
  dplyr::mutate(srp_mgl = dplyr::case_when(srp_mgl <= 0.002 ~ 0.002, TRUE ~ srp_mgl),
                tp_mgl = dplyr::case_when(tp_mgl <= 0.002 ~ 0.002, TRUE ~ tp_mgl),
                no3_mgl = dplyr::case_when(no3_mgl <= 0.009 ~ 0.009, TRUE ~ no3_mgl),
                nh3_mgl = dplyr::case_when(nh3_mgl <= 0.015 ~ 0.015, TRUE ~ nh3_mgl),
                tn_mgl = dplyr::case_when(tn_mgl <= 0.104 ~ 0.104, TRUE ~ tn_mgl),
                orgn_mgl = organic_n(tn_mgl, no3_mgl, nh3_mgl),
                light_level_per = light_percentage(light_dep_mmol, light_sur_mmol))

usethis::use_data(lake_profile, overwrite = TRUE)
