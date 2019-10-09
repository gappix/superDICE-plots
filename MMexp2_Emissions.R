source("OTHER_datamng/ADVANCE_data_management.R")
source("RICEx_datamng/RICEx_50_experiments_data_central_hub.R")
source("RICEx_plots/RICEx_20_line_comparisons_plot.R")
source("RICEx_plots/RICEx_01_export_plots.R")
source("RICEx_plots/RICEx_00_colors_settings.R")

# Retrieve experiments

MMexp = list()
MMexp = experiments_load_as_list(MMexp,"MMexp")


MMexp_QUADFIT      = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDcolfquadfit$UNKclimateModule$UNKdamageModule$UNKsavingRate
MMexp_POWERFIT     = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDpowerfit$UNKclimateModule$UNKdamageModule$UNKsavingRate
MMexp_FXPOWERFIT   = MMexp$UNKvers$UNKruntype$global$UNKssp$noncooppop$maccEDfxpowerfit$UNKclimateModule$UNKdamageModule$UNKsavingRate




## ------------------:   CTAX DIAG 30 gr5   :---------------------


##-------------------------------- 30 gr5  VANILLAS, changing fittype   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
    "quadfit vanilla "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
    ,    "powerfit vanilla "    = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
    ,    "fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty

)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5 VANILLAS"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()


##-------------------------------- 30 gr5   DICE, changing < fit-model , fitto >  :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit dice adv "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxdice_adv$get_worldEMIffi_ty
  , "quadfit dice sspmk "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker$get_worldEMIffi_ty

  ,    "_powerfit vanilla "    = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "      = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit dice sspmk "    = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit dice adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "fxpowerfit dice sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxdice_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, DICE changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()




##-------------------------------- 30 gr5   ALLFREE, changing < fit-model , fitto  >  :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit freefit adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  , "quadfit freefit sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, FREEFIT changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()




##-------------------------------- 30 gr5   ALPHAFX, changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit alphafx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  , "quadfit alphafx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, ALPHAFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()




##-------------------------------- 30 gr5  BACKFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit backfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  , "quadfit backfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, BACKFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()






##-------------------------------- 30 gr5  EXPFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit expfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  , "quadfit expfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit expfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit expfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit expfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit expfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, EXPFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()






##-------------------------------- 30 gr5 xx COMPARE WHATEVER xx   --------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "      = MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit freefit adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit backfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty

  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 gr5, best-cases"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_gr5


plotCTAX()





######################################################################################################::
######################################################################################################::
######################################################################################################::


## ------------------:   CTAX DIAG 80 gr5   :---------------------


##-------------------------------- 80 gr5  VANILLAS, changing fittype   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit vanilla "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5 VANILLAS"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()


##-------------------------------- 80 gr5   DICE, changing < fit-model , fitto >  :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit dice adv "          =  MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxdice_adv$get_worldEMIffi_ty
  , "quadfit dice sspmk "        =  MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "      = MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "      = MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit dice sspmk "    = MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit dice adv "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "fxpowerfit dice sspmk "= MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxdice_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, DICE changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()




##-------------------------------- 80 gr5   ALLFREE, changing < fit-model , fitto  >  :---------------------

EXPdata  = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit freefit adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  , "quadfit freefit sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
 
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, FREEFIT changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()




##-------------------------------- 80 gr5   ALPHAFX, changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit alphafx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  , "quadfit alphafx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, ALPHAFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()




##-------------------------------- 80 gr5  BACKFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =  MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit backfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  , "quadfit backfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          = MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "      = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, BACKFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()






##-------------------------------- 80 gr5  EXPFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                = MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit expfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  , "quadfit expfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit expfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit expfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "     = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit expfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit expfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, EXPFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()






##-------------------------------- 80 gr5 xx COMPARE WHATEVER xx   --------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "          =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit freefit adv "       =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk "      =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit backfx adv "         =    MMexp_QUADFIT$runCTAX_DIAG_C80_gr5_xxbackfxfit_adv$get_worldEMIffi_ty
  
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_gr5_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 gr5, best-cases"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_gr5


plotCTAX()


##### ::::::: --------------
######################################################################################################::
######################################################################################################::
######################################################################################################::

## ------------------:   CTAX DIAG 80 CONST   :---------------------


##-------------------------------- 80 const  VANILLAS, changing fittype   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit vanilla "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const VANILLAS"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()


##-------------------------------- 80 const   DICE, changing < fit-model , fitto >  :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit dice adv "          =  MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxdice_adv$get_worldEMIffi_ty
  , "quadfit dice sspmk "        =  MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "      = MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "      = MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit dice sspmk "    = MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit dice adv "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxdice_adv$get_worldEMIffi_ty
  ,    "fxpowerfit dice sspmk "= MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, DICE changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()




##-------------------------------- 80 const   ALLFREE, changing < fit-model , fitto  >  :---------------------

EXPdata  = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit freefit adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  , "quadfit freefit sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, FREEFIT changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()




##-------------------------------- 80 const   ALPHAFX, changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit alphafx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxalphafxfit_adv$get_worldEMIffi_ty
  , "quadfit alphafx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, ALPHAFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()




##-------------------------------- 80 const  BACKFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =  MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit backfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv$get_worldEMIffi_ty
  , "quadfit backfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          = MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "      = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, BACKFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()






##-------------------------------- 80 const  EXPFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                = MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit expfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxexpfxfit_adv$get_worldEMIffi_ty
  , "quadfit expfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit expfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit expfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "     = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit expfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit expfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, EXPFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()






##-------------------------------- 80 const xx COMPARE WHATEVER xx   --------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "          =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit freefit adv "       =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk "      =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit backfx adv "         =    MMexp_QUADFIT$runCTAX_DIAG_C80_const_xxbackfxfit_adv$get_worldEMIffi_ty
  
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C80_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 80 const, best-cases"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C80_const


plotCTAX()



##### ::::::: --------------
######################################################################################################::
######################################################################################################::
######################################################################################################::

## ------------------:   CTAX DIAG 30 CONST   :---------------------


##-------------------------------- 30 const  VANILLAS, changing fittype   :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit vanilla "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const VANILLAS"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()


##-------------------------------- 30 const   DICE, changing < fit-model , fitto >  :---------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit dice adv "          =  MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxdice_adv$get_worldEMIffi_ty
  , "quadfit dice sspmk "        =  MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "      = MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "      = MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit dice sspmk "    = MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit dice adv "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxdice_adv$get_worldEMIffi_ty
  ,    "fxpowerfit dice sspmk "= MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxdice_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, DICE changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




##-------------------------------- 30 const   ALLFREE, changing < fit-model , fitto  >  :---------------------

EXPdata  = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit freefit adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  , "quadfit freefit sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit freefit adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, FREEFIT changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




##-------------------------------- 30 const   ALPHAFX, changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =   MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit alphafx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxalphafxfit_adv$get_worldEMIffi_ty
  , "quadfit alphafx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =  MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "       = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxalphafxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit alphafx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, ALPHAFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()




##-------------------------------- 30 const  BACKFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =  MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit backfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv$get_worldEMIffi_ty
  , "quadfit backfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          = MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit backfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit backfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "      = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit backfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit backfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxbackfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, BACKFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()






##-------------------------------- 30 const  EXPFX , changing < fit-model , fitto  > :--------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                = MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  , "quadfit expfx adv "          =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxexpfxfit_adv$get_worldEMIffi_ty
  , "quadfit expfx sspmk "        =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_powerfit vanilla "          =MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit expfx adv "      =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "powerfit expfx sspmk "    =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  ,    "_fxpowerfit vanilla "     = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit expfx adv "    = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxexpfxfit_adv$get_worldEMIffi_ty
  ,    "fxpowerfit expfx sspmk "  = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxexpfxfit_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, EXPFX changing < fit-MODEL, fit-TO >"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()






##-------------------------------- 30 const xx COMPARE WHATEVER xx   --------------------------------

EXPdata   = list(
  # "Base"        = BAU$get_worldEMIffi_ty
  "_quadfit vanilla "                =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit dice adv "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxdice_adv$get_worldEMIffi_ty
  ,    "powerfit freefit adv "       =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_adv$get_worldEMIffi_ty
  ,    "powerfit freefit sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit freefit sspmk "      =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "fxpowerfit freefit sspmk "   = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxfreefit_ssp2marker$get_worldEMIffi_ty
  ,    "powerfit alphafx sspmk "     =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxalphafxfit_ssp2marker$get_worldEMIffi_ty
  ,    "quadfit backfx adv "         =    MMexp_QUADFIT$runCTAX_DIAG_C30_const_xxbackfxfit_adv$get_worldEMIffi_ty
  
  
  ,    "_powerfit vanilla "          =   MMexp_POWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  ,    "_fxpowerfit vanilla "        = MMexp_FXPOWERFIT$runCTAX_DIAG_C30_const_xxvanilla_ssp2marker$get_worldEMIffi_ty
  
  
)
EXPtitle  = "World Emissions under CTAX DIAG 30 const, best-cases"
EXPylabel = "World Emissions [GtCO2]"
EXPlegend = "Experiments"


ADVANCE_MODELS = ADVANCE_CO2_WORLD$DIAG_C30_const


plotCTAX()



## -----------------: PLOT CTAX FUNCTION :-----------------------------------------------

plotMIU <- function(){
  
      
    
    mytitle  =  paste0( "MIU values for DIAG 30 gr5 - ", expName  )
    myYlabel =  "Abatement [%BAU]"
    myLegend =  "Regions"
  
  plottigat = ggplot() + 


    # MY DATA
    
    geom_line(data = MIUdata_nty, aes(year,value, color=n), size = 1.2)  +  
    
    
    # graphic details
    
    guides(colour=guide_legend(ncol=3)) +
    scale_color_manual(
                       values = colorize_regions("ed57")) +
    
    
    theme( legend.text   = element_text(size = 13),
           legend.title  = element_text(size = 16),
           plot.title    = element_text(size = 18),
           axis.title.x  = element_text(size = 16),
           axis.text.x   = element_text(size = 14),
           axis.title.y  = element_text(size = 16)  ) +
    
    labs (color = myLegend) + 
    ggtitle(mytitle) + 
    xlab("Year") +
    ylab(myYlabel)  ;
  return(plottigat)
  
}



# Plottigat
plotCTAX <- function(){

  mytitle  =  EXPtitle
  myYlabel =  EXPylabel
  myLegend =  EXPlegend
  
  mydf   <- cbind(cat=rep(names(EXPdata),sapply(EXPdata,nrow)),do.call(rbind,EXPdata))
  
  
  

plottigat = ggplot() + 
  
  #ADVANCE

  geom_line(data= ADVANCE_MODELS,
            aes(x=year, y=value, group = model, color = "__ADVANCE"),
            size = 0.8)  +
  
  geom_smooth(data= ADVANCE_MODELS,
              aes(x=year, y=value,  color = "__MEDIAN"),
              size = 1.1,  linetype = "dashed", se = F, span = 0.2) +
  
  # MY DATA
  
  geom_line(data = mydf, aes(year,value, color=cat), size = 1.2)  +  

  
  # graphic details
  
  guides(colour=guide_legend(ncol=1)) +
  scale_color_manual(breaks= c("_ADVANCE","_MEDIAN",names(EXPdata)),
                     values = c("grey","black", wes_palette(name = "Darjeeling1"), wes_palette(name = "GrandBudapest2"),
                                
                                
                                
                                
                                "#f77f2f", #orange
                                "#db0f20", 
                                "red",      # red
                                
                                "#d64cf5", # pink
                                
                                "#8232c7", #violet
                                "#450094",
                                
                                "blue",   #blue
                                "#0f86db",
                                "#0ccfab",
                                
                                "green",  #greens
                                
                                "#32c738",  
                                "#046918",
                                
                                
                                
                                "#c4570e",  # brown
                                "#fff100",  #yellow
                                "#9c4317"
                     )) +
  
  
  theme( legend.text   = element_text(size = 13, margin = margin(t = 10)),
         #legend.spacing.y = unit(10.0, 'mm'),

         legend.title  = element_text(size = 16),
         plot.title    = element_text(size = 18),
         axis.title.x  = element_text(size = 16),
         axis.text.x   = element_text(size = 14),
         axis.title.y  = element_text(size = 16)  ) +
  
  labs (color = myLegend) + 
  ggtitle(mytitle) + 
  xlab("Year") +
  ylab(myYlabel)  ; 

return(plottigat)
}
