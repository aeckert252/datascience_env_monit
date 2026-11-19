library(readr)
library(dplyr)

hh_vars <- c("TIMESTAMP_START", "TIMESTAMP_END", "TA_F", "SW_IN_F", "VPD_F", "P_F",
             "NETRAD", "G_F_MDS", "H_F_MDS", "H_F_MDS_QC", "LE_F_MDS", "LE_F_MDS_QC",
             "NEE_VUT_REF", "NEE_VUT_REF_QC", "GPP_NT_VUT_REF", "RECO_NT_VUT_REF")

read_hh <- function(zip_file, exdir = "data/raw/unzipped", keep = hh_vars) {
  hh_name <- grep("FLUXMET_HH", unzip(zip_file, list = TRUE)$Name, value = TRUE)
  unzip(zip_file, files = hh_name, exdir = exdir)
  site <- strsplit(basename(zip_file), "_")[[1]][2]   # z.B. "US-Kon"

  read_csv(file.path(exdir, hh_name),
           na = "-9999",
           col_select = any_of(keep),
           col_types = cols(TIMESTAMP_START = "c", TIMESTAMP_END = "c", .default = "d")) |>
    mutate(site = site,
           time = as.POSIXct(TIMESTAMP_START, format = "%Y%m%d%H%M", tz = "UTC"),
           .before = 1)
}