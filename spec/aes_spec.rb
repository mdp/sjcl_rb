require File.dirname(__FILE__) + '/spec_helper'

describe "the SJCL AES cipher" do
  describe "scheduling the key" do
    it "should match at 128bits" do
      expectedEnc = [-1029611070, -1587456955, 1398035525, 17593584058368, -473824721, 1118000746, 301400623, 1117979183, -340453629, -1458159255, -1193196730, -96321175, -1019810258, 1780526919, -759043071, 679718248, 665037594, 1300431965, -1623005092, -1212070604, 1338880947, 38713326, -1660133454, 718084742, -764414122, -803127112, 1294802698, 1742734732, 1929679827, -1557802133, -301413279, -1981232659, 1759102580, -872671969, 636803454, -1407446893, -283960603, 619646970, 18601604, -1391999465, 480766576, 944301450, 961753870, -1806371559]
      expectedDec = [480766576, -1806371559, 961753870, 944301450, -286319329, -615496010, 2062433761, -793409572, -2072105771, -1581352105, -1436829123, 1046125251, -1529599379, 199606634, -1811865346, -1171999210, -614676899, -1612389996, 774215400, 519085179, 1932300365, -1312721028, 819268243, -978560474, -1259908556, -2129363473, -176598859, -1233073557, 8079113, 1953312090, 1140431582, 40343647, -1507275254, 932493188, 1100874369, 35446614, 1689034073, 1980413189, 1132649943, -1540091556, -1029611070, 17593584058368, 1398035525, -1587456955]
      cipher = SJCL::Cipher::AES.new([-1029611070, -1587456955, 1398035525, 17593584058368])
      SJCL::BitArray.compare(cipher.key[0], expectedEnc).should be_truthy
      SJCL::BitArray.compare(cipher.key[1], expectedDec).should be_truthy
    end
    it "should match at 256bits" do
      expectedEnc = [1181708080, 1181708080, 1181708080, 1181708080, 1181708080, 1181708080, 1181708080, 1181708080, -272143510, -1448606630, -272143510, -1448606630, -1783784050, -742198594, -1783784050, -742198594, -934361844, 1642512726, -1910396356, 663334502, 1493858749, -1966568701, 526718605, -861412301, -1876490681, -238958831, 2145414445, 1483326283, 871585550, -1187259379, -1503737216, 1794715315, 18246469, -254301100, -1892171399, -681704910, 1034625069, -2070873056, 583939744, 1211570195, -1950673385, 2070723139, -195331270, 587561224, 465606173, -1622119875, -1113695075, -173456242, 2023755761, 63747506, -141046136, -728582272, 1401896912, -857778707, 1900087664, -2065150466, -1555843922, -1601240804, 1461243796, -2088077292]
      expectedDec = [-1555843922, -2088077292, 1461243796, -1601240804, -349970150, 681329711, -584960127, 1016916195, 431432362, 457480884, -564876537, -1173387270, 1389592494, -172067922, -507584670, -675345927, 199160848, -988794445, 1683696893, -1548180144, 1369923852, 335588556, 906090139, -2056489385, 1985048176, -1588912818, -941389395, -1469689536, 507794320, 570522199, -1284661044, -724887717, -1929777810, 1722324195, 1871042797, -566804688, 1011165639, -1855137125, 1738979223, -896580405, -363759219, 153963534, -1313675299, 1389285982, -1389759652, -154505972, -1389759652, -154505972, -478399101, -1197495341, -478399101, -1197495341, 1541643856, 1541643856, 1541643856, 1541643856, 1181708080, 1181708080, 1181708080, 1181708080]
      cipher = SJCL::Cipher::AES.new(SJCL::Codec::UTF8String.toBits("Foo0Foo0Foo0Foo0Foo0Foo0Foo0Foo0"))
      SJCL::BitArray.compare(cipher.key[0], expectedEnc).should be_truthy
      SJCL::BitArray.compare(cipher.key[1], expectedDec).should be_truthy
    end
  end

  describe "encrypt and decrypt cycle" do
    data = SJCL::Codec::UTF8String.toBits("Secrets1Secrets2") # 16 bytes
    key = SJCL::Codec::UTF8String.toBits("Foo0Foo0Foo0Foo0Foo0Foo0Foo0Foo0")
    cipher = SJCL::Cipher::AES.new(key)
    it "should encrypt data" do
      expectedEnc = [1991380212, -38165922, 194830393, 500234942] # Taken from SJCL JS
      enc = cipher.encrypt(data)
      SJCL::BitArray.compare(enc, expectedEnc).should be_truthy
    end
    it "should decrypt data" do
      dec = cipher.decrypt(cipher.encrypt(data))
      SJCL::BitArray.compare(data, dec).should be_truthy
    end
  end
end
