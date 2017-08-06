-- Count disponibili
count bit = 2 ** bit

-- Count su V / m/s che sono un po' la risoluzione reale 
count_su_volt vpp bit = (count bit) / vpp

-- m/s che in teoria rappresentano la massima velocità della massa che un sensore con un certo guadagno e che quindi non risentono del digitalizzatore
massima_velocita vpp gain sensivity =  (vpp / gain) / sensivity

-- m/s che in teoria rappresentano la minima velocità apprezzabile che un sensore può avere con un certo guadagno e con un una certa rappresentazione in bit
minima_velocita vpp gain sensivity bit = massima_velocita vpp gain sensivity / count bit 

-- Tupla con massimo e minimo
m_m sensivity vpp gain bit = (massima_velocita vpp gain sensivity , minima_velocita vpp gain sensivity bit)

sorso :: Digitizer -> Sensor -> Gain -> (Velocity , Velocity)
--sorso dig sens gain =  


-- Arrotondo per vedere meglio
pow x = round $ x * (10 ** 14)
powa (x,y) = (x , y) --(pow x , pow y)



-- Definizione di velocità
type Velocity = Float
type Gain = Int


-- Lista sensibilità dei vari sensori
type Sensor = Int
s13 :: Sensor
s13 = 629

mkiii :: Sensor
mkiii = 800

mkii :: Sensor
mkii = 400

posthole :: Sensor
posthole = 750

trillium40 :: Sensor
trillium40 = 1500



-- Lista di digitalizzatori

type Digitizer = (Int , Float)


gaia2 :: Digitizer
gaia2 = (16 , 23.58)

centaur :: Digitizer
centaur = (40 , 24)

q330hrs :: Digitizer
q330hrs = (40 , 26)

sri32l :: Digitizer
sri32l = (40, 32)


main = do
    print $ "INGV Gaia2 500 mV con Teledyne Geotech S13"
    print $ powa $ m_m s13 16 32 23.58
    
    print $ "INGV Gaia2 500 mV con Lennarz 3D-Lite mkii"
    print $ powa $ m_m mkii 16 32 23.58
    
    print $ "INGV Gaia2 500 mV con Lennarz 3D-Lite mkiii"
    print $ powa $ m_m mkiii 16 32 23.58
    
    print $ "INGV Gaia2 20 V con Nanometrics Trillium 40"
    print $ powa $ m_m trillium40 16 0.8 23.58
    
    print $ "Nanometrics Centaur 20 V con Nanometrics Posthole Compact"
    print $ powa $ m_m posthole 40 2 24

    print $ "Kinemetrics HRS 40V con S13"
    print $ powa $ m_m s13 40 1 26
