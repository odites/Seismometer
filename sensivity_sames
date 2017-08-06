-- Letto da Resp Iris: secondo rebecca è Count / Volt
-- Secondo IRIS è Count / (m/s) : https://ds.iris.edu/ds/nodes/dmc/data/formats/resp/#meaning-of-numbers-in-rdseed-resp-files


mVcounts sensivity = 1000 / sensivity

counts_teorici = 2^24

fs_overrange sensivity = mVcounts sensivity * counts_teorici

counts sensivity vpp = sensivity * vpp

bit_reali counts = logBase 2 counts


--
-- Elenco stazioni
--

-- INGV Gaia2 con fondo scala a 500mV
vpp_gaia2 = 0.5
counts_gaia2 = 12583365
fs_overrange_gaia2 = 667
sensivity_gaia2 = (1000 / fs_overrange_gaia2) * counts_teorici
mVcounts_gaia2 = 1000 / sensivity_gaia2
counts_calcolati_gaia2 = counts sensivity_gaia2 vpp_gaia2
bit_gaia2 = bit_reali counts_gaia2


-- Solgeo Edax24 Posizione D
vpp_edax = 0.2
sensivity_edax = 5.242880e+07
fs_overrange_edax = 320
mVcounts_edax = mVcounts sensivity_edax
counts_edax = counts sensivity_edax vpp_edax
bit_edax = bit_reali counts_edax


-- Nanometrics Centaur messo a 40V e 250Hz
sensivity_centaur = 4.0e+05
vpp_centaur = 40
counts_centaur = counts sensivity_centaur vpp_centaur
bit_centuar = bit_reali counts_centaur


-- Quanterra Q330HR
sensivity_q330hr = 1.677720E+06
vpp_q330hr = 40
counts_q330hr = counts sensivity_q330hr vpp_q330hr
bit_q330hr = bit_reali counts_q330hr

-- Quanterra Q330HRS non si trovano i Resp ma sembra abbia aumtanto i dB, per cui bo! Verso l'infinito!

-- Guralp Minimus da sito e non da resp!
microVcount_minimus = 2.44
vpp_minimus = 40
sensivity_minimus = 10^6 / microVcount_minimus
counts_minimus = counts sensivity_minimus vpp_minimus
bit_minimus = bit_reali counts_minimus

-- Sara Electronic Instrument SL06
-- Selezionabile 119 o 238 nV / Count
nanoVcount_sl06 = 119
-- Impostato a 2 per i passivi, 4 per gli attivi
vpp_sl06 = 2
sensivity_sl06 = 10^9 / nanoVcount_sl06
counts_sl06 = counts sensivity_sl06 vpp_sl06
bit_sl06 = bit_reali counts_sl06


-- GeoBit SRi32S
sensivity_sri32s = 2.097152e+06
vpp_sri32s = 40
counts_sri32s = counts sensivity_sri32s vpp_sri32s
bit_sri32s = bit_reali counts_sri32s

-- EQMet modello SMA
-- Mi sembra strano che sia esattamente identico al Quanterra! Infatti è un brand di Kinemetrics!
sensivity_sma = 1.677720e+06


-- Lunitek ATLAS
sensivity_atlas = 4.194304e+05
vpp_atlas = 40
counts_atlas = counts sensivity_atlas vpp_atlas
bit_atlas = bit_reali counts_atlas









lista_counts = [counts_edax,counts_gaia2,counts_centaur,counts_q330hr,counts_minimus,counts_sri32s,counts_sl06]
lista_bits = [bit_edax,bit_gaia2,bit_centuar,bit_q330hr,bit_minimus,bit_sri32s,bit_sl06]

differenza = (counts_teorici -)
diff_counts = map differenza lista_counts
diff_log = map (logBase 2 . differenza) lista_counts
diff_bits = map (24 -) lista_bits



main = print lista_bits
