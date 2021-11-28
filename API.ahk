; =================================================================================================
; Developer: Abrucci
; You may use, distribute and modify this code under the
; terms of the GNU GPLv3 license!
; 
; You can check the GNU GPLv3 License under https://www.gnu.org/licenses/gpl-3.0.de.html
; =================================================================================================

#NoEnv 
PATH_OVERLAY := A_AppData "\Muchbinder\Overlay.dll"

hModule := DllCall("LoadLibrary", Str, PATH_OVERLAY)
if(hModule == -1 || hModule == 0)
{
	MsgBox, 48, Error, Die DLL für Overlays wurde nicht gefunden!
	ExitApp
}

; =================================================================================================
; | Globals
; =================================================================================================
global cities := []
cities.Push(Object("NAME", "Las Venturas", "X1", 685.0, "Y1", 476.093, "X2", 3000.0, "Y2", 3000.0))
cities.Push(Object("NAME", "San Fierro", "X1", -3000.0, "Y1", -742.306, "X2", -1270.53, "Y2", 1530.24))
cities.Push(Object("NAME", "San Fierro", "X1", -1270.53, "Y1", -402.481, "X2", -1038.45, "Y2", 832.495))
cities.Push(Object("NAME", "San Fierro", "X1", -1038.45, "Y1", -145.539, "X2", -897.546, "Y2", 376.632))
cities.Push(Object("NAME", "Los Santos", "X1", 480.0, "Y1", -3000.0, "X2", 3000.0, "Y2", -850.0))
cities.Push(Object("NAME", "Los Santos", "X1", 80.0, "Y1", -2101.61, "X2", 1075.0, "Y2", -1239.61))
cities.Push(Object("NAME", "Tierra Robada", "X1", -1213.91, "Y1", 596.349, "X2", -480.539, "Y2", 1659.68))
cities.Push(Object("NAME", "Red County", "X1", -1213.91, "Y1", -768.027, "X2", 2997.06, "Y2", 596.349))
cities.Push(Object("NAME", "Flint County", "X1", -1213.91, "Y1", -2892.97, "X2", 44.6147, "Y2", -768.027))
cities.Push(Object("NAME", "Whetstone", "X1", -2997.47, "Y1", -2892.97, "X2", -1213.91, "Y2", -1115.58))

global zones := []
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2667.810, "Y1", -302.135, "X2", -2646.400, "Y2", -262.320))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1315.420, "Y1", -405.388, "X2", -1264.400, "Y2", -209.543))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2550.040, "Y1", -355.493, "X2", -2470.040, "Y2", -318.493))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1490.330, "Y1", -209.543, "X2", -1264.400, "Y2", -148.388))
zones.Push(Object("NAME", "Garcia", "X1", -2395.140, "Y1", -222.589, "X2", -2354.090, "Y2", -204.792))
zones.Push(Object("NAME", "Shady Cabin", "X1", -1632.830, "Y1", -2263.440, "X2", -1601.330, "Y2", -2231.790))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1494.030, "X2", 2421.030, "Y2", -1454.350))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1236.630, "Y1", 1163.410, "X2", 1277.050, "Y2", 1203.280))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1277.050, "Y1", 1044.690, "X2", 1315.350, "Y2", 1087.630))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2470.040, "Y1", -355.493, "X2", -2270.040, "Y2", -318.493))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -926.999, "X2", 1357.000, "Y2", -910.170))
zones.Push(Object("NAME", "Unity Station", "X1", 1692.620, "Y1", -1971.800, "X2", 1812.620, "Y2", -1932.800))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1315.350, "Y1", 1044.690, "X2", 1375.600, "Y2", 1087.630))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1454.350, "X2", 2632.830, "Y2", -1393.420))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1858.100, "X2", 2495.090, "Y2", 1970.850))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -787.391, "X2", -956.476, "Y2", -768.027))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1170.870, "X2", 1463.900, "Y2", -1130.850))
zones.Push(Object("NAME", "Esplanade East", "X1", -1620.300, "Y1", 1176.520, "X2", -1580.010, "Y2", 1274.260))
zones.Push(Object("NAME", "Market Station", "X1", 787.461, "Y1", -1410.930, "X2", 866.009, "Y2", -1310.210))
zones.Push(Object("NAME", "Linden Station", "X1", 2811.250, "Y1", 1229.590, "X2", 2861.250, "Y2", 1407.590))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1582.440, "Y1", 347.457, "X2", 1664.620, "Y2", 401.750))
zones.Push(Object("NAME", "Frederick Bridge", "X1", 2759.250, "Y1", 296.501, "X2", 2774.250, "Y2", 594.757))
zones.Push(Object("NAME", "Yellow Bell Station", "X1", 1377.480, "Y1", 2600.430, "X2", 1492.450, "Y2", 2687.360))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1507.510, "Y1", -1385.210, "X2", 1582.550, "Y2", -1325.310))
zones.Push(Object("NAME", "Jefferson", "X1", 2185.330, "Y1", -1210.740, "X2", 2281.450, "Y2", -1154.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1318.130, "Y1", -910.170, "X2", 1357.000, "Y2", -768.027))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2361.510, "Y1", -417.199, "X2", -2270.040, "Y2", -355.493))
zones.Push(Object("NAME", "Jefferson", "X1", 1996.910, "Y1", -1449.670, "X2", 2056.860, "Y2", -1350.720))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1236.630, "Y1", 2142.860, "X2", 1297.470, "Y2", 2243.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2124.660, "Y1", -1494.030, "X2", 2266.210, "Y2", -1449.670))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1848.400, "Y1", 2478.490, "X2", 1938.800, "Y2", 2553.490))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1570.200, "X2", 466.223, "Y2", -1406.050))
zones.Push(Object("NAME", "Cranberry Station", "X1", -2007.830, "Y1", 56.306, "X2", -1922.000, "Y2", 224.782))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1391.050, "Y1", -1026.330, "X2", 1463.900, "Y2", -926.999))
zones.Push(Object("NAME", "Redsands West", "X1", 1704.590, "Y1", 2243.230, "X2", 1777.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Little Mexico", "X1", 1758.900, "Y1", -1722.260, "X2", 1812.620, "Y2", -1577.590))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1375.600, "Y1", 823.228, "X2", 1457.390, "Y2", 919.447))
zones.Push(Object("NAME", "Los Santos International", "X1", 1974.630, "Y1", -2394.330, "X2", 2089.000, "Y2", -2256.590))
zones.Push(Object("NAME", "Beacon Hill", "X1", -399.633, "Y1", -1075.520, "X2", -319.033, "Y2", -977.516))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1501.950, "X2", 422.680, "Y2", -1406.050))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1369.620, "X2", 334.503, "Y2", -1292.070))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1250.900, "X2", 1812.620, "Y2", -1150.870))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1703.230, "X2", 2137.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1378.330, "Y1", -1130.850, "X2", 1463.900, "Y2", -1026.330))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1197.390, "Y1", 1044.690, "X2", 1277.050, "Y2", 1163.390))
zones.Push(Object("NAME", "Conference Center", "X1", 1073.220, "Y1", -1842.270, "X2", 1323.900, "Y2", -1804.210))
zones.Push(Object("NAME", "Montgomery", "X1", 1451.400, "Y1", 347.457, "X2", 1582.440, "Y2", 420.802))
zones.Push(Object("NAME", "Foster Valley", "X1", -2270.040, "Y1", -430.276, "X2", -2178.690, "Y2", -324.114))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1325.600, "Y1", 596.349, "X2", 1375.600, "Y2", 795.010))
zones.Push(Object("NAME", "Los Santos International", "X1", 2051.630, "Y1", -2597.260, "X2", 2152.450, "Y2", -2394.330))
zones.Push(Object("NAME", "Mulholland", "X1", 1096.470, "Y1", -910.170, "X2", 1169.130, "Y2", -768.027))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1457.460, "Y1", 2723.230, "X2", 1534.560, "Y2", 2863.230))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 1783.230, "X2", 2162.390, "Y2", 1863.230))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1210.740, "X2", 2185.330, "Y2", -1126.320))
zones.Push(Object("NAME", "Mulholland", "X1", 952.604, "Y1", -937.184, "X2", 1096.470, "Y2", -860.619))
zones.Push(Object("NAME", "Aldea Malvada", "X1", -1372.140, "Y1", 2498.520, "X2", -1277.590, "Y2", 2615.350))
zones.Push(Object("NAME", "Las Colinas", "X1", 2126.860, "Y1", -1126.320, "X2", 2185.330, "Y2", -934.489))
zones.Push(Object("NAME", "Las Colinas", "X1", 1994.330, "Y1", -1100.820, "X2", 2056.860, "Y2", -920.815))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -954.662, "X2", 768.694, "Y2", -860.619))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1277.050, "Y1", 1087.630, "X2", 1375.600, "Y2", 1203.280))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1377.390, "Y1", 2433.230, "X2", 1534.560, "Y2", 2507.230))
zones.Push(Object("NAME", "Willowfield", "X1", 2201.820, "Y1", -2095.000, "X2", 2324.000, "Y2", -1989.900))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1704.590, "Y1", 2342.830, "X2", 1848.400, "Y2", 2433.230))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1130.850, "X2", 1378.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Little Mexico", "X1", 1701.900, "Y1", -1842.270, "X2", 1812.620, "Y2", -1722.260))
zones.Push(Object("NAME", "Queens", "X1", -2411.220, "Y1", 373.539, "X2", -2253.540, "Y2", 458.411))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1515.810, "Y1", 1586.400, "X2", 1729.950, "Y2", 1714.560))
zones.Push(Object("NAME", "Richman", "X1", 225.165, "Y1", -1292.070, "X2", 466.223, "Y2", -1235.070))
zones.Push(Object("NAME", "Temple", "X1", 1252.330, "Y1", -1026.330, "X2", 1391.050, "Y2", -926.999))
zones.Push(Object("NAME", "East Los Santos", "X1", 2266.260, "Y1", -1494.030, "X2", 2381.680, "Y2", -1372.040))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2623.180, "Y1", 943.235, "X2", 2749.900, "Y2", 1055.960))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -1941.400, "X2", 2703.580, "Y2", -1852.870))
zones.Push(Object("NAME", "Las Colinas", "X1", 2056.860, "Y1", -1126.320, "X2", 2126.860, "Y2", -920.815))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2625.160, "Y1", 2202.760, "X2", 2685.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1501.950, "X2", 334.503, "Y2", -1369.620))
zones.Push(Object("NAME", "Las Brujas", "X1", -365.167, "Y1", 2123.010, "X2", -208.570, "Y2", 2217.680))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2536.430, "Y1", 2442.550, "X2", 2685.160, "Y2", 2542.550))
zones.Push(Object("NAME", "Rodeo", "X1", 334.503, "Y1", -1406.050, "X2", 466.223, "Y2", -1292.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.557, "Y1", -1227.280, "X2", 787.461, "Y2", -1118.280))
zones.Push(Object("NAME", "Rodeo", "X1", 422.680, "Y1", -1684.650, "X2", 558.099, "Y2", -1570.200))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2498.210, "Y1", 2542.550, "X2", 2685.160, "Y2", 2626.550))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1724.760, "Y1", -1430.870, "X2", 1812.620, "Y2", -1250.900))
zones.Push(Object("NAME", "Rodeo", "X1", 225.165, "Y1", -1684.650, "X2", 312.803, "Y2", -1501.950))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1449.670, "X2", 2266.210, "Y2", -1372.040))
zones.Push(Object("NAME", "Hampton Barns", "X1", 603.035, "Y1", 264.312, "X2", 761.994, "Y2", 366.572))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1130.840, "X2", 1252.330, "Y2", -1026.330))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1087.930, "Y1", 855.370, "X2", -961.950, "Y2", 986.281))
zones.Push(Object("NAME", "Verona Beach", "X1", 1046.150, "Y1", -1722.260, "X2", 1161.520, "Y2", -1577.590))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1722.260, "X2", 1440.900, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 1357.000, "Y1", -926.999, "X2", 1463.900, "Y2", -768.027))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1570.200, "X2", 558.099, "Y2", -1385.070))
zones.Push(Object("NAME", "Mulholland", "X1", 911.802, "Y1", -860.619, "X2", 1096.470, "Y2", -768.027))
zones.Push(Object("NAME", "Mulholland", "X1", 768.694, "Y1", -954.662, "X2", 952.604, "Y2", -860.619))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 2377.390, "Y1", 788.894, "X2", 2537.390, "Y2", 897.901))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1852.870, "X2", 1971.660, "Y2", -1742.310))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2089.000, "Y1", -2394.330, "X2", 2201.820, "Y2", -2235.840))
zones.Push(Object("NAME", "Commerce", "X1", 1370.850, "Y1", -1577.590, "X2", 1463.900, "Y2", -1384.950))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2121.400, "Y1", 2508.230, "X2", 2237.400, "Y2", 2663.170))
zones.Push(Object("NAME", "Temple", "X1", 1096.470, "Y1", -1026.330, "X2", 1252.330, "Y2", -910.170))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1449.670, "X2", 1996.910, "Y2", -1350.720))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1242.980, "Y1", -50.096, "X2", -1213.910, "Y2", 578.396))
zones.Push(Object("NAME", "Martin Bridge", "X1", -222.179, "Y1", 293.324, "X2", -122.126, "Y2", 476.465))
zones.Push(Object("NAME", "The Strip", "X1", 2106.700, "Y1", 1863.230, "X2", 2162.390, "Y2", 2202.760))
zones.Push(Object("NAME", "Willowfield", "X1", 2541.700, "Y1", -2059.230, "X2", 2703.580, "Y2", -1941.400))
zones.Push(Object("NAME", "Marina", "X1", 807.922, "Y1", -1577.590, "X2", 926.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1143.210, "X2", 1777.400, "Y2", 1203.280))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1742.310, "X2", 1951.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Esplanade East", "X1", -1580.010, "Y1", 1025.980, "X2", -1499.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1370.850, "Y1", -1384.950, "X2", 1463.900, "Y2", -1170.870))
zones.Push(Object("NAME", "The Mako Span", "X1", 1664.620, "Y1", 401.750, "X2", 1785.140, "Y2", 567.203))
zones.Push(Object("NAME", "Rodeo", "X1", 312.803, "Y1", -1684.650, "X2", 422.680, "Y2", -1501.950))
zones.Push(Object("NAME", "Pershing Square", "X1", 1440.900, "Y1", -1722.260, "X2", 1583.500, "Y2", -1577.590))
zones.Push(Object("NAME", "Mulholland", "X1", 687.802, "Y1", -860.619, "X2", 911.802, "Y2", -768.027))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.070, "Y1", 1490.470, "X2", -2616.400, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Colinas", "X1", 2185.330, "Y1", -1154.590, "X2", 2281.450, "Y2", -934.489))
zones.Push(Object("NAME", "Mulholland", "X1", 1169.130, "Y1", -910.170, "X2", 1318.130, "Y2", -768.027))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1938.800, "Y1", 2508.230, "X2", 2121.400, "Y2", 2624.230))
zones.Push(Object("NAME", "Commerce", "X1", 1667.960, "Y1", -1577.590, "X2", 1812.620, "Y2", -1430.870))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1544.170, "X2", 225.165, "Y2", -1404.970))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2536.430, "Y1", 2202.760, "X2", 2625.160, "Y2", 2442.550))
zones.Push(Object("NAME", "Rodeo", "X1", 72.648, "Y1", -1684.650, "X2", 225.165, "Y2", -1544.170))
zones.Push(Object("NAME", "Market", "X1", 952.663, "Y1", -1310.210, "X2", 1072.660, "Y2", -1130.850))
zones.Push(Object("NAME", "Las Colinas", "X1", 2632.740, "Y1", -1135.040, "X2", 2747.740, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 861.085, "Y1", -674.885, "X2", 1156.550, "Y2", -600.896))
zones.Push(Object("NAME", "King's", "X1", -2253.540, "Y1", 373.539, "X2", -1993.280, "Y2", 458.411))
zones.Push(Object("NAME", "Redsands East", "X1", 1848.400, "Y1", 2342.830, "X2", 2011.940, "Y2", 2478.490))
zones.Push(Object("NAME", "Downtown", "X1", -1580.010, "Y1", 744.267, "X2", -1499.890, "Y2", 1025.980))
zones.Push(Object("NAME", "Conference Center", "X1", 1046.150, "Y1", -1804.210, "X2", 1323.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Richman", "X1", 647.557, "Y1", -1118.280, "X2", 787.461, "Y2", -954.662))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", 277.411, "X2", -2867.850, "Y2", 458.411))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 930.890, "X2", 1166.530, "Y2", 1044.690))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1100.820, "X2", 1994.330, "Y2", -973.380))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1375.600, "Y1", 919.447, "X2", 1457.370, "Y2", 1203.280))
zones.Push(Object("NAME", "Regular Tom", "X1", -405.770, "Y1", 1712.860, "X2", -276.719, "Y2", 1892.750))
zones.Push(Object("NAME", "Verona Beach", "X1", 1161.520, "Y1", -1722.260, "X2", 1323.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2281.450, "Y1", -1372.040, "X2", 2381.680, "Y2", -1135.040))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2137.400, "Y1", 1703.230, "X2", 2437.390, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1951.660, "Y1", -1742.310, "X2", 2124.660, "Y2", -1602.310))
zones.Push(Object("NAME", "Pilgrim", "X1", 2624.400, "Y1", 1383.230, "X2", 2685.160, "Y2", 1783.230))
zones.Push(Object("NAME", "Idlewood", "X1", 2124.660, "Y1", -1742.310, "X2", 2222.560, "Y2", -1494.030))
zones.Push(Object("NAME", "Queens", "X1", -2533.040, "Y1", 458.411, "X2", -2329.310, "Y2", 578.396))
zones.Push(Object("NAME", "Downtown", "X1", -1871.720, "Y1", 1176.420, "X2", -1620.300, "Y2", 1274.260))
zones.Push(Object("NAME", "Commerce", "X1", 1583.500, "Y1", -1722.260, "X2", 1758.900, "Y2", -1577.590))
zones.Push(Object("NAME", "East Los Santos", "X1", 2381.680, "Y1", -1454.350, "X2", 2462.130, "Y2", -1135.040))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1577.590, "X2", 807.922, "Y2", -1416.250))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1404.970, "X2", 225.165, "Y2", -1235.070))
zones.Push(Object("NAME", "Vinewood", "X1", 647.712, "Y1", -1416.250, "X2", 787.461, "Y2", -1227.280))
zones.Push(Object("NAME", "East Los Santos", "X1", 2222.560, "Y1", -1628.530, "X2", 2421.030, "Y2", -1494.030))
zones.Push(Object("NAME", "Rodeo", "X1", 558.099, "Y1", -1684.650, "X2", 647.522, "Y2", -1384.930))
zones.Push(Object("NAME", "Easter Tunnel", "X1", -1709.710, "Y1", -833.034, "X2", -1446.010, "Y2", -730.118))
zones.Push(Object("NAME", "Rodeo", "X1", 466.223, "Y1", -1385.070, "X2", 647.522, "Y2", -1235.070))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2202.760, "X2", 2011.940, "Y2", 2342.830))
zones.Push(Object("NAME", "The Clown's Pocket", "X1", 2162.390, "Y1", 1783.230, "X2", 2437.390, "Y2", 1883.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1971.660, "Y1", -1852.870, "X2", 2222.560, "Y2", -1742.310))
zones.Push(Object("NAME", "Montgomery Intersection", "X1", 1546.650, "Y1", 208.164, "X2", 1745.830, "Y2", 347.457))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -2235.840, "X2", 2201.820, "Y2", -1989.900))
zones.Push(Object("NAME", "Temple", "X1", 952.663, "Y1", -1130.840, "X2", 1096.470, "Y2", -937.184))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1848.400, "Y1", 2553.490, "X2", 1938.800, "Y2", 2863.230))
zones.Push(Object("NAME", "Los Santos International", "X1", 1400.970, "Y1", -2669.260, "X2", 2189.820, "Y2", -2597.260))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1213.910, "Y1", 950.022, "X2", -1087.930, "Y2", 1178.930))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1339.890, "Y1", 828.129, "X2", -1213.910, "Y2", 1057.040))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1339.890, "Y1", 599.218, "X2", -1213.910, "Y2", 828.129))
zones.Push(Object("NAME", "Kincaid Bridge", "X1", -1213.910, "Y1", 721.111, "X2", -1087.930, "Y2", 950.022))
zones.Push(Object("NAME", "Verona Beach", "X1", 930.221, "Y1", -2006.780, "X2", 1073.220, "Y2", -1804.210))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1073.220, "Y1", -2006.780, "X2", 1249.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1130.840, "X2", 952.604, "Y2", -954.662))
zones.Push(Object("NAME", "Vinewood", "X1", 787.461, "Y1", -1310.210, "X2", 952.663, "Y2", -1130.840))
zones.Push(Object("NAME", "Commerce", "X1", 1463.900, "Y1", -1577.590, "X2", 1667.960, "Y2", -1430.870))
zones.Push(Object("NAME", "Market", "X1", 787.461, "Y1", -1416.250, "X2", 1072.660, "Y2", -1310.210))
zones.Push(Object("NAME", "Rockshore West", "X1", 2377.390, "Y1", 596.349, "X2", 2537.390, "Y2", 788.894))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 2237.400, "Y1", 2542.550, "X2", 2498.210, "Y2", 2663.170))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1668.130, "X2", 2747.740, "Y2", -1393.420))
zones.Push(Object("NAME", "Fallow Bridge", "X1", 434.341, "Y1", 366.572, "X2", 603.035, "Y2", 555.680))
zones.Push(Object("NAME", "Willowfield", "X1", 2089.000, "Y1", -1989.900, "X2", 2324.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Chinatown", "X1", -2274.170, "Y1", 578.396, "X2", -2078.670, "Y2", 744.170))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2337.180, "X2", 8.430, "Y2", 2487.180))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2145.100, "X2", 2703.580, "Y2", -2059.230))
zones.Push(Object("NAME", "Easter Bay Chemicals", "X1", -1132.820, "Y1", -768.027, "X2", -956.476, "Y2", -578.118))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1703.230, "X2", 2027.400, "Y2", 1863.230))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -430.276, "X2", -2831.890, "Y2", -222.589))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -860.619, "X2", 687.802, "Y2", -768.027))
zones.Push(Object("NAME", "Green Palms", "X1", 176.581, "Y1", 1305.450, "X2", 338.658, "Y2", 1520.720))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -768.027, "X2", 700.794, "Y2", -674.885))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2162.390, "Y1", 1883.230, "X2", 2437.390, "Y2", 2012.180))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1668.130, "X2", 2959.350, "Y2", -1498.620))
zones.Push(Object("NAME", "Jefferson", "X1", 2056.860, "Y1", -1372.040, "X2", 2281.450, "Y2", -1210.740))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1290.870, "X2", 1724.760, "Y2", -1150.870))
zones.Push(Object("NAME", "Downtown Los Santos", "X1", 1463.900, "Y1", -1430.870, "X2", 1724.760, "Y2", -1290.870))
zones.Push(Object("NAME", "Garver Bridge", "X1", -1499.890, "Y1", 696.442, "X2", -1339.890, "Y2", 925.353))
zones.Push(Object("NAME", "Julius Thruway South", "X1", 1457.390, "Y1", 823.228, "X2", 2377.390, "Y2", 863.229))
zones.Push(Object("NAME", "East Los Santos", "X1", 2421.030, "Y1", -1628.530, "X2", 2632.830, "Y2", -1454.350))
zones.Push(Object("NAME", "Greenglass College", "X1", 964.391, "Y1", 1044.690, "X2", 1197.390, "Y2", 1203.220))
zones.Push(Object("NAME", "Las Colinas", "X1", 2747.740, "Y1", -1120.040, "X2", 2959.350, "Y2", -945.035))
zones.Push(Object("NAME", "Mulholland", "X1", 737.573, "Y1", -768.027, "X2", 1142.290, "Y2", -674.885))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2730.880, "X2", 2324.000, "Y2", -2418.330))
zones.Push(Object("NAME", "East Los Santos", "X1", 2462.130, "Y1", -1454.350, "X2", 2581.730, "Y2", -1135.040))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1722.330, "X2", 2632.830, "Y2", -1628.530))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2831.890, "Y1", -430.276, "X2", -2646.400, "Y2", -222.589))
zones.Push(Object("NAME", "Willowfield", "X1", 1970.620, "Y1", -2179.250, "X2", 2089.000, "Y2", -1852.870))
zones.Push(Object("NAME", "Esplanade North", "X1", -1982.320, "Y1", 1274.260, "X2", -1524.240, "Y2", 1358.900))
zones.Push(Object("NAME", "The High Roller", "X1", 1817.390, "Y1", 1283.230, "X2", 2027.390, "Y2", 1469.230))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2201.820, "Y1", -2418.330, "X2", 2324.000, "Y2", -2095.000))
zones.Push(Object("NAME", "Last Dime Motel", "X1", 1823.080, "Y1", 596.349, "X2", 1997.220, "Y2", 823.228))
zones.Push(Object("NAME", "Bayside Marina", "X1", -2353.170, "Y1", 2275.790, "X2", -2153.170, "Y2", 2475.790))
zones.Push(Object("NAME", "King's", "X1", -2329.310, "Y1", 458.411, "X2", -1993.280, "Y2", 578.396))
zones.Push(Object("NAME", "El Corona", "X1", 1692.620, "Y1", -2179.250, "X2", 1812.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Blackfield Chapel", "X1", 1375.600, "Y1", 596.349, "X2", 1558.090, "Y2", 823.228))
zones.Push(Object("NAME", "The Pink Swan", "X1", 1817.390, "Y1", 1083.230, "X2", 2027.390, "Y2", 1283.230))
zones.Push(Object("NAME", "Julius Thruway West", "X1", 1197.390, "Y1", 1163.390, "X2", 1236.630, "Y2", 2243.230))
zones.Push(Object("NAME", "Los Flores", "X1", 2581.730, "Y1", -1393.420, "X2", 2747.740, "Y2", -1135.040))
zones.Push(Object("NAME", "The Visage", "X1", 1817.390, "Y1", 1863.230, "X2", 2106.700, "Y2", 2011.830))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1938.800, "Y1", 2624.230, "X2", 2121.400, "Y2", 2861.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 851.449, "Y1", -1804.210, "X2", 1046.150, "Y2", -1577.590))
zones.Push(Object("NAME", "Robada Intersection", "X1", -1119.010, "Y1", 1178.930, "X2", -862.025, "Y2", 1351.450))
zones.Push(Object("NAME", "Linden Side", "X1", 2749.900, "Y1", 943.235, "X2", 2923.390, "Y2", 1198.990))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2703.580, "Y1", -2302.330, "X2", 2959.350, "Y2", -2126.900))
zones.Push(Object("NAME", "Willowfield", "X1", 2324.000, "Y1", -2059.230, "X2", 2541.700, "Y2", -1852.870))
zones.Push(Object("NAME", "King's", "X1", -2411.220, "Y1", 265.243, "X2", -1993.280, "Y2", 373.539))
zones.Push(Object("NAME", "Commerce", "X1", 1323.900, "Y1", -1842.270, "X2", 1701.900, "Y2", -1722.260))
zones.Push(Object("NAME", "Mulholland", "X1", 1269.130, "Y1", -768.027, "X2", 1414.070, "Y2", -452.425))
zones.Push(Object("NAME", "Marina", "X1", 647.712, "Y1", -1804.210, "X2", 851.449, "Y2", -1577.590))
zones.Push(Object("NAME", "Battery Point", "X1", -2741.070, "Y1", 1268.410, "X2", -2533.040, "Y2", 1490.470))
zones.Push(Object("NAME", "The Four Dragons Casino", "X1", 1817.390, "Y1", 863.232, "X2", 2027.390, "Y2", 1083.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1203.220, "X2", 1197.390, "Y2", 1403.220))
zones.Push(Object("NAME", "Julius Thruway North", "X1", 1534.560, "Y1", 2433.230, "X2", 1848.400, "Y2", 2583.230))
zones.Push(Object("NAME", "Yellow Bell Gol Course", "X1", 1117.400, "Y1", 2723.230, "X2", 1457.460, "Y2", 2863.230))
zones.Push(Object("NAME", "Idlewood", "X1", 1812.620, "Y1", -1602.310, "X2", 2124.660, "Y2", -1449.670))
zones.Push(Object("NAME", "Redsands West", "X1", 1297.470, "Y1", 2142.860, "X2", 1777.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Doherty", "X1", -2270.040, "Y1", -324.114, "X2", -1794.920, "Y2", -222.589))
zones.Push(Object("NAME", "Hilltop Farm", "X1", 967.383, "Y1", -450.390, "X2", 1176.780, "Y2", -217.900))
zones.Push(Object("NAME", "Las Barrancas", "X1", -926.130, "Y1", 1398.730, "X2", -719.234, "Y2", 1634.690))
zones.Push(Object("NAME", "Pirates in Men's Pants", "X1", 1817.390, "Y1", 1469.230, "X2", 2027.400, "Y2", 1703.230))
zones.Push(Object("NAME", "City Hall", "X1", -2867.850, "Y1", 277.411, "X2", -2593.440, "Y2", 458.411))
zones.Push(Object("NAME", "Avispa Country Club", "X1", -2646.400, "Y1", -355.493, "X2", -2270.040, "Y2", -222.589))
zones.Push(Object("NAME", "The Strip", "X1", 2027.400, "Y1", 863.229, "X2", 2087.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Hashbury", "X1", -2593.440, "Y1", -222.589, "X2", -2411.220, "Y2", 54.722))
zones.Push(Object("NAME", "Los Santos International", "X1", 1852.000, "Y1", -2394.330, "X2", 2089.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 1098.310, "Y1", 1726.220, "X2", 1197.390, "Y2", 2243.230))
zones.Push(Object("NAME", "Sherman Reservoir", "X1", -789.737, "Y1", 1659.680, "X2", -599.505, "Y2", 1929.410))
zones.Push(Object("NAME", "El Corona", "X1", 1812.620, "Y1", -2179.250, "X2", 1970.620, "Y2", -1852.870))
zones.Push(Object("NAME", "Downtown", "X1", -1700.010, "Y1", 744.267, "X2", -1580.010, "Y2", 1176.520))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1250.970, "X2", -1794.920, "Y2", -1115.580))
zones.Push(Object("NAME", "Las Payasadas", "X1", -354.332, "Y1", 2580.360, "X2", -133.625, "Y2", 2816.820))
zones.Push(Object("NAME", "Valle Ocultado", "X1", -936.668, "Y1", 2611.440, "X2", -715.961, "Y2", 2847.900))
zones.Push(Object("NAME", "Blackfield Intersection", "X1", 1166.530, "Y1", 795.010, "X2", 1375.600, "Y2", 1044.690))
zones.Push(Object("NAME", "Ganton", "X1", 2222.560, "Y1", -1852.870, "X2", 2632.830, "Y2", -1722.330))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -730.118, "X2", -1132.820, "Y2", -50.096))
zones.Push(Object("NAME", "Redsands East", "X1", 1817.390, "Y1", 2011.830, "X2", 2106.700, "Y2", 2202.760))
zones.Push(Object("NAME", "Esplanade East", "X1", -1499.890, "Y1", 578.396, "X2", -1339.890, "Y2", 1274.260))
zones.Push(Object("NAME", "Caligula's Palace", "X1", 2087.390, "Y1", 1543.230, "X2", 2437.390, "Y2", 1703.230))
zones.Push(Object("NAME", "Royal Casino", "X1", 2087.390, "Y1", 1383.230, "X2", 2437.390, "Y2", 1543.230))
zones.Push(Object("NAME", "Richman", "X1", 72.648, "Y1", -1235.070, "X2", 321.356, "Y2", -1008.150))
zones.Push(Object("NAME", "Starfish Casino", "X1", 2437.390, "Y1", 1783.230, "X2", 2685.160, "Y2", 2012.180))
zones.Push(Object("NAME", "Mulholland", "X1", 1281.130, "Y1", -452.425, "X2", 1641.130, "Y2", -290.913))
zones.Push(Object("NAME", "Downtown", "X1", -1982.320, "Y1", 744.170, "X2", -1871.720, "Y2", 1274.260))
zones.Push(Object("NAME", "Hankypanky Point", "X1", 2576.920, "Y1", 62.158, "X2", 2759.250, "Y2", 385.503))
zones.Push(Object("NAME", "K.A.C.C. Military Fuels", "X1", 2498.210, "Y1", 2626.550, "X2", 2749.900, "Y2", 2861.550))
zones.Push(Object("NAME", "Harry Gold Parkway", "X1", 1777.390, "Y1", 863.232, "X2", 1817.390, "Y2", 2342.830))
zones.Push(Object("NAME", "Bayside Tunnel", "X1", -2290.190, "Y1", 2548.290, "X2", -1950.190, "Y2", 2723.290))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2324.000, "Y1", -2302.330, "X2", 2703.580, "Y2", -2145.100))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1044.070, "X2", 647.557, "Y2", -860.619))
zones.Push(Object("NAME", "Randolph Industrial Estate", "X1", 1558.090, "Y1", 596.349, "X2", 1823.080, "Y2", 823.235))
zones.Push(Object("NAME", "East Beach", "X1", 2632.830, "Y1", -1852.870, "X2", 2959.350, "Y2", -1668.130))
zones.Push(Object("NAME", "Flint Water", "X1", -314.426, "Y1", -753.874, "X2", -106.339, "Y2", -463.073))
zones.Push(Object("NAME", "Blueberry", "X1", 19.607, "Y1", -404.136, "X2", 349.607, "Y2", -220.137))
zones.Push(Object("NAME", "Linden Station", "X1", 2749.900, "Y1", 1198.990, "X2", 2923.390, "Y2", 1548.990))
zones.Push(Object("NAME", "Glen Park", "X1", 1812.620, "Y1", -1350.720, "X2", 2056.860, "Y2", -1100.820))
zones.Push(Object("NAME", "Downtown", "X1", -1993.280, "Y1", 265.243, "X2", -1794.920, "Y2", 578.396))
zones.Push(Object("NAME", "Redsands West", "X1", 1377.390, "Y1", 2243.230, "X2", 1704.590, "Y2", 2433.230))
zones.Push(Object("NAME", "Richman", "X1", 321.356, "Y1", -1235.070, "X2", 647.522, "Y2", -1044.070))
zones.Push(Object("NAME", "Gant Bridge", "X1", -2741.450, "Y1", 1659.680, "X2", -2616.400, "Y2", 2175.150))
zones.Push(Object("NAME", "Lil' Probe Inn", "X1", -90.218, "Y1", 1286.850, "X2", 153.859, "Y2", 1554.120))
zones.Push(Object("NAME", "Flint Intersection", "X1", -187.700, "Y1", -1596.760, "X2", 17.063, "Y2", -1276.600))
zones.Push(Object("NAME", "Las Colinas", "X1", 2281.450, "Y1", -1135.040, "X2", 2632.740, "Y2", -945.035))
zones.Push(Object("NAME", "Sobell Rail Yards", "X1", 2749.900, "Y1", 1548.990, "X2", 2923.390, "Y2", 1937.250))
zones.Push(Object("NAME", "The Emerald Isle", "X1", 2011.940, "Y1", 2202.760, "X2", 2237.400, "Y2", 2508.230))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -208.570, "Y1", 2123.010, "X2", 114.033, "Y2", 2337.180))
zones.Push(Object("NAME", "Santa Flora", "X1", -2741.070, "Y1", 458.411, "X2", -2533.040, "Y2", 793.411))
zones.Push(Object("NAME", "Playa del Seville", "X1", 2703.580, "Y1", -2126.900, "X2", 2959.350, "Y2", -1852.870))
zones.Push(Object("NAME", "Market", "X1", 926.922, "Y1", -1577.590, "X2", 1370.850, "Y2", -1416.250))
zones.Push(Object("NAME", "Queens", "X1", -2593.440, "Y1", 54.722, "X2", -2411.220, "Y2", 458.411))
zones.Push(Object("NAME", "Pilson Intersection", "X1", 1098.390, "Y1", 2243.230, "X2", 1377.390, "Y2", 2507.230))
zones.Push(Object("NAME", "Spinybed", "X1", 2121.400, "Y1", 2663.170, "X2", 2498.210, "Y2", 2861.550))
zones.Push(Object("NAME", "Pilgrim", "X1", 2437.390, "Y1", 1383.230, "X2", 2624.400, "Y2", 1783.230))
zones.Push(Object("NAME", "Blackfield", "X1", 964.391, "Y1", 1403.220, "X2", 1197.390, "Y2", 1726.220))
zones.Push(Object("NAME", "'The Big Ear'", "X1", -410.020, "Y1", 1403.340, "X2", -137.969, "Y2", 1681.230))
zones.Push(Object("NAME", "Dillimore", "X1", 580.794, "Y1", -674.885, "X2", 861.085, "Y2", -404.790))
zones.Push(Object("NAME", "El Quebrados", "X1", -1645.230, "Y1", 2498.520, "X2", -1372.140, "Y2", 2777.850))
zones.Push(Object("NAME", "Esplanade North", "X1", -2533.040, "Y1", 1358.900, "X2", -1996.660, "Y2", 1501.210))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1499.890, "Y1", -50.096, "X2", -1242.980, "Y2", 249.904))
zones.Push(Object("NAME", "Fisher's Lagoon", "X1", 1916.990, "Y1", -233.323, "X2", 2131.720, "Y2", 13.800))
zones.Push(Object("NAME", "Mulholland", "X1", 1414.070, "Y1", -768.027, "X2", 1667.610, "Y2", -452.425))
zones.Push(Object("NAME", "East Beach", "X1", 2747.740, "Y1", -1498.620, "X2", 2959.350, "Y2", -1120.040))
zones.Push(Object("NAME", "San Andreas Sound", "X1", 2450.390, "Y1", 385.503, "X2", 2759.250, "Y2", 562.349))
zones.Push(Object("NAME", "Shady Creeks", "X1", -2030.120, "Y1", -2174.890, "X2", -1820.640, "Y2", -1771.660))
zones.Push(Object("NAME", "Market", "X1", 1072.660, "Y1", -1416.250, "X2", 1370.850, "Y2", -1130.850))
zones.Push(Object("NAME", "Rockshore West", "X1", 1997.220, "Y1", 596.349, "X2", 2377.390, "Y2", 823.228))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1534.560, "Y1", 2583.230, "X2", 1848.400, "Y2", 2863.230))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", -50.096, "X2", -1499.890, "Y2", 249.904))
zones.Push(Object("NAME", "Leafy Hollow", "X1", -1166.970, "Y1", -1856.030, "X2", -815.624, "Y2", -1602.070))
zones.Push(Object("NAME", "LVA Freight Depot", "X1", 1457.390, "Y1", 863.229, "X2", 1777.400, "Y2", 1143.210))
zones.Push(Object("NAME", "Prickle Pine", "X1", 1117.400, "Y1", 2507.230, "X2", 1534.560, "Y2", 2723.230))
zones.Push(Object("NAME", "Blueberry", "X1", 104.534, "Y1", -220.137, "X2", 349.607, "Y2", 152.236))
zones.Push(Object("NAME", "El Castillo del Diablo", "X1", -464.515, "Y1", 2217.680, "X2", -208.570, "Y2", 2580.360))
zones.Push(Object("NAME", "Downtown", "X1", -2078.670, "Y1", 578.396, "X2", -1499.890, "Y2", 744.267))
zones.Push(Object("NAME", "Rockshore East", "X1", 2537.390, "Y1", 676.549, "X2", 2902.350, "Y2", 943.235))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1501.210, "X2", -1996.660, "Y2", 1659.680))
zones.Push(Object("NAME", "Paradiso", "X1", -2741.070, "Y1", 793.411, "X2", -2533.040, "Y2", 1268.410))
zones.Push(Object("NAME", "The Camel's Toe", "X1", 2087.390, "Y1", 1203.230, "X2", 2640.400, "Y2", 1383.230))
zones.Push(Object("NAME", "Old Venturas Strip", "X1", 2162.390, "Y1", 2012.180, "X2", 2685.160, "Y2", 2202.760))
zones.Push(Object("NAME", "Juniper Hill", "X1", -2533.040, "Y1", 578.396, "X2", -2274.170, "Y2", 968.369))
zones.Push(Object("NAME", "Juniper Hollow", "X1", -2533.040, "Y1", 968.369, "X2", -2274.170, "Y2", 1358.900))
zones.Push(Object("NAME", "Roca Escalante", "X1", 2237.400, "Y1", 2202.760, "X2", 2536.430, "Y2", 2542.550))
zones.Push(Object("NAME", "Julius Thruway East", "X1", 2685.160, "Y1", 1055.960, "X2", 2749.900, "Y2", 2626.550))
zones.Push(Object("NAME", "Verona Beach", "X1", 647.712, "Y1", -2173.290, "X2", 930.221, "Y2", -1804.210))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -599.884, "X2", -1794.920, "Y2", -324.114))
zones.Push(Object("NAME", "Arco del Oeste", "X1", -901.129, "Y1", 2221.860, "X2", -592.090, "Y2", 2571.970))
zones.Push(Object("NAME", "Fallen Tree", "X1", -792.254, "Y1", -698.555, "X2", -452.404, "Y2", -380.043))
zones.Push(Object("NAME", "Itanis Farm", "X1", -1209.670, "Y1", -1317.100, "X2", -908.161, "Y2", -787.391))
zones.Push(Object("NAME", "The Sherman Dam", "X1", -968.772, "Y1", 1929.410, "X2", -481.126, "Y2", 2155.260))
zones.Push(Object("NAME", "Esplanade North", "X1", -1996.660, "Y1", 1358.900, "X2", -1524.240, "Y2", 1592.510))
zones.Push(Object("NAME", "Financial", "X1", -1871.720, "Y1", 744.170, "X2", -1701.300, "Y2", 1176.420))
zones.Push(Object("NAME", "Garcia", "X1", -2411.220, "Y1", -222.589, "X2", -2173.040, "Y2", 265.243))
zones.Push(Object("NAME", "Montgomery", "X1", 1119.510, "Y1", 119.526, "X2", 1451.400, "Y2", 493.323))
zones.Push(Object("NAME", "Creek", "X1", 2749.900, "Y1", 1937.250, "X2", 2921.620, "Y2", 2669.790))
zones.Push(Object("NAME", "Los Santos International", "X1", 1249.620, "Y1", -2394.330, "X2", 1852.000, "Y2", -2179.250))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 72.648, "Y1", -2173.290, "X2", 342.648, "Y2", -1684.650))
zones.Push(Object("NAME", "Mulholland Intersection", "X1", 1463.900, "Y1", -1150.870, "X2", 1812.620, "Y2", -768.027))
zones.Push(Object("NAME", "Angel Pine", "X1", -2324.940, "Y1", -2584.290, "X2", -1964.220, "Y2", -2212.110))
zones.Push(Object("NAME", "Verdant Meadows", "X1", 37.032, "Y1", 2337.180, "X2", 435.988, "Y2", 2677.900))
zones.Push(Object("NAME", "Octane Springs", "X1", 338.658, "Y1", 1228.510, "X2", 664.308, "Y2", 1655.050))
zones.Push(Object("NAME", "Come-A-Lot", "X1", 2087.390, "Y1", 943.235, "X2", 2623.180, "Y2", 1203.230))
zones.Push(Object("NAME", "Redsands West", "X1", 1236.630, "Y1", 1883.110, "X2", 1777.390, "Y2", 2142.860))
zones.Push(Object("NAME", "Santa Maria Beach", "X1", 342.648, "Y1", -2173.290, "X2", 647.712, "Y2", -1684.650))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 1249.620, "Y1", -2179.250, "X2", 1692.620, "Y2", -1842.270))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1236.630, "Y1", 1203.280, "X2", 1457.370, "Y2", 1883.110))
zones.Push(Object("NAME", "Flint Range", "X1", -594.191, "Y1", -1648.550, "X2", -187.700, "Y2", -1276.600))
zones.Push(Object("NAME", "Verdant Bluffs", "X1", 930.221, "Y1", -2488.420, "X2", 1249.620, "Y2", -2006.780))
zones.Push(Object("NAME", "Palomino Creek", "X1", 2160.220, "Y1", -149.004, "X2", 2576.920, "Y2", 228.322))
zones.Push(Object("NAME", "Ocean Docks", "X1", 2373.770, "Y1", -2697.090, "X2", 2809.220, "Y2", -2330.460))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1213.910, "Y1", -50.096, "X2", -947.980, "Y2", 578.396))
zones.Push(Object("NAME", "Whitewood Estates", "X1", 883.308, "Y1", 1726.220, "X2", 1098.310, "Y2", 2507.230))
zones.Push(Object("NAME", "Calton Heights", "X1", -2274.170, "Y1", 744.170, "X2", -1982.320, "Y2", 1358.900))
zones.Push(Object("NAME", "Easter Basin", "X1", -1794.920, "Y1", 249.904, "X2", -1242.980, "Y2", 578.396))
zones.Push(Object("NAME", "Los Santos Inlet", "X1", -321.744, "Y1", -2224.430, "X2", 44.615, "Y2", -1724.430))
zones.Push(Object("NAME", "Doherty", "X1", -2173.040, "Y1", -222.589, "X2", -1794.920, "Y2", 265.243))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -2189.910, "X2", -2030.120, "Y2", -1771.660))
zones.Push(Object("NAME", "Fort Carson", "X1", -376.233, "Y1", 826.326, "X2", 123.717, "Y2", 1220.440))
zones.Push(Object("NAME", "Foster Valley", "X1", -2178.690, "Y1", -1115.580, "X2", -1794.920, "Y2", -599.884))
zones.Push(Object("NAME", "Ocean Flats", "X1", -2994.490, "Y1", -222.589, "X2", -2593.440, "Y2", 277.411))
zones.Push(Object("NAME", "Fern Ridge", "X1", 508.189, "Y1", -139.259, "X2", 1306.660, "Y2", 119.526))
zones.Push(Object("NAME", "Bayside", "X1", -2741.070, "Y1", 2175.150, "X2", -2353.170, "Y2", 2722.790))
zones.Push(Object("NAME", "Las Venturas Airport", "X1", 1457.370, "Y1", 1203.280, "X2", 1777.390, "Y2", 1883.110))
zones.Push(Object("NAME", "Blueberry Acres", "X1", -319.676, "Y1", -220.137, "X2", 104.534, "Y2", 293.324))
zones.Push(Object("NAME", "Palisades", "X1", -2994.490, "Y1", 458.411, "X2", -2741.070, "Y2", 1339.610))
zones.Push(Object("NAME", "North Rock", "X1", 2285.370, "Y1", -768.027, "X2", 2770.590, "Y2", -269.740))
zones.Push(Object("NAME", "Hunter Quarry", "X1", 337.244, "Y1", 710.840, "X2", 860.554, "Y2", 1031.710))
zones.Push(Object("NAME", "Los Santos International", "X1", 1382.730, "Y1", -2730.880, "X2", 2201.820, "Y2", -2394.330))
zones.Push(Object("NAME", "Missionary Hill", "X1", -2994.490, "Y1", -811.276, "X2", -2178.690, "Y2", -430.276))
zones.Push(Object("NAME", "San Fierro Bay", "X1", -2616.400, "Y1", 1659.680, "X2", -1996.660, "Y2", 2175.150))
zones.Push(Object("NAME", "Restricted Area", "X1", -91.586, "Y1", 1655.050, "X2", 421.234, "Y2", 2123.010))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2997.470, "Y1", -1115.580, "X2", -2178.690, "Y2", -971.913))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2178.690, "Y1", -1771.660, "X2", -1936.120, "Y2", -1250.970))
zones.Push(Object("NAME", "Easter Bay Airport", "X1", -1794.920, "Y1", -730.118, "X2", -1213.910, "Y2", -50.096))
zones.Push(Object("NAME", "The Panopticon", "X1", -947.980, "Y1", -304.320, "X2", -319.676, "Y2", 327.071))
zones.Push(Object("NAME", "Shady Creeks", "X1", -1820.640, "Y1", -2643.680, "X2", -1226.780, "Y2", -1771.660))
zones.Push(Object("NAME", "Back o Beyond", "X1", -1166.970, "Y1", -2641.190, "X2", -321.744, "Y2", -1856.030))
zones.Push(Object("NAME", "Mount Chiliad", "X1", -2994.490, "Y1", -2189.910, "X2", -2178.690, "Y2", -1115.580))
zones.Push(Object("NAME", "Tierra Robada", "X1", -1213.910, "Y1", 596.349, "X2", -480.539, "Y2", 1659.680))
zones.Push(Object("NAME", "Flint County", "X1", -1213.910, "Y1", -2892.970, "X2", 44.615, "Y2", -768.027))
zones.Push(Object("NAME", "Whetstone", "X1", -2997.470, "Y1", -2892.970, "X2", -1213.910, "Y2", -1115.580))
zones.Push(Object("NAME", "Bone County", "X1", -480.539, "Y1", 596.349, "X2", 869.461, "Y2", 2993.870))
zones.Push(Object("NAME", "Tierra Robada", "X1", -2997.470, "Y1", 1659.680, "X2", -480.539, "Y2", 2993.870))
zones.Push(Object("NAME", "San Fierro", "X1", -2997.470, "Y1", -1115.580, "X2", -1213.910, "Y2", 1659.680))
zones.Push(Object("NAME", "Las Venturas", "X1", 869.461, "Y1", 596.349, "X2", 2997.060, "Y2", 2993.870))
zones.Push(Object("NAME", "Red County", "X1", -1213.910, "Y1", -768.027, "X2", 2997.060, "Y2", 596.349))
zones.Push(Object("NAME", "Los Santos", "X1", 44.615, "Y1", -2892.970, "X2", 2997.060, "Y2", -768.027))

global datatypes := {"Int64" : 8, "Double" : 8, "UInt" : 4, "Int" : 4, "Float" : 4, "Ptr" : 4, "UPtr" : 4, "UShort" : 2, "Short" : 2, "Char" : 1, "UChar" : 1, "Byte" : 1}

global oWeaponNames 											:= ["Fist","Brass Knuckles","Golf Club","Nightstick","Knife","Baseball Bat","Shovel","Pool Cue","Katana"
,"Chainsaw","Purple Dildo","Dildo","Vibrator","Silver Vibrator","Flowers","Cane","Grenade","Tear Gas","Molotov Cocktail", "", "", "", "9mm","Silenced 9mm","Desert Eagle"
,"Shotgun","Sawnoff Shotgun","Combat Shotgun","Micro SMG/Uzi","MP5","AK-47","M4","Tec-9","Country Rifle","Sniper Rifle","RPG","HS Rocket","Flamethrower","Minigun","Satchel Charge"
,"Detonator","Spraycan","Fire Extinguisher","Camera","Night Vis Goggles","Thermal Goggles","Parachute"]

global oRadiostationNames 										:= ["Playback FM", "K Rose", "K-DST", "Bounce FM", "SF-UR", "Radio Los Santos", "Radio X", "CSR 103.9"
, "K-JAH West", "Master Sounds 98.3", "WCTR Talk Radio", "User Track Player", "Radio Off"]

global oweatherNames 											:= ["EXTRASUNNY_LA", "SUNNY_LA", "EXTRASUNNY_SMOG_LA", "SUNNY_SMOG_LA", "CLOUDY_LA", "SUNNY_SF", "EXTRASUNNY_SF"
, "CLOUDY_SF", "RAINY_SF", "FOGGY_SF", "SUNNY_VEGAS", "EXTRASUNNY_VEGAS", "CLOUDY_VEGAS", "EXTRASUNNY_COUNTRYSIDE", "SUNNY_COUNTRYSIDE", "CLOUDY_COUNTRYSIDE", "RAINY_COUNTRYSIDE"
, "EXTRASUNNY_DESERT", "SUNNY_DESERT", "SANDSTORM_DESERT", "UNDERWATER", "EXTRACOLOURS_1", "EXTRACOLOURS_2"]

global oVehicleNames 											:= ["Landstalker", "Bravura", "Buffalo", "Linerunner", "Perenniel", "Sentinel", "Dumper", "Firetruck"
, "Trashmaster", "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam", "Esperanto", "Taxi", "Washington", "Bobcat"
, "Mr. Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Article Trailer", "Previon"
, "Coach", "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squallo", "Seasparrow", "Pizzaboy", "Tram", "Article Trailer 2", "Turismo"
, "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Topfun Van (Berkley's RC)", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider"
, "Glendale", "Oceanic", "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet"
, "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "SAN News Maverick", "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring Racer"
, "Sandking", "Blista Compact", "Police Maverick", "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher Lure"
, "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stuntplane", "Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal"
, "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Towtruck", "Fortune", "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine Harvester"
, "Feltzer", "Remington", "Slamvan", "Blade", "Freight (Train)", "Brownstreak (Train)", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck LA", "Hustler"
, "Intruder", "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility Van", "Nevada", "Yosemite", "Windsor", "Monster A", "Monster B", "Uranus", "Jester", "Sultan"
, "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito", "Freight Flat Trailer (Train)", "Streak Trailer (Train)", "Kart", "Mower", "Dune"
, "Sweeper", "Broadway", "Tornado", "AT400", "DFT-30", "Huntley", "Stafford", "BF-400", "Newsvan", "Tug", "Petrol Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog"
, "Club", "Freight Box Trailer (Train)", "Article Trailer 3", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car (LSPD)", "Police Car (SFPD)", "Police Car (LVPD)"
, "Police Ranger", "Picador", "S.W.A.T.", "Alpha", "Phoenix", "Glendale Shit", "Sadler Shit", "Baggage Trailer A", "Baggage Trailer B", "Tug Stairs Trailer", "Boxville"
, "Farm Trailer", "Utility Trailer"]
global oAirplaneModels 											:= [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels 												:= [481,509,510]

global SERVER_SPEED_KOEFF 										:= 1.425

global DIALOG_STYLE_MSGBOX										:= 0
global DIALOG_STYLE_INPUT 										:= 1
global DIALOG_STYLE_LIST										:= 2
global DIALOG_STYLE_PASSWORD									:= 3
global DIALOG_STYLE_TABLIST										:= 4
global DIALOG_STYLE_TABLIST_HEADERS								:= 5

global GAMESTATE_DISCONNECTED 									:= 5
global GAMESTATE_WAIT_CONNECT 									:= 9
global GAMESTATE_CONNECTING 									:= 13
global GAMESTATE_AWAIT_JOIN 									:= 15
global GAMESTATE_CONNECTED 										:= 14
global GAMESTATE_RESTARTING 									:= 18


global FIGHT_STYLE_NORMAL 										:= 4
global FIGHT_STYLE_BOXING 										:= 5
global FIGHT_STYLE_KUNGFU 										:= 6
global FIGHT_STYLE_KNEEHEAD 									:= 7
global FIGHT_STYLE_GRABKICK 									:= 15
global FIGHT_STYLE_ELBOW 										:= 16

global VEHICLE_TYPE_CAR											:= 1
global VEHICLE_TYPE_BIKE										:= 2
global VEHICLE_TYPE_HELI										:= 3
global VEHICLE_TYPE_BOAT										:= 4
global VEHICLE_TYPE_PLANE										:= 5

global OBJECT_MATERIAL_TEXT_ALIGN_LEFT   						:= 0
global OBJECT_MATERIAL_TEXT_ALIGN_CENTER 						:= 1
global OBJECT_MATERIAL_TEXT_ALIGN_RIGHT  						:= 2
global OBJECT_MATERIAL_SIZE_32x32  								:= 10
global OBJECT_MATERIAL_SIZE_64x32								:= 20
global OBJECT_MATERIAL_SIZE_64x64								:= 30
global OBJECT_MATERIAL_SIZE_128x32								:= 40
global OBJECT_MATERIAL_SIZE_128x64								:= 50
global OBJECT_MATERIAL_SIZE_128x128								:= 60
global OBJECT_MATERIAL_SIZE_256x32								:= 70
global OBJECT_MATERIAL_SIZE_256x64								:= 80
global OBJECT_MATERIAL_SIZE_256x128								:= 90
global OBJECT_MATERIAL_SIZE_256x256								:= 100
global OBJECT_MATERIAL_SIZE_512x64								:= 110
global OBJECT_MATERIAL_SIZE_512x128								:= 120
global OBJECT_MATERIAL_SIZE_512x256								:= 130
global OBJECT_MATERIAL_SIZE_512x512								:= 140

global SAMP_SKIN_OFFSET											:= 0x22

global SAMP_DIALOG_OFFSET										:= 0x34
global SAMP_DIALOG_SIZE											:= 2048
global SAMP_DIALOG_TITLE										:= 0x40
global SAMP_DIALOG_TITLE_SIZE									:= 64
global SAMP_3DTEXT												:= 0x12C7BC
global SAMP_DIALOG_SHOW_OFFSET									:= 0x28

global ADDR_CURRENT_WEAPON										:= 0xBAA410

global ADDR_CLOUD_DENSITY										:= 0x716642
global ADDR_CLOUD_DISABLE										:= 0x716655

global ADDR_SPRINT												:= 0xB7CDB4

global ADDR_FIX_WINDOW											:= 0x747FB6
global ADDR_FIX_CURSOR											:= 0x74805A
global ADDR_KEEP_ACTIVE											:= 0x74542B

global ADDR_VEHICLE_CVEH										:= 0xB6F980
global ADDR_VEHICLE_SPEED_X										:= 0x44
global ADDR_VEHICLE_SPEED_Y										:= 0x48
global ADDR_VEHICLE_SPEED_Z										:= 0x4C

global GAMETEXT_1												:= 0xBAAD40
global GAMETEXT_2												:= 0xBAADC0
global GAMETEXT_3												:= 0xBAAE40
global GAMETEXT_4												:= 0xBAAEC0
global GAMETEXT_5												:= 0xBAABC0

global rmaddrs 													:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]

global GTA_IS_CHECKPOINT										:= 0x0220214C
global GTA_CHECKPOINT            								:= 0x00C7DEC8
global GTA_CHECKPOINT_OFF_X										:= 0x00
global GTA_CHECKPOINT_OFF_Y										:= 0x04
global GTA_CHECKPOINT_OFF_Z										:= 0x08

global GTA_CPED_PTR												:= 0xB6F5F0
global GTA_VEHICLE_PTR											:= 0xBA18FC
global SAMP_SCOREBOARD_INFO_PTR									:= 0x21A0B4
global SAMP_CHAT_INFO_PTR										:= 0x21A0E4
global SAMP_KILL_INFO_PTR										:= 0x21A0EC
global SAMP_INFO_PTR											:= 0x21A0F8
global SAMP_MISC_INFO_PTR										:= 0x21A10C
global SAMP_INPUT_INFO_PTR										:= 0x21A0E8
global SAMP_DIALOG_INFO_PTR										:= 0x21A0B8

global GTA_BLIP_POOL											:= 0xBA86F0
global GTA_BLIP_COUNT											:= 0xAF
global GTA_BLIP_ELEMENT_SIZE									:= 0x28
global GTA_BLIP_COLOR_OFFSET									:= 0x0
global GTA_BLIP_ID_OFFSET										:= 0x24
global GTA_BLIP_STYLE_OFFSET									:= 0x25
global GTA_BLIP_X_OFFSET										:= 0x8
global GTA_BLIP_Y_OFFSET										:= 0xC
global GTA_BLIP_Z_OFFSET										:= 0x10

global SAMP_MAX_PLAYERTEXTDRAWS									:= 256
global SAMP_MAX_TEXTDRAWS										:= 2048
global SAMP_MAX_TEXTLABELS										:= 2048
global SAMP_MAX_GANGZONES										:= 1024
global SAMP_MAX_PICKUPS											:= 4096
global SAMP_MAX_OBJECTS											:= 1000
global SAMP_MAX_PLAYERS											:= 1004
global SAMP_MAX_VEHICLES										:= 2000

global SAMP_RAKCLIENT											:= 0x3C9

global SAMP_POOLS												:= 0x3CD
global SAMP_POOL_ACTOR											:= 0x0
global SAMP_POOL_OBJECT											:= 0x4
global SAMP_POOL_GANGZONE										:= 0x8
global SAMP_POOL_TEXTLABEL										:= 0xC
global SAMP_POOL_TEXTDRAW										:= 0x10
global SAMP_POOL_PLAYERLABEL									:= 0x14
global SAMP_POOL_PLAYER											:= 0x18
global SAMP_POOL_PICKUP											:= 0x20
global SAMP_POOL_VEHICLE										:= 0x1C

global SAMP_TEXTDRAW_LETTERWIDTH								:= 0x963
global SAMP_TEXTDRAW_LETTERHEIGHT								:= 0x967
global SAMP_TEXTDRAW_PROPORTIONAL								:= 0x97E
global SAMP_TEXTDRAW_RIGHT 										:= 0x986
global SAMP_TEXTDRAW_FONT 										:= 0x987
global SAMP_TEXTDRAW_XPOS 										:= 0x98B
global SAMP_TEXTDRAW_YPOS 										:= 0x98F

global SAMP_REMOTEPLAYERS										:= 0x2E
global SAMP_LOCALPLAYER											:= 0x22

global FUNC_SAMP_SEND_CMD										:= 0x65C60
global FUNC_SAMP_SEND_SAY										:= 0x57F0

global gangZoneTick 											:= 0
global oGangzones 												:= []
global textLabelTick											:= 0
global oTextLabels												:= []
global textDrawTick												:= 0
global oTextDraws												:= []
global pickupTick												:= 0
global oPickups													:= []
global objectTick												:= 0
global oObjects													:= []
global playerTick												:= 0
global oPlayers													:= ""
global vehicleTick												:= 0
global oVehicles												:= ""

global hGTA														:= 0x0
global dwGTAPID													:= 0x0
global dwSAMP													:= 0x0
global pMemory													:= 0x0
global pInjectFunc												:= 0x0
global pDetours													:= 0x0

global iRefreshHandles											:= 0

global ERROR_OK                     							:= 0
global ERROR_PROCESS_NOT_FOUND      							:= 1
global ERROR_OPEN_PROCESS           							:= 2
global ERROR_INVALID_HANDLE         							:= 3
global ERROR_MODULE_NOT_FOUND       							:= 4
global ERROR_ENUM_PROCESS_MODULES   							:= 5
global ERROR_ZONE_NOT_FOUND         							:= 6
global ERROR_CITY_NOT_FOUND         							:= 7
global ERROR_READ_MEMORY            							:= 8
global ERROR_WRITE_MEMORY           							:= 9
global ERROR_ALLOC_MEMORY           							:= 10
global ERROR_FREE_MEMORY           							 	:= 11
global ERROR_WAIT_FOR_OBJECT        							:= 12
global ERROR_CREATE_THREAD          							:= 13

global ADDR_ZONECODE                							:= 0xA49AD4      ;Player Zone
global ADDR_POSITION_X              							:= 0xB6F2E4      ;Player X Position
global ADDR_POSITION_Y              							:= 0xB6F2E8      ;Player Y Position
global ADDR_POSITION_Z             							 	:= 0xB6F2EC      ;Player Z Position
global ADDR_CPED_PTR                							:= 0xB6F5F0      ;Player CPED Pointer
global ADDR_CPED_HPOFF              							:= 0x540         ;Player Health
global ADDR_CPED_ARMOROFF           							:= 0x548         ;Player Armour
global ADDR_CPED_FREEZE											:= 0x598		 ;Player Freeze
global ADDR_CPED_MONEY              							:= 0x0B7CE54     ;Player Money
global ADDR_CPED_INTID              							:= 0xA4ACE8      ;Player Interior-ID
global ADDR_CPED_SKINIDOFF          							:= 0x22          ;Player Skin-ID
global ADDR_VEHICLE_PTR             							:= 0xBA18FC      ;Vehicle CPED Pointer
global ADDR_VEHICLE_HPOFF           							:= 0x4C0         ;Vehicle Health
global ADDR_VEHICLE_DOORSTATE       							:= 0x4F8         ;Vehicle Door Status
global ADDR_VEHICLE_ENGINESTATE     							:= 0x428         ;Vehicle Engine Status
global ADDR_VEHICLE_LIGHTSTATE      							:= 0x584         ;Vehicle Light Status
global ADDR_VEHICLE_MODEL           							:= 0x22          ;Vehicle Car-ID & Car-Name
global ADDR_VEHICLE_TYPE            							:= 0x590         ;Vehicle Typ-ID (1 = Car)
global ADDR_VEHICLE_DRIVER          							:= 0x460         ;Vehicle Driver
global ADDR_VEHICLE_X               							:= 0x44          ;Vehicle Speed X
global ADDR_VEHICLE_Y               							:= 0x48          ;Vehicle Speed Y
global ADDR_VEHICLE_Z              							 	:= 0x4C          ;Vehicle Speed Z
global ADDR_SAMP_INCHAT_PTR                 					:= 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF             					:= 0x55
global ADDR_SAMP_USERNAME                   					:= 0x219A6F
global FUNC_SAMP_SENDCMD                    					:= 0x65c60
global FUNC_SAMP_SENDSAY                    					:= 0x57f0
global FUNC_SAMP_ADDTOCHATWND               					:= 0x64520
global ADDR_SAMP_CHATMSG_PTR                					:= 0x21a0e4
global FUNC_SAMP_SHOWGAMETEXT               					:= 0x9c2c0
global FUNC_SAMP_PLAYAUDIOSTR               					:= 0x62da0
global FUNC_SAMP_STOPAUDIOSTR               					:= 0x629a0
global SAMP_CHAT_OFF											:= 0x0152
global SAMP_CHAT_SIZE											:= 144
global DIALOG_STYLE_MSGBOX                  					:= 0
global DIALOG_STYLE_INPUT                   					:= 1
global DIALOG_STYLE_LIST                    					:= 2
global DIALOG_STYLE_PASSWORD                					:= 3
global DIALOG_STYLE_TABLIST                 					:= 4
global DIALOG_STYLE_TABLIST_HEADERS         					:= 5
global SAMP_DIALOG_STRUCT_PTR               					:= 0x21A0B8
global SAMP_DIALOG_PTR1_OFFSET              					:= 0x1C
global SAMP_DIALOG_LINES_OFFSET             					:= 0x44C
global SAMP_DIALOG_INDEX_OFFSET             					:= 0x443
global SAMP_DIALOG_BUTTON_HOVERING_OFFSET   					:= 0x465
global SAMP_DIALOG_BUTTON_CLICKED_OFFSET    					:= 0x466
global SAMP_DIALOG_PTR2_OFFSET              					:= 0x20
global SAMP_DIALOG_LINECOUNT_OFFSET         					:= 0x150
global SAMP_DIALOG_OPEN_OFFSET              					:= 0x28
global SAMP_DIALOG_STYLE_OFFSET             					:= 0x2C
global SAMP_DIALOG_ID_OFFSET                					:= 0x30
global SAMP_DIALOG_TEXT_PTR_OFFSET          					:= 0x34
global SAMP_DIALOG_CAPTION_OFFSET           					:= 0x40
global FUNC_SAMP_SHOWDIALOG                 					:= 0x6B9C0
global FUNC_SAMP_CLOSEDIALOG                					:= 0x6C040
global FUNC_UPDATESCOREBOARD                					:= 0x8A10
global SAMP_INFO_OFFSET                     					:= 0x21A0F8
global ADDR_SAMP_CRASHREPORT                					:= 0x5CF2C
global SAMP_PPOOLS_OFFSET                   					:= 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             					:= 0x18
global SAMP_SLOCALPLAYERID_OFFSET           					:= 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  					:= 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        					:= 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       					:= 0xA
global SAMP_PREMOTEPLAYER_OFFSET            					:= 0x2E
global SAMP_ISTRLENNAME___OFFSET            					:= 0x1C
global SAMP_SZPLAYERNAME_OFFSET             					:= 0xC
global SAMP_PSZPLAYERNAME_OFFSET            					:= 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         					:= 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET       						:= 0x2A
global SAMP_IPING_OFFSET                    					:= 0x28
global SAMP_ISCORE_OFFSET                   					:= 0x24
global SAMP_ISNPC_OFFSET                    					:= 0x4
global SAMP_PLAYER_MAX                      					:= 1004
global ADDR_CP_CHECK                        					:= 0xC7DEEA
global ADDR_REDMARKER                       					:= [0xC7DEC8, 0xC7DECC, 0xC7DED0]
global SIZE_SAMP_CHATMSG                    					:= 0xFC
global hGTA                                 					:= 0x0
global dwGTAPID                             					:= 0x0
global dwSAMP                               					:= 0x0
global pMemory                              					:= 0x0
global pParam1                              					:= 0x0
global pParam2                              					:= 0x0
global pParam3                              					:= 0x0
global pParam4                              					:= 0x0
global pParam5                              					:= 0x0
global pInjectFunc                          					:= 0x0
global nZone                                					:= 1
global nCity                                					:= 1
global bInitZaC                             					:= 0
global iRefreshScoreboard                   					:= 0
global oScoreboardData                      					:= ""
global iRefreshHandles                      					:= 0
global iUpdateTick                          					:= 1000

; =================================================================================================
; | Overlay
; =================================================================================================
Init_func 				:= DllCall("GetProcAddress", UInt, hModule, Str, "Init")
SetParam_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "SetParam")

TextCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextCreate")
TextDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextDestroy")
TextSetShadow_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShadow")
TextSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShown")
TextSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetColor")
TextSetPos_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetPos")
TextSetString_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetString")
TextUpdate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextUpdate")

BoxCreate_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxCreate")
BoxDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxDestroy")
BoxSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetShown")
BoxSetBorder_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorder")
BoxSetBorderColor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorderColor")
BoxSetColor_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetColor")
BoxSetHeight_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetHeight")
BoxSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetPos")
BoxSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetWidth")

LineCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineCreate")
LineDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineDestroy")
LineSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetShown")
LineSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetColor")
LineSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetWidth")
LineSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetPos")

ImageCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageCreate")
ImageDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageDestroy")
ImageSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetShown")
ImageSetAlign_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetAlign")
ImageSetPos_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetPos")
ImageSetRotation_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetRotation")

DestroyAllVisual_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "DestroyAllVisual")
ShowAllVisual_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ShowAllVisual")
HideAllVisual_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "HideAllVisual")

GetFrameRate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "GetFrameRate")
GetScreenSpecs_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "GetScreenSpecs")

Init()
{
	global Init_func
	res := DllCall(Init_func)
	return res
}

SetParam(str_Name, str_Value)
{
	global SetParam_func
	res := DllCall(SetParam_func, Str, str_Name, Str, str_Value)
	return res
}

TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
{
	global TextCreate_func
	res := DllCall(TextCreate_func,Str,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,Str,text,UChar,shadow,UChar,show)
	return res
}

TextDestroy(id)
{
	global TextDestroy_func
	res := DllCall(TextDestroy_func,Int,id)
	return res
}

TextSetShadow(id, shadow)
{
	global TextSetShadow_func
	res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
	return res
}

TextSetShown(id, show)
{
	global TextSetShown_func
	res := DllCall(TextSetShown_func,Int,id,UChar,show)
	return res
}

TextSetColor(id,color)
{
	global TextSetColor_func
	res := DllCall(TextSetColor_func,Int,id,UInt,color)
	return res
}

TextSetPos(id,x,y)
{
	global TextSetPos_func
	res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
	return res
}

TextSetString(id,Text)
{
	global TextSetString_func
	res := DllCall(TextSetString_func,Int,id,Str,Text)
	return res
}

TextUpdate(id,Font,Fontsize,bold,italic)
{
	global TextUpdate_func
	res := DllCall(TextUpdate_func,Int,id,Str,Font,int,Fontsize,UChar,bold,UChar,italic)
	return res
}

BoxCreate(x,y,width,height,Color,show)
{
	global BoxCreate_func
	res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
	return res
}

BoxDestroy(id)
{
	global BoxDestroy_func
	res := DllCall(BoxDestroy_func,Int,id)
	return res
}

BoxSetShown(id,Show)
{
	global BoxSetShown_func 
	res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
	return res
}
	
BoxSetBorder(id,height,Show)
{
	global BoxSetBorder_func
	res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
	return res
}


BoxSetBorderColor(id,Color)
{
	global BoxSetBorderColor_func 
	res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
	return res
}

BoxSetColor(id,Color)
{
	global BoxSetColor_func
	res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
	return res
}

BoxSetHeight(id,height)
{
	global BoxSetHeight_func
	res := DllCall(BoxSetHeight_func,Int,id,Int,height)
	return res
}

BoxSetPos(id,x,y)
{
	global BoxSetPos_func	
	res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
	return res
}

BoxSetWidth(id,width)
{
	global BoxSetWidth_func
	res := DllCall(BoxSetWidth_func,Int,id,Int,width)
	return res
}

LineCreate(x1,y1,x2,y2,width,color,show)
{
	global LineCreate_func
	res := DllCall(LineCreate_func,Int,x1,Int,y1,Int,x2,Int,y2,Int,Width,UInt,color,UChar,show)
	return res
}

LineDestroy(id)
{
	global LineDestroy_func
	res := DllCall(LineDestroy_func,Int,id)
	return res
}

LineSetShown(id,show)
{
	global LineSetShown_func
	res := DllCall(LineSetShown_func,Int,id,UChar,show)
	return res
}

LineSetColor(id,color)
{
	global LineSetColor_func
	res := DllCall(LineSetColor_func,Int,id,UInt,color)
	return res
}

LineSetWidth(id, width)
{
	global LineSetWidth_func
	res := DllCall(LineSetWidth_func,Int,id,Int,width)
	return res
}

LineSetPos(id,x1,y1,x2,y2)
{
	global LineSetPos_func
	res := DllCall(LineSetPos_func,Int,id,Int,x1,Int,y1,Int,x2,Int,y2)
	return res
}

ImageCreate(path, x, y, rotation, align, show)
{
	global ImageCreate_func
	res := DllCall(ImageCreate_func, Str, path, Int, x, Int, y, Int, rotation, Int, align, UChar, show)
	return res
}

ImageDestroy(id)
{
	global ImageDestroy_func
	res := DllCall(ImageDestroy_func,Int,id)
	return res
}

ImageSetShown(id,show)
{
	global ImageSetShown_func
	res := DllCall(ImageSetShown_func,Int,id,UChar,show)
	return res
}

ImageSetAlign(id,align)
{
	global ImageSetAlign_func
	res := DllCall(ImageSetAlign_func,Int,id,Int,align)
	return res
}

ImageSetPos(id, x, y)
{
	global ImageSetPos_func
	res := DllCall(ImageSetPos_func,Int,id,Int,x, Int, y)
	return res
}

ImageSetRotation(id, rotation)
{
	global ImageSetRotation_func
	res := DllCall(ImageSetRotation_func,Int,id,Int, rotation)
	return res
}

DestroyAllVisual()
{
	global DestroyAllVisual_func
	res := DllCall(DestroyAllVisual_func)
	return res 
}

ShowAllVisual()
{
	global ShowAllVisual_func
	res := DllCall(ShowAllVisual_func)
	return res
}

HideAllVisual()
{
	global HideAllVisual_func
	res := DllCall(HideAllVisual_func )
	return res
}

GetFrameRate()
{
	global GetFrameRate_func
	res := DllCall(GetFrameRate_func )
	return res
}

GetScreenSpecs(ByRef width, ByRef height)
{
	global GetScreenSpecs_func
	res := DllCall(GetScreenSpecs_func, IntP, width, IntP, height)
	return res
}

RelToAbs(root, dir, s = "\") {
	pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
		, root := SubStr(root, len + 1), sk := 0
	If InStr(root, s, "", 0) = StrLen(root)
		StringTrimRight, root, root, 1
	If InStr(dir, s, "", 0) = StrLen(dir)
		StringTrimRight, dir, dir, 1
	Loop, Parse, dir, %s%
	{
		If A_LoopField = ..
			StringLeft, root, root, InStr(root, s, "", 0) - 1
		Else If A_LoopField =
			root =
		Else If A_LoopField != .
			Continue
		StringReplace, dir, dir, %A_LoopField%%s%
	}
	Return, pr . root . s . dir
}

; =================================================================================================
; | Memory
; =================================================================================================
getPID(windowName) {
	WinGet, processID, PID, %windowName%
	return processID
}

openProcess(processID, privileges := 0x1F0FFF){
	return DllCall("OpenProcess", "UInt", privileges, "UInt", 0, "UInt", processID, "UInt")
}

closeProcess(process){
	return !process ? false : DllCall("CloseHandle", "UInt", process, "UInt")
}

getModuleBaseAddress(sModule, hProcess) {
	if (!sModule || !hProcess)
		return false

	dwSize = 4096
	VarSetCapacity(hMods, dwSize)
	VarSetCapacity(cbNeeded, 4)
	dwRet := DllCall("Psapi.dll\EnumProcessModules", "UInt", hProcess, "UInt", &hMods, "UInt", dwSize, "UInt*", cbNeeded, "UInt")

	if (!dwRet)
		return false

	dwMods := cbNeeded / 4
	i := 0
	VarSetCapacity(hModule, 4)
	dwNameSize := 260 * (A_IsUnicode ? 2 : 1)
	VarSetCapacity(sCurModule, dwNameSize)

	while (i < dwMods) {
		hModule := NumGet(hMods, i * 4)
		DllCall("Psapi.dll\GetModuleFileNameEx", "UInt", hProcess, "UInt", hModule, "Str", sCurModule, "UInt", dwNameSize)
		SplitPath, sCurModule, sFilename
		
		if (sModule == sFilename)
			return hModule

		i += 1
	}

	return false
}

_DownloadToString(url, encoding="cp1250"){
	static a := "AutoHotkey/" A_AhkVersion
	if(!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
		return 0
	c := s := 0, o := ""
	if(f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr")){
		to := 0
		while(DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s>0){
			VarSetCapacity(b, s, 0)
			DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
			o .= StrGet(&b, r>>(encoding="utf-16"||encoding="cp1200"), encoding)
		}
		DllCall("wininet\InternetCloseHandle", "ptr", f)
	}
	DllCall("wininet\InternetCloseHandle", "ptr", h)
	return o
}

__ansiToUnicode(sString, nLen = 0) {
	if (!nLen)
		nLen := DllCall("MultiByteToWideChar", "UInt", 0, "UInt", 0, "UInt", &sString, "Int",  -1, "UInt", 0, "Int",  0)

	VarSetCapacity(wString, nLen * 2)
	DllCall("MultiByteToWideChar", "UInt", 0, "UInt", 0, "UInt", &sString, "Int",  -1, "UInt", &wString, "Int",  nLen)
	return wString
}

__ansiToGTA(sString) {
	VarSetCapacity(newString, (len := StrLen(sString)))
	
	Loop, % len
	{
		char := NumGet(sString, A_Index - 1, "UChar")
		msgbox % char
		NumPut((char == 252 ? 168 : char), &newString, A_Index - 1, "UChar")
		StringTrimLeft, sString, sString, 1
	}

	return newString
}

__unicodeToAnsi(wString, nLen = 0) {
	pString := wString + 1 > 65536 ? wString : &wString
	
	if (!nLen)
		nLen := DllCall("WideCharToMultiByte", "UInt", 0, "UInt", 0, "UInt", pString, "Int",  -1, "UInt", 0, "Int",  0, "UInt", 0, "UInt", 0)

	VarSetCapacity(sString, nLen)
	DllCall("WideCharToMultiByte", "UInt", 0, "UInt", 0, "UInt", pString, "Int",  -1, "Str",  sString, "Int",  nLen, "UInt", 0, "UInt", 0)
	return sString
}

__READSTRING(hProcess, dwAddress, oOffsets, dwLen) {
	if (!hProcess || !dwAddress)
		return ""

	VarSetCapacity(dwRead, dwLen)

	for i, o in oOffsets {
		if (i == oOffsets.MaxIndex()) {
			dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", dwLen, "UInt*", 0, "UInt")
			return !dwRet ? "" : (A_IsUnicode ? __ansiToUnicode(dwRead) : dwRead)
		}

		dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		
		if (!dwRet)
			return ""

		dwAddress := NumGet(dwRead, 0, "UInt")
	}
}

__DWORD(hProcess, dwAddress, offsets) {
	if (!hProcess || !dwAddress)
		return ""

	VarSetCapacity(dwRead, 4)

	for i, o in offsets {
		dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)

		if (!dwRet)
			return ""

		dwAddress := NumGet(dwRead, 0, "UInt")
	}

	return dwAddress
}

__READMEM(hProcess, dwAddress, oOffsets, sDatatype = "Int") {
	if (!hProcess || !dwAddress)
		return ""

	VarSetCapacity(dwRead, 4)

	for i, o in oOffsets {
		dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		
		if (!dwRet)
			return ""

		if (i == oOffsets.MaxIndex())
			return NumGet(dwRead, 0, sDatatype)
		
		dwAddress := NumGet(dwRead, 0, "UInt")
	}
}

__READBYTE(hProcess, dwAddress) {
	if (!checkHandles())
		return false

	VarSetCapacity(value, 1, 0)
	DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", value, "UInt", 1, "UInt *", 0)
	return NumGet(value, 0, "Byte")
}

__WRITESTRING(hProcess, dwAddress, oOffsets, wString) {
	if (!hProcess || !dwAddress)
		return false

	if A_IsUnicode
		wString := __unicodeToAnsi(wString)

	requiredSize := StrPut(wString)
	VarSetCapacity(buffer, requiredSize)

	for i, o in oOffsets {
		if (i == oOffsets.MaxIndex()) {
			StrPut(wString, &buffer, StrLen(wString) + 1)
			return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", requiredSize, "UInt", 0, "UInt")
		}
		
		dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", buffer, "UInt", 4, "UInt*", 0)
		
		if (!dwRet)
			return false

		dwAddress := NumGet(buffer, 0, "UInt")
	}
}

__WRITEMEM(hProcess, dwAddress, oOffsets, value, sDatatype = "Int") {
	dwLen := datatypes[sDatatype]
	
	if (dwLen < 1 || !hProcess || !dwAddress)
		return false

	VarSetCapacity(dwRead, 4)
	
	for i, o in oOffsets {
		if (i == oOffsets.MaxIndex()) {
			NumPut(value, dwRead, 0, sDatatype)
			return DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "UInt", &dwRead, "UInt", dwLen, "UInt", 0)
		}
		
		dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress + o, "Str", dwRead, "UInt", 4, "UInt*", 0)
		
		if (!dwRet)
			return false

		dwAddress := NumGet(dwRead, 0, "UInt")
	}
}

__WRITERAW(hProcess, dwAddress, pBuffer, dwLen) {
	return (!hProcess || !dwAddress || !pBuffer || dwLen < 1) ? false : DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress, "UInt", pBuffer, "UInt", dwLen, "UInt", 0, "UInt")
}

__WRITEBYTES(hProcess, dwAddress, byteArray) {
	if (!hProcess || !dwAddress || !byteArray)
		return false

	dwLen := byteArray.MaxIndex()
	VarSetCapacity(byteCode, dwLen)
	
	for i, o in byteArray
		NumPut(o, &byteCode, i - 1, "UChar")

	return __WRITERAW(hProcess, dwAddress, &byteCode, dwLen)
}

writeBytes(handle, address, bytes)
{
	length := strlen(bytes) / 2
	VarSetCapacity(toInject, length, 0)
	Loop %length%
	{
		byte := "0x" substr(bytes, ((A_Index - 1) * 2) + 1, 2)
		NumPut(byte, toInject, A_Index - 1, "uchar")
	}
	return writeRaw(handle, address, &toInject, length)
}

__CALL(hProcess, dwFunc, aParams, bCleanupStack = true, bThisCall = false, bReturn = false, sDatatype = "Char") {
	if (!hProcess || !dwFunc)
		return ""

	dataOffset := 0
	i := aParams.MaxIndex()
	bytesUsed := 0
	bytesMax := 5120
	dwLen := i * 5 + bCleanupStack * 3 + bReturn * 5 + 6
	VarSetCapacity(injectData, dwLen, 0)

	while (i > 0) {
		if (aParams[i][1] == "i" || aParams[i][1] == "p" || aParams[i][1] == "f")
			value := aParams[i][2]
		else if (aParams[i][1] == "s") {
			if (bytesMax - bytesUsed < StrLen(aParams[i][2]))
				return ""
			
			value := pMemory + bytesUsed
			__WRITESTRING(hProcess, value, [0x0], aParams[i][2])
			bytesUsed += StrLen(aParams[i][2]) + 1
			
			if (ErrorLevel)
				return ""
		}
		else
			return ""

		NumPut((bThisCall && i == 1 ? 0xB9 : 0x68), injectData, dataOffset, "UChar")
		NumPut(value, injectData, ++dataOffset, aParams[i][1] == "f" ? "Float" : "Int")
		dataOffset += 4
		i--
	}

	offset := dwFunc - (pInjectFunc + dataOffset + 5)
	NumPut(0xE8, injectData, dataOffset, "UChar")
	NumPut(offset, injectData, ++dataOffset, "Int")
	dataOffset += 4

	if (bReturn) {
		NumPut(sDatatype = "Char" || sDatatype = "UChar" ? 0xA2 : 0xA3, injectData, dataOffset, "UChar")
		NumPut(pMemory, injectData, ++dataOffset, "UInt")
		dataOffset += 4
	}

	if (bCleanupStack) {
		NumPut(0xC483, injectData, dataOffset, "UShort")
		dataOffset += 2
		NumPut((aParams.MaxIndex() - bThisCall) * 4, injectData, dataOffset, "UChar")
		dataOffset++
	}

	NumPut(0xC3, injectData, dataOffset, "UChar")
	__WRITERAW(hGTA, pInjectFunc, &injectData, dwLen)
	
	if (ErrorLevel)
		return ""

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)

	if (ErrorLevel)
		return ""

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)
	
	if (bReturn)
		return __READMEM(hGTA, pMemory, [0x0], sDatatype)

	return true
}

__INJECT(hProcess, aInstructions) {
	aOpcodes := { "mov edi" : 0x3D8B, "NOP" : 0x90, "mov ecx" : 0xB9, "mov dword" : 0x05C7, "push" : 0x68, "call" : 0xE8, "mov byte" : 0x05C6
	, "ret" : 0xC3, "add esp" : 0xC483, "xor edi, edi" : 0xFF33, "xor eax, eax" : 0xC033, "mov edi, eax" : 0xF88B, "push edi" : 0x57, "push eax" : 0x50
	, "mov address, eax" : 0xA3, "mov [address], eax" : 0x0589, "test eax, eax" : 0xC085, "jz" : 0x74, "mov ecx, eax" : 0xC88B, "jmp" : 0xEB
	, "mov edx" : 0xBA, "fstp" : 0x1DD9}

	dwLen := 0
	
	for i, o in aInstructions
		dwLen += getByteSize(aOpcodes[o[1]]) + ((datatypes[o[2][2]] == null) ? 0 : datatypes[o[2][2]]) + ((datatypes[o[3][2]] == null ? 0 : datatypes[o[3][2]]))

	VarSetCapacity(injectData, dwLen, 0)
	dwDataOffset := 0

	for i, o in aInstructions {
		NumPut(aOpcodes[o[1]], injectData, dwDataOffset, getByteSize(aOpcodes[o[1]]) == 1 ? "UChar" : "UShort")
		dwDataOffset += getByteSize(aOpcodes[o[1]])
		
		if (o[2][1] != null) {
			NumPut(o[2][1] - (o[1] = "call" ? (pInjectFunc + 4 + dwDataOffset) : 0), injectData, dwDataOffset, o[2][2])
			dwDataOffset += datatypes[o[2][2]]
		}
		else
			continue
		
		if (o[3][1] != null) {
			NumPut(o[3][1], injectData, dwDataOffset, o[3][2])
			dwDataOffset += datatypes[o[3][2]]
		}
	}

	__WRITERAW(hGTA, pInjectFunc, &injectData, dwLen)
	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)
	return ErrorLevel ? false : __READMEM(hGTA, pMemory, [0x0], "Int")
}

readDWORD(hProcess, dwAddress) {
	if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return 0
	}

	VarSetCapacity(dwRead, 4)
	dwRet := DllCall(    "ReadProcessMemory"
	, "UInt",  hProcess
	, "UInt",  dwAddress
	, "Str",   dwRead
	, "UInt",  4
	, "UInt*", 0)

	if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return NumGet(dwRead, 0, "UInt")
}

readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
	if(!hProcess) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return 0
	}

	VarSetCapacity(dwRead, dwLen)
	dwRet := DllCall(    "ReadProcessMemory"
	, "UInt",  hProcess
	, "UInt",  dwAddress
	, "Str",   dwRead
	, "UInt",  dwLen
	, "UInt*", 0)

	if(dwRet == 0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
	return NumGet(dwRead, 0, type)
}

virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
	return (!hProcess || !dwSize) ? false : DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", dwSize, "UInt", flAllocationType, "UInt", flProtect, "UInt")
}

virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
	return (!hProcess || !lpAddress || !dwSize) ? false : DllCall("VirtualFreeEx", "UInt", hProcess, "UInt", lpAddress, "UInt", dwSize, "UInt", dwFreeType, "UInt")
}

createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
	return (!hProcess) ? false : DllCall("CreateRemoteThread", "UInt", hProcess, "UInt", lpThreadAttributes, "UInt", dwStackSize, "UInt", lpStartAddress, "UInt", lpParameter, "UInt", dwCreationFlags, "UInt", lpThreadId, "UInt")
}

waitForSingleObject(hThread, dwMilliseconds) {
	return !hThread ? false : !(DllCall("WaitForSingleObject", "UInt", hThread, "UInt", dwMilliseconds, "UInt") == 0xFFFFFFFF)
}

IntToHex(value, prefix := true) {
	CurrentFormat := A_FormatInteger
	SetFormat, Integer, hex
	value += 0
	SetFormat, Integer, %CurrentFormat%
	Int2 := SubStr(value, 3)
	StringUpper value, Int2
	return (prefix ? "0x" : "") . value
}

NOP(hProcess, dwAddress, dwLen) {
	if (dwLen < 1 || !hProcess || !dwAddress)
		return false
	VarSetCapacity(byteCode, dwLen)
	Loop % dwLen
		NumPut(0x90, &byteCode, A_Index - 1, "UChar")
	return __WRITERAW(hProcess, dwAddress, &byteCode, dwLen)
}

increaseValue(dwAddress, value, sDatatype := "UInt") {
	return !checkHandles() ? false : __WRITEMEM(hGTA, dwAddress, [0x0], __READMEM(hGTA, dwAddress, [0x0], sDatatype) + value, sDatatype)
}

isInteger(arg) {
	if arg is integer
		return true

	return false
}

isFloat(arg) {
	if arg is float
		return true
	
	return false
}

fileCountLines(path) {
	FileRead, text, % path
	StringReplace, text, text, `r, `n, All UseErrorLevel
	return ErrorLevel + 1
}

getByteSize(number) {
	return number <= 0xFF ? 1 : number <= 0xFFFF ? 2 : 4
}

HTTPData(url, default="", encoding="cp1250", brton=0){
	global DownloadMode
	static useragent := "AutoHotkey/" A_AhkVersion
	if(DownloadMode = 0){
		if(!out := DownloadToString(url, encoding))
			return default " [Error 0-1]"
		if(brton)
			StringReplace, out, out, <br>, `n, All
		return out
	}
	else if(DownloadMode = 1){
		URLDownloadToFile, %url%, %A_Temp%\sBinder\sbinder.tmp
		if(ErrorLevel)
			return default " [Error 1-1]"
		FileRead, out, %A_Temp%\sBinder\sbinder.tmp
		if(ErrorLevel)
			return default " [Error 1-2]"
		FileDelete, %A_Temp%\sBinder\sbinder.tmp
		if(brton)
			StringReplace, out, out, <br>, `n, All
		return (out ? out : default " [Error 1-0]")
	}
	else{
		static WebRequest
		if(!WebRequest AND !WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1"))
			return default " [Error 2-1]"
		try{
			WebRequest.Open("GET", url)
			WebRequest.setRequestHeader("User-Agent", useragent)
			WebRequest.setRequestHeader("Cache-Control", "no-cache, no-store")
			WebRequest.Send()
		}
		catch
			return default " [Error 2-2]"
		out := WebRequest.ResponseText
		if(DownloadMode = "GetHeaders")
			MsgBox, % WebRequest.GetAllResponseHeaders()
		if(brton)
			StringReplace, out, out, <br>, `n, All
		return (out != "" ? out : default " [Error 2-0]")
	}
	return default " [Error X]"
}

; =================================================================================================
; | API
; =================================================================================================
; ##### Spielerfunktionen #####
GetPlayerInteriorId() {
    if(!checkHandles())
        return -1
    
    iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return iid
}

GetPlayerSkinId() {
    if(!checkHandles())
        return -1
    
    dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwCPedPtr + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

GetPlayerMoney() {
    if(!checkHandles())
        return ""
    
    money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return money
}

GetPlayerWanteds() {
    if(!checkHandles())
        return -1
 
    dwPtr := 0xB7CD9C
    dwPtr := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    Wanteds := readDWORD(hGTA, dwPtr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
 
    ErrorLevel := ERROR_OK
    return Wanteds
}

GetPlayerWeaponName() {
    id := GetPlayerWeaponId(GetID(), 1)
    if(id >= 0 && id < 44)
    {
        return oweaponNames[id+1]
    }
    return ""
}

IsPlayerInMenu() {
    if(!checkHandles())
        return -1
    
    IsInMenu := readMem(hGTA, 0xBA67A4, 4, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return IsInMenu
}

GetPlayerMapPosX() {
    if(!checkHandles())
        return -1
    
    MapPosX := readFloat(hGTA, 0xBA67B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosX
}

GetPlayerMapPosY() {
    if(!checkHandles())
        return -1
    
    MapPosY := readFloat(hGTA, 0xBA67BC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapPosY
}

GetPlayerMapZoom() {
    if(!checkHandles())
        return -1
    
    MapZoom := readFloat(hGTA, 0xBA67AC)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return MapZoom
}

downloadFile(url, dir := "", fileName := "") {
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", url, true)
	whr.Send()
	whr.WaitForResponse()

	; see https://autohotkey.com/boards/viewtopic.php?f=74&t=7190
	body := whr.ResponseBody
	data := NumGet(ComObjValue(body) + 8 + A_PtrSize, "UInt")
	size := body.MaxIndex() + 1

	if !InStr(FileExist(dir), "D")
		FileCreateDir % dir

	SplitPath url, urlFileName
	f := FileOpen(dir (fileName ? fileName : urlFileName), "w")
	f.RawWrite(data + 0, size)
	f.Close()
}

IsPlayerFreezed() {
    if(!checkHandles())
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    IPF := readMem(hGTA, dwGTA + 0x690495, 2, "byte")    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK    
    return IPF
}

GetPlayerRadiostationId() {
    if(!checkHandles())
        return -1
    
    if(IsPlayerInAnyVehicle() == 0)
        return -1
    
    dwGTA := getModuleBaseAddress("gta_sa.exe", hGTA)
    RadioStationID := readMem(hGTA, dwGTA + 0x4CB7E1, 1, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    return RadioStationID
}

GetPlayerRadiostationName() {
    if(IsPlayerInAnyVehicle() == 0)
        return -1
    
    id := GetPlayerRadiostationID()
    
    if(id == 0)
        return -1
    
    if(id >= 0 && id < 14)
    {
        return oradiostationNames[id]
    }
    return ""
}

GetTargetPed() {
	if(!checkHandles())
        return 0
	
	dwAddress := readDWORD(hGTA, 0xB6F3B8)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	if(!dwAddress)
		return 0
		
	dwAddress := readDWORD(hGTA, dwAddress+0x79C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	
	ErrorLevel := ERROR_OK
	return dwAddress
}

CalcScreenCoords(fX, fY, fZ) {
	if(!checkHandles())
		return false
	
	dwM := 0xB6FA2C
	
	m_11 := readFloat(hGTA, dwM + 0*4)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	
	m_12 := readFloat(hGTA, dwM + 1*4)
	m_13 := readFloat(hGTA, dwM + 2*4)
	m_21 := readFloat(hGTA, dwM + 4*4)
	m_22 := readFloat(hGTA, dwM + 5*4)
	m_23 := readFloat(hGTA, dwM + 6*4)
	m_31 := readFloat(hGTA, dwM + 8*4)
	m_32 := readFloat(hGTA, dwM + 9*4)
	m_33 := readFloat(hGTA, dwM + 10*4)
	m_41 := readFloat(hGTA, dwM + 12*4)
	m_42 := readFloat(hGTA, dwM + 13*4)
	m_43 := readFloat(hGTA, dwM + 14*4)
	
	dwLenX := readDWORD(hGTA, 0xC17044)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}
	dwLenY := readDWORD(hGTA, 0xC17048)
	
	frX := fZ * m_31 + fY * m_21 + fX * m_11 + m_41
	frY := fZ * m_32 + fY * m_22 + fX * m_12 + m_42
	frZ := fZ * m_33 + fY * m_23 + fX * m_13 + m_43
	
	fRecip := 1.0/frZ
	frX *= fRecip * dwLenX
	frY *= fRecip * dwLenY
    
    if(frX<=dwLenX && frY<=dwLenY && frZ>1)
        return [frX,frY,frZ]
}

GetPedById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return 0
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
            if(oScoreboardData[dwId].HasKey("PED"))
                return oScoreboardData[dwId].PED
        }
        return 0
    }
    
    if(!updateOScoreboardData())
        return 0
    
    if(oScoreboardData[dwId])
    {
        if(oScoreboardData[dwId].HasKey("PED"))
            return oScoreboardData[dwId].PED
    }
    return 0
}

GetIdByPed(dwPed) {
    dwPed += 0
    dwPed := Floor(dwPed)
	if(!dwPed)
		return -1
	
	if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
		For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
				if(o.PED==dwPed)
					return i
            }
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
	For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
			if(o.PED==dwPed)
				return i
        }
    }
    return -1
}

GetStreamedInPlayersInfo() {
    r:=[]
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(o.HasKey("PED"))
            {
                p := GetPedCoordinates(o.PED)
                if(p)
                {
                    o.POS := p
                    r[i] := o
                }
            }
        }
        return r
    }
    
    if(!updateOScoreboardData())
        return ""
    
    For i, o in oScoreboardData
    {
        if(o.HasKey("PED"))
        {
            p := GetPedCoordinates(o.PED)
            if(p)
            {
                o.POS := p
                r[i] := o
            }
        }
    }
    return r
}

CallFuncForAllStreamedInPlayers(cfunc, dist=0x7fffffff) {
    cfunc := "" cfunc
    dist += 0
    if(!IsFunc(cfunc))
        return false
    p := GetStreamedInPlayersInfo()
    if(!p)
        return false
    if(dist<0x7fffffff)
    {
        lpos := GetPlayerCoordinates()
        if(!lpos)
            return false
        For i, o in p
        {
            if(dist>GetDist(lpos,o.POS))
                %cfunc%(o)
        }
    }
    else
    {
        For i, o in p
            %cfunc%(o)
    }
    return true
}

GetDist(pos1, pos2) {
	if(!pos1 || !pos2)
		return 0
    return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}

GetClosestPlayerPed() {
    dist := 0x7fffffff              ;max int32
    p := GetStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := GetPlayerCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=GetDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    PED := GetPedById(id)
    return PED
}

GetClosestPlayerId() {
    dist := 0x7fffffff              ;max int32
    p := GetStreamedInPlayersInfo()
	if(!p)
		return -1
    lpos := GetPlayerCoordinates()
    if(!lpos)
        return -1
	id := -1
    For i, o in p
    {
        t:=GetDist(lpos,o.POS)
        if(t<dist)
        {
            dist := t
            id := i
        }
    }
    return id
}

CountOnlinePlayers() {
    if(!checkHandles())
        return -1
    
    dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    dwAddr := dwOnline + 0x4
    OnlinePlayers := readDWORD(hGTA, dwAddr)
    
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return OnlinePlayers
}

GetPedCoordinates(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return ""
    
    if(!checkHandles())
        return ""

    dwAddress := readDWORD(hGTA, dwPED + 0x14)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fX := readFloat(hGTA, dwAddress + 0x30)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, dwAddress + 0x34)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, dwAddress + 0x38)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

GetTargetPosById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
        {
			if(oScoreboardData[dwId].HasKey("PED"))
				return GetPedCoordinates(oScoreboardData[dwId].PED)
			if(oScoreboardData[dwId].HasKey("MPOS"))
				return oScoreboardData[dwId].MPOS
		}
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
    {
		if(oScoreboardData[dwId].HasKey("PED"))
			return GetPedCoordinates(oScoreboardData[dwId].PED)
		if(oScoreboardData[dwId].HasKey("MPOS"))
			return oScoreboardData[dwId].MPOS
	}
    return ""
}

GetTargetPlayerSkinIdByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

GetTargetPlayerSkinIdById(dwId) {
    if(!checkHandles())
        return -1
    
    dwPED := GetPedById(dwId)
    dwAddr := dwPED + ADDR_CPED_SKINIDOFF
    
    SkinID := readMem(hGTA, dwAddr, 2, "byte")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return SkinID
}

GetVehiclePointerByPed(dwPED) {
    dwPED += 0
    dwPED := Floor(dwPED)
    if(!dwPED)
        return 0
	if(!checkHandles())
        return 0
	dwAddress := readDWORD(hGTA, dwPED + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

GetVehiclePointerById(dwId) {
    if(!dwId)
        return 0
	if(!checkHandles())
        return 0
    
    dwPed_By_Id := GetPedById(dwId)
    
	dwAddress := readDWORD(hGTA, dwPed_By_Id + 0x58C)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
	ErrorLevel := ERROR_OK
	return dwAddress
}

IsTargetInAnyVehicleByPed(dwPED) {
    if(!checkHandles())
        return -1
    
    dwVehiclePointer := GetVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

IsTargetInAnyVehicleById(dwId) {
    if(!checkHandles())
        return -1
    
    dwPedPointer := GetPedById(dwId)
    dwVehiclePointer := GetVehiclePointerByPed(dwPedPointer)
    
    if(dwVehiclePointer > 0)
    {
        return 1
    }
    else if(dwVehiclePointer <= 0)
    {
        return 0
    }
    else
    {
        return -1
    }
}

GetTargetVehicleHealthByPed(dwPed) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := GetVehiclePointerByPed(dwPed)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

GetTargetVehicleHealthById(dwId) {
    if(!checkHandles())
        return -1
    
    dwVehPtr := GetVehiclePointerById(dwId)    
    dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
    fHealth := readFloat(hGTA, dwAddr)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
    
    ErrorLevel := ERROR_OK
    return Round(fHealth)
}

GetTargetVehicleSpeedById(dwId) {
    if(!checkHandles())
        return -1
 
    dwAddr := GetVehiclePointerById(dwId)
    
    fSpeedX := readMem(hGTA, dwAddr + ADDR_VEHICLE_X, 4, "float")
    fSpeedY := readMem(hGTA, dwAddr + ADDR_VEHICLE_Y, 4, "float")
    fSpeedZ := readMem(hGTA, dwAddr + ADDR_VEHICLE_Z, 4, "float")
    
    fVehicleSpeed :=  sqrt((fSpeedX * fSpeedX) + (fSpeedY * fSpeedY) + (fSpeedZ * fSpeedZ))
    fVehicleSpeed := (fVehicleSpeed * 100) * 1.43           ;Der Wert "1.43" ist meistens auf jedem Server anders. Die Geschwindigkeit wird somit erhöht bzw. verringert
 
	return fVehicleSpeed
}

GetChatLineCount(){
	FileRead, ChatLogCountTemp, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	StringReplace, ChatLogCountTemp, ChatLogCountTemp, `n, `n, UseErrorLevel
	return ErrorLevel
}

GetChatLine(Line, ByRef Output, CurrentChatlogLines=-1, timestamp=0, color=0){
	global

	if(CurrentChatlogLines == -1)
		CurrentChatlogLines:= GetChatLineCount()

	ChatlogRequestedIndex:= CurrentChatlogLines - Line
	GetChatLineOutput:= ""

	FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
	Loop, Parse, file, `n, `r
	{
		if (A_Index == ChatlogRequestedIndex) {
			GetChatLineOutput := A_LoopField
			break
		}
	}

	file := ""
	
	if(!timestamp)
		GetChatLineOutput := RegExReplace(GetChatLineOutput, "U)^[\d{2}:\d{2}:\d{2}]")

	if(!color)
		GetChatLineOutput := RegExReplace(GetChatLineOutput, "Ui)\{[a-f0-9]{6}\}")

	Output:= GetChatLineOutput
	return
}

checkForEmptyChatlog(){
	if(GetChatLineCount() <= 1) {
		processChatCount:= 0
	}
}

hasValue(haystack, needle) {
	if(!isObject(haystack))
		return false

	if(haystack.Length()==0)
		return false

	for k,v in haystack
		if(v==needle)
			return true

	return false
}

AntiCrash() {
    If(!checkHandles())
        return false

    cReport := ADDR_SAMP_CRASHREPORT
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
    cReport += 0x9
    writeMemory(hGTA, dwSAMP + cReport, 0x90909090, 4)
    cReport += 0x4
    writeMemory(hGTA, dwSAMP + cReport, 0x90, 1)
}

GetDialogStructPtr() {
	if (!checkHandles()) {
		ErrorLevel := ERROR_INVALID_HANDLE
		return false
	}

	dwPointer := readDWORD(hGTA, dwSAMP + SAMP_DIALOG_STRUCT_PTR)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return dwPointer
}

GetDialogLine__(index) {
	if (GetDialogLineCount > index)
		return ""

	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return ""

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return ""
	}

	dwLineAddress := readDWORD(hGTA, dwPointer + (index - 1) * 0x4)
	line := readString(hGTA, dwLineAddress, 128)

	ErrorLevel := ERROR_OK
	return line
}

GetDialogLines() {
	text := GetDialogText()
	if (text == "")
		return -1

	lines := StrSplit(text, "`n")
	return lines
}

IsDialogButton1Selected() {
	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return false

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	selected := readMem(hGTA, dwPointer + SAMP_DIALOG_BUTTON_HOVERING_OFFSET, 1, "Byte")
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return false
	}

	ErrorLevel := ERROR_OK
	return selected
}

GetDialogLines__() {
	count := GetDialogLineCount()

	dwPointer := GetDialogStructPtr()
	if (ErrorLevel || !dwPointer)
		return -1

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_PTR1_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwPointer := readDWORD(hGTA, dwPointer + SAMP_DIALOG_LINES_OFFSET)
	if (ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	lines := []
	Loop %count% {
		dwLineAddress := readDWORD(hGTA, dwPointer + (A_Index - 1) * 0x4)
		lines[A_Index] := readString(hGTA, dwLineAddress, 128)
	}

	ErrorLevel := ERROR_OK
	return lines
}

GetPlayerNameById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].NAME
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].NAME
    return ""
}

GetPlayerIdByName(wName) {
    wName := "" wName
    if(StrLen(wName) < 1 || StrLen(wName) > 24)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        For i, o in oScoreboardData
        {
            if(InStr(o.NAME,wName)==1)
                return i
        }
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    For i, o in oScoreboardData
    {
        if(InStr(o.NAME,wName)==1)
            return i
    }
    return -1
}

GetPlayerScoreById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return ""
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].SCORE
        return ""
    }
    
    if(!updateOScoreboardData())
        return ""
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].SCORE
    return ""
}

GetPlayerPingById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
        
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].PING
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].PING
    return -1
}

IsNPCById(dwId) {
    dwId += 0
    dwId := Floor(dwId)
    if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
        return -1
    
    if(iRefreshScoreboard+iUpdateTick > A_TickCount)
    {
        if(oScoreboardData[dwId])
            return oScoreboardData[dwId].ISNPC
        return -1
    }
    
    if(!updateOScoreboardData())
        return -1
    
    if(oScoreboardData[dwId])
        return oScoreboardData[dwId].ISNPC
    return -1
}

UpdateScoreboardDataEx() {
    if(!checkHandles())
        return false
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)            ;g_SAMP
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    
    dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
    
    VarSetCapacity(injectData, 11, 0) ;mov + call + retn
    
    NumPut(0xB9, injectData, 0, "UChar")
    NumPut(dwAddress, injectData, 1, "UInt")
    
    NumPut(0xE8, injectData, 5, "UChar")
    offset := dwFunc - (pInjectFunc + 10)
    NumPut(offset, injectData, 6, "Int")
    NumPut(0xC3, injectData, 10, "UChar")
    
    writeRaw(hGTA, pInjectFunc, &injectData, 11)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
    
}

UpdateOScoreboardData() {
    if(!checkHandles())
        return 0
    
    oScoreboardData := []
    
    if(!UpdateScoreboardDataEx())
        return 0
    
    iRefreshScoreboard := A_TickCount
    
    dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
    if(ErrorLevel || dwPlayers==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")    ;sLocalPlayerID
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")    ;iStrlen_LocalPlayerName
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    sUsername := ""
    if(dwTemp <= 0xf) {
        sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)       ;szLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    else {
        dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)        ;pszLocalPlayerName
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := readString(hGTA, dwAddress, 25)
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
    }
    oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
    
    Loop, % SAMP_PLAYER_MAX
    {
        i := A_Index-1
        
        dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)      ;pRemotePlayer
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        if(dwRemoteplayer==0)
            continue
        
        dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        
        dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        sUsername := ""
        if(dwTemp <= 0xf)
        {
            sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        else {
            dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
            if(ErrorLevel || dwAddress==0) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
            sUsername := readString(hGTA, dwAddress, 25)
            if(ErrorLevel) {
                ErrorLevel := ERROR_READ_MEMORY
                return 0
            }
        }
        o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
        oScoreboardData[i] := o
        
        dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)                ;pPlayerData
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwRemoteplayerData==0)		;this ever happen?
            continue
		
		dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)        ;iGlobalMarkerLoaded
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		if(dwAddress)
		{
			ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")        ;x map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")        ;y map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")        ;z map
			if(ErrorLevel) {
				ErrorLevel := ERROR_READ_MEMORY
				return 0
			}
			o.MPOS := [ix, iy, iz]
		}
        
        dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)                ;pSAMP_Actor
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwpSAMP_Actor==0)               ;not streamed in
            continue

        dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)                ;pGTA_Ped_
        if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
        if(dwPed==0)
            continue
        o.PED := dwPed
		
		fHP := readFloat(hGTA, dwRemoteplayerData + 444)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
		if(ErrorLevel) {
            ErrorLevel := ERROR_READ_MEMORY
            return 0
        }
		o.HP := fHP
		o.ARMOR := fARMOR
    }
    ErrorLevel := ERROR_OK
    return 1
}

DisableCheckpoint() {
    if(!checkHandles())
        return false
    dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_INCHAT_PTR) ;misc info
    if(ErrorLevel || dwAddress==0) {
        ErrorLevel := ERROR_READ_MEMORY
        return false
    }
    VarSetCapacity(enablecp, 4, 0)
    NumPut(0,enablecp,0,"Int")
    writeRaw(hGTA, dwAddress+0x24, &enablecp, 4)
    ErrorLevel := ERROR_OK
    return true
}

IsMarkerCreated() {
    If(!checkHandles())
        return false
    active := readMem(hGTA, ADDR_CP_CHECK, 1, "byte")
    If(!active)
        return 0
    else return 1
}

CoordsFromRedmarker() {
    if(!checkhandles())
        return false
    for i, v in ADDR_REDMARKER
    f%i% := readFloat(hGTA, v)
    return [f1, f2, f3]
}

GetPlayerCoordinates() {
    if(!checkHandles())
        return ""
    
    fX := readFloat(hGTA, ADDR_POSITION_X)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fY := readFloat(hGTA, ADDR_POSITION_Y)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    fZ := readFloat(hGTA, ADDR_POSITION_Z)
    if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return ""
    }
    
    ErrorLevel := ERROR_OK
    return [fX, fY, fZ]
}

CalculateZone(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        InitZonesAndCities()
        bInitZaC := 1
    }
        
    Loop % nZone-1
    {
        if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
        {
            ErrorLevel := ERROR_OK
            return zone%A_Index%_name
        }
    }
    
    ErrorLevel := ERROR_ZONE_NOT_FOUND
    return "Unbekannt"
}

CalculateCity(posX, posY, posZ) {
    if ( bInitZaC == 0 )
    {
        InitZonesAndCities()
        bInitZaC := 1
    }
    smallestCity := "Unbekannt"
    currentCitySize := 0
    smallestCitySize := 0
    
    Loop % nCity-1
    {
        if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
        {
            currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
            if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
            {
                smallestCity := city%A_Index%_name
                smallestCitySize := currentCitySize
            }
        }
    }
    
    if(smallestCity == "Unbekannt") {
        ErrorLevel := ERROR_CITY_NOT_FOUND
    } else {
        ErrorLevel := ERROR_OK
    }
    return smallestCity
}

GetPlayerZone() {
	aktPos := GetPlayerCoordinates()
	return CalculateZone(aktPos[1], aktPos[2], aktPos[3])
}

GetPlayerCity() {
	aktPos := GetPlayerCoordinates()
	return CalculateCity(aktPos[1], aktPos[2], aktPos[3])
}

InitZonesAndCities() {
    AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
    AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
    AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
    AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
    AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
    AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
    AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
    AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
    AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
    AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
    
    AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
    AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
    AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
    AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
    AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
    AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
    AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
    AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
    AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
    AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
    AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
    AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
    AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
    AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
    AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
    AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
    AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
    AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
    AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
    AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
    AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
    AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
    AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
    AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
    AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
    AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
    AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
    AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
    AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
    AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
    AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
    AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
    AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
    AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
    AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
    AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
    AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
    AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
    AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
    AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
    AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
    AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
    AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
    AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
    AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
    AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
    AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
    AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
    AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
    AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
    AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
    AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
    AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
    AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
    AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
    AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
    AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
    AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
    AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
    AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
    AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
    AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
    AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
    AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
    AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
    AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
    AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
    AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
    AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
    AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
    AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
    AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
    AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
    AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
    AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
    AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
    AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
    AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
    AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
    AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
    AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
    AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
    AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
    AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
    AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
    AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
    AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
    AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
    AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
    AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
    AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
    AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
    AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
    AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
    AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
    AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
    AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
    AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
    AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
    AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
    AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
    AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
    AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
    AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
    AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
    AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
    AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
    AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
    AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
    AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
    AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
    AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
    AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
    AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
    AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
    AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
    AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
    AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
    AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
    AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
    AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
    AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
    AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
    AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
    AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
    AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
    AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
    AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
    AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
    AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
    AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
    AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
    AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
    AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
    AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
    AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
    AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
    AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
    AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
    AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
    AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
    AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
    AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
    AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
    AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
    AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
    AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
    AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
    AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
    AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
    AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
    AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
    AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
    AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
    AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
    AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
    AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
    AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
    AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
    AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
    AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
    AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
    AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
    AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
    AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
    AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
    AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
    AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
    AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
    AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
    AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
    AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
    AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
    AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
    AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
    AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
    AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
    AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
    AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
    AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
    AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
    AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
    AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
    AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
    AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
    AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
    AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
    AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
    AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
    AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
    AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
    AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
    AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
    AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
    AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
    AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
    AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
    AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
    AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
    AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
    AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
    AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
    AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
    AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
    AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
    AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
    AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
    AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
    AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
    AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
    AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
    AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
    AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
    AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
    AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
    AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
    AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
    AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
    AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
    AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
    AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
    AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
    AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
    AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
    AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
    AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
    AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
    AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
    AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
    AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
    AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
    AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
    AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
    AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
    AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
    AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
    AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
    AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
    AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
    AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
    AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
    AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
    AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
    AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
    AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
    AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
    AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
    AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
    AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
    AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
    AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
    AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
    AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
    AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
    AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
    AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
    AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
    AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
    AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
    AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
    AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
    AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
    AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
    AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
    AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
    AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
    AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
    AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
    AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
    AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
    AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
    AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
    AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
    AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
    AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
    AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
    AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
    AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
    AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
    AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
    AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
    AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
    AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
    AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
    AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
    AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
    AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
    AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
    AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
    AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
    AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
    AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
    AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
    AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
    AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
    AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
    AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
    AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
    AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
    AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
    AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
    AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
    AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
    AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
    AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
    AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
    AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
    AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
    AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
    AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
    AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
    AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
    AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
    AddZone("Itanis Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
    AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
    AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
    AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
    AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
    AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
    AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
    AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
    AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
    AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
    AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
    AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
    AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
    AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
    AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
    AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
    AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
    AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
    AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
    AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
    AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
    AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
    AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
    AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
    AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
    AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
    AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
    AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
    AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
    AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
    AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
    AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
    AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
    AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
    AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
    AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
    AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
    AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
    AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
    AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
    AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
    AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
    AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
    AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
    AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
    AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
    AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
    AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
    AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
    AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
    AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
    AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
    AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
    AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
    AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
    AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
    AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
    AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
    AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
}

AddZone(sName, x1, y1, z1, x2, y2, z2) {
    global
    zone%nZone%_name := sName
    zone%nZone%_x1 := x1
    zone%nZone%_y1 := y1
    zone%nZone%_z1 := z1
    zone%nZone%_x2 := x2
    zone%nZone%_y2 := y2
    zone%nZone%_z2 := z2
    nZone := nZone + 1
}

AddCity(sName, x1, y1, z1, x2, y2, z2) {
    global
    city%nCity%_name := sName
    city%nCity%_x1 := x1
    city%nCity%_y1 := y1
    city%nCity%_z1 := z1
    city%nCity%_x2 := x2
    city%nCity%_y2 := y2
    city%nCity%_z2 := z2
    nCity := nCity + 1
}

writeMemory(hProcess,address,writevalue,length=4, datatype="int") {
  if(!hProcess) {
    ErrorLevel := ERROR_INVALID_HANDLE
    return false
  }

  VarSetCapacity(finalvalue,length, 0)
  NumPut(writevalue,finalvalue,0,datatype)
  dwRet :=  DllCall(  "WriteProcessMemory"
              ,"Uint",hProcess
              ,"Uint",address
              ,"Uint",&finalvalue
              ,"Uint",length
              ,"Uint",0)
  if(dwRet == 0) {
    ErrorLevel := ERROR_WRITE_MEMORY
    return false
  }

  ErrorLevel := ERROR_OK
  return true
}

readString(hProcess, dwAddress, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(sRead, dwLen)
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sRead
                        , "UInt", dwLen
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    if A_IsUnicode
        return __ansiToUnicode(sRead)
    return sRead
}

readFloat(hProcess, dwAddress) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return 0
    }
    
    VarSetCapacity(dwRead, 4)    ; float = 4
    dwRet := DllCall(    "ReadProcessMemory"
                        , "UInt",  hProcess
                        , "UInt",  dwAddress
                        , "Str",   dwRead
                        , "UInt",  4
                        , "UInt*", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLevel := ERROR_READ_MEMORY
        return 0
    }
    
    ErrorLevel := ERROR_OK
    return NumGet(dwRead, 0, "Float")
}

writeString(hProcess, dwAddress, wString) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    sString := wString
    if A_IsUnicode
        sString := __unicodeToAnsi(wString)
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "Str", sString
                        , "UInt", StrLen(wString) + 1
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    
    dwRet := DllCall(    "WriteProcessMemory"
                        , "UInt", hProcess
                        , "UInt", dwAddress
                        , "UInt", pBuffer
                        , "UInt", dwLen
                        , "UInt", 0
                        , "UInt")
    if(dwRet == 0) {
        ErrorLEvel := ERROR_WRITE_MEMORY
        return false
    }
    
    ErrorLevel := ERROR_OK
    return true
}

Memory_ReadByte(process_handle, address) {
	VarSetCapacity(value, 1, 0)
	DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
	return, NumGet(value, 0, "Byte")
}

callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
    if(!hProcess) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    validParams := 0
    
    i := aParams.MaxIndex()
    
    ;         i * PUSH + CALL + RETN
    dwLen := i * 5    + 5    + 1
    if(bCleanupStack)
        dwLen += 3
    VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
    
    i_ := 1
    while(i > 0) {
        if(aParams[i][1] != "") {
            dwMemAddress := 0x0
            if(aParams[i][1] == "p") {
                dwMemAddress := aParams[i][2]
            } else if(aParams[i][1] == "s") {
                if(i_>3)
                    return false
                dwMemAddress := pParam%i_%
                writeString(hProcess, dwMemAddress, aParams[i][2])
                if(ErrorLevel)
                    return false
                i_ += 1
            } else if(aParams[i][1] == "i") {
                dwMemAddress := aParams[i][2]
            } else {
                return false
            }
            NumPut(0x68, injectData, validParams * 5, "UChar")
            NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
            validParams += 1
        }
        i -= 1
    }
    
    offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
    NumPut(0xE8, injectData, validParams * 5, "UChar")
    NumPut(offset, injectData, validParams * 5 + 1, "Int")
    
    if(bCleanupStack) {
        NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
        NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
        
        NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
    } else {
        NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
    }
    
    writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
    if(ErrorLevel)
        return false
    
    hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
    if(ErrorLevel)
        return false
    
    waitForSingleObject(hThread, 0xFFFFFFFF)
    
    closeProcess(hThread)
    
    return true
}

getServerStatus(INADDR, PORT) {
    DllCall("LoadLibrary", "str", "ws2_32", "ptr")
    VarSetCapacity(wsadata, 408)
    DllCall("ws2_32\WSAStartup", "ushort", 0x0000, "ptr", &wsadata)
    DllCall("ws2_32\WSAStartup", "ushort", NumGet(wsadata, 2, "ushort"), "ptr", &wsadata)
    remoteHost := DllCall("Ws2_32\gethostbyname", "Str", (A_IsUnicode ? __unicodeToAnsi(INADDR) : INADDR), "ptr")
    if(remoteHost)
    {
        if(NumGet(remoteHost + (A_PtrSize==4 ? 8 : 16), "short")==2)
        {
            addrl := NumGet(remoteHost + (A_PtrSize==4 ? 12 : 24), "ptr")
            ha :=  NumGet(addrl+0, "ptr")
            a :=  NumGet(ha+0, "uchar")
            loop, 3
                a .= "." NumGet(ha+A_index, "uchar")
            INADDR := a
        }
        else
            return -1
    }
    else
        return -1
    socket := DllCall("ws2_32\socket", "int", 2, "int", 2, "int", 17, "ptr")
    if(socket==-1)
    {
        return -1
    }
    VarSetCapacity(si, 16, 0)
    NumPut(2, si, 0, "Short")
    NumPut(DllCall("Ws2_32\htons", "UShort", PORT), si, 2, "UShort")
    NumPut(DllCall("Ws2_32\inet_addr", "Str", (A_IsUnicode ? __unicodeToAnsi(INADDR) : INADDR)), si, 4, "ptr")
    VarSetCapacity(message,30)
    StrPut("SAMP", &message, "cp0")
    StrPut("i", &message +10, "cp0")
    if(DllCall("ws2_32\sendto", "ptr", socket, "ptr", &message, "int", 11, "int", 0, "ptr", &si, "int", 16, "int")==-1)
    {
        DllCall("Ws2_32\closesocket", "ptr", socket)
        return -1
    }
    VarSetCapacity(buffer, 2048, 0)
    VarSetCapacity(optval, 8, 0)
    NumPut(1, optval, 0, "long") ;timeout 1sec
    DllCall("ws2_32\setsockopt", "ptr", socket, "int", 0xFFFF, "int", 0x1006, "ptr", &optval, "int", 4)
    VarSetCapacity(silen,4)
    NumPut(16, silen, 0, "int")
    if(DllCall("ws2_32\recvfrom", "ptr", socket, "ptr", &buffer, "int", 2048, "int", 0, "ptr", &si, "ptr", &silen, "int")==-1)
    {
        DllCall("Ws2_32\closesocket", "ptr", socket)
        return -1
    }
    DllCall("Ws2_32\closesocket", "ptr", socket)
    return (NumGet(&buffer + 11, "Uchar") ? 2 : 1)
}

getAttacker(bReset := false) {
    if(!checkHandles())
        return 0
    dwLocalPED := readDWORD(hGTA, ADDR_CPED_PTR)
    dwAttacker := readDWORD(hGTA, dwLocalPED + 0x764)
    if (!dwAttacker)
        return -1
    for i, o in oScoreboardData {
        if (!o.PED || o.ISNPC || dwAttacker != o.PED)
            continue
        if (bReset)
            writeMemory(hGTA, dwLocalPED + 0x764, 0, 4, "UInt")
        return o.ID
    }
    return -1
}

UnlockFPS(){
    if(!checkHandles())
        return 0
    writeMemory(hGTA, dwSAMP + ADDR_SAMP_FPSUNLOCK, 0x5051FF15, 4, "UChar")
}

FormatNumber(number){
	StringReplace, number, number, -
	IfEQual ErrorLevel, 0, SetEnv Sign, -
	{
		Loop Parse, number, .
		{
			if(A_Index = 1){
				len := StrLen(A_LoopField)
				Loop Parse, A_LoopField
				{
					if(Mod(len-A_Index, 3) = 0 and A_Index != len){
						x .= A_LoopField "."
					}else{
						x .= A_LoopField
					}
				}
			}else{
				return sign x "." A_LoopField
			}
			return sign x
		}
	}
}

DownloadToString(url, encoding = "utf-8")
{
	static a := "AutoHotkey/" A_AhkVersion
	if (!DllCall("LoadLibrary", "str", "wininet") || !(h := DllCall("wininet\InternetOpen", "str", a, "uint", 1, "ptr", 0, "ptr", 0, "uint", 0, "ptr")))
	return 0
	c := s := 0, o := ""
	if (f := DllCall("wininet\InternetOpenUrl", "ptr", h, "str", url, "ptr", 0, "uint", 0, "uint", 0x80003000, "ptr", 0, "ptr"))
	{
	while (DllCall("wininet\InternetQueryDataAvailable", "ptr", f, "uint*", s, "uint", 0, "ptr", 0) && s > 0)
	{
	VarSetCapacity(b, s, 0)
	DllCall("wininet\InternetReadFile", "ptr", f, "ptr", &b, "uint", s, "uint*", r)
	o .= StrGet(&b, r >> (encoding = "utf-16" || encoding = "cp1200"), encoding)
	}
	DllCall("wininet\InternetCloseHandle", "ptr", f)
	}
	DllCall("wininet\InternetCloseHandle", "ptr", h)
	return o
}

stringMath(string) {
	while(position := RegExMatch(string, "\(([^\(\)]+)\)", regex_)) {
		string := RegExReplace(string, "\(([^\(\)]+)\)", stringMath(regex_1), blahblah, 1, position)
	}
	
	while(position := RegExMatch(string, "(\+|-)? *((?:\+|-)?\d+)\^((?:\+|-)?\d+)", regex_)) {
		string := RegExReplace(string, "(\+|-)? *((?:\+|-)?\d+)\^((?:\+|-)?\d+)", regex_1 . regex_2**regex_3, blahblah, 1, position)
	}
	while(position := RegExMatch(string, "(\+|-)? *((?:\+|-)?\d+(?:[\.\,]\d+)?) *(\*|/) *((?:\+|-)?\d+(?:[\.\,]\d+)?) *", regex_)) {
		if(regex_3 == "*")
			string := RegExReplace(string, "(\+|-)? *((?:\+|-)?\d+(?:[\.\,]\d+)?) *\* *((?:\+|-)?\d+(?:[\.\,]\d+)?) *", regex_1 . regex_2*regex_4, blahblah, 1, position)
		if(regex_3 == "/")
			string := RegExReplace(string, "(\+|-)? *((?:\+|-)?\d+(?:[\.\,]\d+)?) */ *((?:\+||)?\d+(?:[\.\,]\d+)?) *", regex_1 . regex_2/regex_4, blahblah, 1, position)
	}
	while(position := RegExMatch(string, " *((?:\+|-)?\d+(?:[\.\,]\d+)?) *(\+|-) *((?:\+|-)?\d+(?:[\.\,]\d+)?) *", regex_)) {
		if(regex_2 == "+")
			string := RegExReplace(string, " *((?:\+|-)?\d+(?:[\.\,]\d+)?) *\+ *((?:\+|-)?\d+(?:[\.\,]\d+)?) *", regex_1+regex_3, blahblah, 1, position)
		if(regex_2 == "-")
			string := RegExReplace(string, " *((?:\+|-)?\d+(?:[\.\,]\d+)?) *- *((?:\+|-)?\d+(?:[\.\,]\d+)?) *", regex_1-regex_3, blahblah, 1, position)
	}
	
	if(RegExMatch(string, "^-?\d+(?:\.\d+)?$"))
		return string
	
	return "ERROR"
}

RegStr(String, Needle, Needle2="", Needle3="") {
	StringLower, String, String
	StringLower, Needle, Needle
	StringLower, Needle2, Needle2
	StringLower, Needle3, Needle3

	Pos := RegExMatch(String, "U)^\[\d{2}:\d{2}:\d{2}\].*:.*\Q" . Needle . "\E", output)

	if(output)
		return 0

	if(!Needle2 AND !Needle3) {
		if(InStr(String, Needle))
		return 1
	}

	if(Needle2 AND !Needle3) {
		if(InStr(String, Needle) AND InStr(String, Needle2))
		return 1
	}

	if(Needle2 AND Needle3) {
		if(InStr(String, Needle) AND InStr(String, Needle2) AND InStr(String, Needle3))
			return 1
	}

	return 0
}

SetPercentageHealthAndArmor(toggle){
    If(!checkHandles())
        return false

    writeMemory(hGTA, 0x589355, toggle, 1, "UChar")
    writeMemory(hGTA, 0x589131, toggle, 1, "UChar")
}

SetChatLine(line, string) {
    if(!checkHandles())
        return false
    dwPTR := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
    writeString(hGTA, dwPTR + 0x136 + 0xfc*(99-line) + 0x1c, string)
    renderChat()
    return
}

RemoveChatLine(line := 0)
{
	if(!checkHandles())
		return false

	if(!dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR))
		return false

	loop % 100 - line
	{
		a := ""
		dwLine := dwAddress + 0x132 + ( (99 - A_Index - line) * 0xFC )

		loop 0xFC
		{
			byte := substr(inttohex(Memory_ReadByte(hGTA, dwLine++)), 3)
			a .= (strlen(byte) == 1 ? "0" : "") byte
		}

		dwLine := dwAddress + 0x132 + ( (100 - A_Index - line) * 0xFC )
		writeBytes(hGTA, dwLine, a)
	}
	return true
}

UrlDownloadToVar(URL, ByRef Result, UserAgent = "", Proxy = "", ProxyBypass = "") {
    hModule := DllCall("LoadLibrary", "Str", "wininet.dll")
    AccessType := Proxy != "" ? 3 : 1
    io := DllCall("wininet\InternetOpenA"
    , "Str", UserAgent
    , "UInt", AccessType
    , "Str", Proxy
    , "Str", ProxyBypass
    , "UInt", 0)
    iou := DllCall("wininet\InternetOpenUrlA"
    , "UInt", io
    , "Str", url
    , "Str", ""
    , "UInt", 0
    , "UInt", 0x80000000
    , "UInt", 0)
    If (ErrorLevel != 0 or iou = 0) {
        DllCall("FreeLibrary", "UInt", hModule)
        return 0
    }
    VarSetCapacity(buffer, 10240, 0)
    VarSetCapacity(BytesRead, 4, 0)
    Loop{
        irf := DllCall("wininet\InternetReadFile", "UInt", iou, "UInt", &buffer, "UInt", 10240, "UInt", &BytesRead)
        VarSetCapacity(buffer, -1)
        BytesRead_ = 0
        Loop, 4
            BytesRead_ += *(&BytesRead + A_Index-1) << 8*(A_Index-1)
        If (irf = 1 and BytesRead_ = 0)
            break
        Else
            Result .= SubStr(buffer, 1, BytesRead_)
    }
    DllCall("wininet\InternetCloseHandle", "UInt", iou)
    DllCall("wininet\InternetCloseHandle", "UInt", io)
    DllCall("FreeLibrary", "UInt", hModule)
}

sendDialogResponse(dialogID, buttonID, listIndex := 0xFFFF, inputResponse := "") {
	if ((inputLen := StrLen(inputResponse)) > 128 || !checkHandles())
		return false

	VarSetCapacity(buf, (bufLen := 0x17 + inputLen), 0)
	NumPut(48 + inputLen * 8, buf, 0, "UInt")
	NumPut(2048, buf, 4, "UInt")
	NumPut(pMemory + 1024 + 0x11, buf, 0xC, "UInt")
	NumPut(1, buf, 0x10, "UChar")
	NumPut(dialogID, buf, 0x11, "UShort")
	NumPut(buttonID, buf, 0x13, "UChar")
	NumPut(listIndex, buf, 0x14, "UShort")
	NumPut(inputLen, buf, 0x16, "UChar")

	if (inputLen > 0)
		StrPut(inputResponse, &buf + 0x17, inputLen, "")

	if (!__WRITERAW(hGTA, pMemory + 1024, &buf, bufLen))
		return false

	return __CALL(hGTA, dwSAMP + 0x30B30, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_RAKCLIENT])], ["i", dwSAMP + 0xD7FA8], ["i", pMemory + 1024], ["i", 1], ["i", 9], ["i", 0], ["i", 0]], false, true)
}

closeDialog() {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0x6B210, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])]], false, true)
}

isDialogOpen() {
	return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x28])
}

getDialogTextPos() {
	return !checkHandles() ? false : [__DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x4]), __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x8])]
}

getDialogStyle() {
	return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x2C])
}

getDialogID() {
	return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x30])
}

setDialogID(id) {
	return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x30], id, "UInt")
}

getDialogIndex() {
	return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [0x12E350, 0x143]) + 1
}

getDialogCaption() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x40], 64)
}

getDialogText() {
	return !checkHandles() ? "" : ((dialogText := __READSTRING(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR, 0x34])), [0x0], 4096)) == "" ? __READSTRING(hGTA, dwAddress, [0x0], getDialogTextSize(dwAddress)) : dialogText)
}

getDialogTextSize(dwAddress) {
	Loop, 4096 {
		if (!__READBYTE(hGTA, dwAddress + (i := A_Index - 1)))
			break
	}
	
	return i
}

getDialogLine(index) {
	return index > (lines := getDialogLineCount()).Length() ? "" : lines[getDialogStyle() == DIALOG_STYLE_TABLIST_HEADERS ? ++index : index]
}

getDialogLineCount() {
	return (text := getDialogText()) == "" ? -1 : StrSplit(text, "`n")
}

getDialogSelectedUI() {
	if (!checkHandles() || !(uiAddress := __DWORD(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [0x21A190])), [0xF])))
		return 0
	
	dwAddress := __DWORD(hGTA, dwAddress, [0x15E])
	
	Loop, 3 {
		if (__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4]) == uiAddress)
			return A_Index
	}
	
	return 0
}

showDialog(style, caption, text, button1, button2 := "", id := 1) {
	if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4095 || StrLen(button1) > 10 || StrLen(button2) > 10 || !checkHandles())
		return false
	
	return __CALL(hGTA, dwSAMP + 0x6B9C0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])], ["i", id], ["i", style], ["s", caption], ["s", text], ["s", button1], ["s", button2], ["i", 0]], false, true)
}

pressDialogButton(button) {
	return !checkHandles() || button < 0 || button > 1 ? false : __CALL(hGTA, dwSAMP + 0x6C040, [["i", __DWORD(hGTA, dwSAMP, [SAMP_DIALOG_INFO_PTR])], ["i", button]], false, true)
}

blockDialog() {
    if (!checkHandles()) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    VarSetCapacity(injectBytecode, 7, 0)
    Loop, 7 {
        NumPut(0x90, injectBytecode, A_Index - 1, "UChar")
    }
    return writeRaw(hGTA, dwSAMP + 0x6C014, &injectBytecode, 7)
}

unblockDialog() {
    if (!checkHandles()) {
        ErrorLevel := ERROR_INVALID_HANDLE
        return false
    }
    bytecodes := [0xC7, 0x46, 0x28, 0x1, 0x0, 0x0, 0x0]
    VarSetCapacity(injectBytecode, 7, 0)
    for i, o in bytecodes
        NumPut(o, injectBytecode, i - 1, "UChar")
    return writeRaw(hGTA, dwSAMP + 0x6C014, &injectBytecode, 7)
}

setVehicleLightStatus(frontLeft, frontRight, rearBoth) {
	return !checkHandles() || !isPlayerDriver() || getVehicleType() != 1 ? false : __WRITEMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x5B0], (~frontLeft & 1) + ((~frontRight & 1) << 2) + ((~rearBoth & 1) << 6), "UChar")
}

isChatOpen() {
	return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x8, 0x4], "UChar")
}

isInMenu() {
	return checkHandles() && __READMEM(hGTA, 0xB6B964, [0x0], "UChar")
}

isScoreboardOpen() {
	return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR, 0x0], "UChar")
}

sendChat(text) {
	return checkHandles() && __CALL(hGTA, dwSAMP + (SubStr(text, 1, 1) == "/" ? FUNC_SAMP_SEND_CMD : FUNC_SAMP_SEND_SAY), [["s", text]], false)
}

addChatMessage(text, color := 0xFFFFFFFF, timestamp := true) {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0x64010, [["i", __DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR])], ["i", timestamp ? 4 : 2], ["s", text], ["i", 0], ["i", color], ["i", 0]], false, true)
}

ChatMessage(message) {
	AddChatMessage("{e84621}[Muchbinder]{FFFFFF} " message)
}

addChatMessages(text, color := 0xFFFFFFFF, timestamp := true, count := 1) {
	if (StrLen(text) > 128 || !checkHandles())
		return false

	dwFunc := dwSAMP + 0x64010
	dwLen := 46
	VarSetCapacity(injectData, dwLen, 0)
	NumPut(0xB9, injectData, 0, "UChar")
	NumPut(count, injectData, 1, "UInt")
	NumPut(0x51, injectData, 5, "UChar")
	NumPut(0x68, injectData, 6, "UChar")
	NumPut(0, injectData, 7, "UInt")
	NumPut(0x68, injectData, 11, "UChar")
	NumPut(color, injectData, 12, "UInt")
	NumPut(0x68, injectData, 16, "UChar")
	NumPut(0, injectData, 17, "UInt")
	__WRITESTRING(hGTA, pMemory, [0x0], text)
	NumPut(0x68, injectData, 21, "UChar")
	NumPut(pMemory, injectData, 22, "UInt")
	NumPut(0x68, injectData, 26, "UChar")
	NumPut(timestamp ? 4 : 2, injectData, 27, "UInt")
	NumPut(0xB9, injectData, 31, "UChar")
	NumPut(__DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR]), injectData, 32, "UInt")
	NumPut(0xE8, injectData, 36, "UChar")
	offset := dwFunc - (pInjectFunc + 41)
	NumPut(offset, injectData, 37, "Int")
	NumPut(0x59, injectData, 41, "UChar")
	NumPut(0x49, injectData, 42, "UChar")
	NumPut(0x75, injectData, 43, "UChar")
	NumPut(0xD8, injectData, 44, "UChar")
	NumPut(0xC3, injectData, 45, "UChar")
	__WRITERAW(hGTA, pInjectFunc, &injectData, dwLen)
	
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)

	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	closeProcess(hThread)
	return true
}

getPageSize() {
	return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x0], "UChar")
}

setPageSize(pageSize) {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0x636D0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR])], ["i", pageSize]], false, true)
}

getMoney() {
	return !checkHandles() ? "" : __READMEM(hGTA, 0xB7CE50, [0x0], "Int")
}

getPlayerAnim() {
	return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x4], "Short")
}

getPing() {
	if (!checkHandles() || !__CALL(hGTA, dwSAMP + 0x8A10, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR])]], false, true))
		return 0

	return  __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x26])
}

getScore() {
	return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x2A])
}

getVehicleIDByNumberPlate(numberPlate) {
	if (!checkHandles() || (len := StrLen(numberPlate)) <= 0 || len > 32 || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
		return false
	
	count := __DWORD(hGTA, dwAddress, [0x0])
	
	Loop % SAMP_MAX_VEHICLES {
		if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
			continue
		
		if (numberPlate == __READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], len))
			return A_Index - 1

		if (--count <= 0)
			break
	}

	return false
}

getVehicleNumberPlates() {
	if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
		return ""

	vehicles := []
	count := __DWORD(hGTA, dwAddress, [0x0])
	
	Loop % SAMP_MAX_VEHICLES {
		if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
			continue
		
		vehicles[A_Index - 1] := __READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], 32)
		
		if (--count <= 0)
			break
	}

	return vehicles
}

getVehicleIDsByNumberPlate(numberPlate) {
	if (!checkHandles() || (len := StrLen(numberPlate)) <= 0 || len > 32 || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])))
		return ""
	
	vehicles := []
	count := __DWORD(hGTA, dwAddress, [0x0])

	Loop % SAMP_MAX_VEHICLES {
		if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x3074]))
			continue
		
		if (InStr(__READSTRING(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x1134, 0x93], 32), numberPlate))
			vehicles.Push(A_Index - 1)

		if (--count <= 0)
			break
	}

	return vehicles
}

getVehiclePosition(vehicleID) {
	return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, vehicleID * 4 + 0x1134, 0x40, 0x14])), [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}

getVehicleNumberPlate(vehicleID) {
	return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, vehicleID * 4 + 0x1134, 0x93], 32)
}

getVehicleID() {
	if (!checkHandles() || !isPlayerInAnyVehicle())
		return false
	
	return __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, isPlayerDriver() ? 0xAA : 0x5C], "UShort")
}

getPlayerScore(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x24])
}

isPlayerUsingCell(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0])
}

isPlayerUrinating(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x2B6])
}

isPlayerDancing(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x28A])
}

getPlayerDanceStyle(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x28E])
}

getPlayerDanceMove(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x292])
}

getPlayerDrunkLevel(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x281])
}

getPlayerSpecialAction(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xBB], "UChar")
}

getPlayerVehicleID(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xAD], "UShort")
}

getPlayerVehiclePos(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])), [0x93], "Float"), __READMEM(hGTA, dwAddress, [0x97], "Float"), __READMEM(hGTA, dwAddress, [0x9B], "Float")]
}

getPlayerTeamID(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x8], "UChar")
}

getPlayerState(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x9], "UChar")
}

getPlayerSeatID(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0xA], "UChar")
}

getPlayerPing(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x28])
}

isNPC(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x4])
}

getAFKState(playerID) {
	return !checkHandles() || playerID < 0 || playerID >= SAMP_MAX_PLAYERS ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x1D1])
}

getPlayerWeaponID(playerID, slot) {
	return (slot < 0 || slot > 12 || playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles()) ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4, 0x5A0 + slot * 0x1C])
}

getPlayerAmmo(playerID, slot) {
	return (slot < 0 || slot > 12 || playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles()) ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4, 0x5AC + slot * 0x1C])
}

getPlayerColor(playerID) {
	return !checkHandles() ? -1 : (((color := __DWORD(hGTA, dwSAMP, [0x216378 + playerID * 4])) >> 8) & 0xFF) + ((color >> 16) & 0xFF) * 0x100 + ((color >> 24) & 0xFF) * 0x10000
}

getPlayerColor1(playerID) {
	return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [0x103078 + playerID * 4])
}

getChatBubbleText(playerID) {
	return playerID < 0 || playerID > SAMP_MAX_PLAYERS - 1 || !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x21A0DC, playerID * 0x118 + 0x4], 256)
}

isChatBubbleShown(playerID) {
	return playerID < 0 || playerID > SAMP_MAX_PLAYERS - 1 || !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [0x21A0DC, playerID * 0x118], "Int")
}

getPlayerID(playerName, exact := 0) {
	if (!updatePlayers())
		return ""
	for i, o in oPlayers {
		if (exact) {
			if (o = playerName)
				return i
		}
		else {
			if (InStr(o, playerName) == 1)
				return i
		}
	}
	return ""
}

getPlayerName(playerID) {
	if (playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() || getPlayerScore(playerID) == "")
		return ""

	if (__DWORD(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4])), [0x1C]) > 15)
		return __READSTRING(hGTA, dwAddress, [0xC, 0x0], 25)
		return __READSTRING(hGTA, dwAddress, [0xC], 16)
}

getUsername() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x219A6F], 25)
}

getHP() {
	return !checkHandles() ? "" : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x540], "Float")
}

getArmor() {
	return !checkHandles() ? "" : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float")
}

getID() {
	return !checkHandles() ? -1 : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x4], "UShort")
}

getChatlogPath() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x11], 256)
}

showGameText(text, time, style) {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0x9C2C0, [["s", text], ["i", time], ["i", style]], false)
}

getGameText_() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [0x13BEFC], 128)
}

getGameTextByStyle(style) {
	return !checkHandles() ? "" : __READSTRING(hGTA, 0xBAACC0, [style * 0x80], 128)
}

toggleChatShown(shown := true) {
	return !checkHandles() ? -1 : __WRITEMEM(hGTA, dwSAMP, [0x64230], shown ? 0x56 : 0xC3, "UChar")
}

isChatShown() {
	return checkHandles() && __READMEM(hGTA, dwSAMP, [0x64230], "UChar") == 0x56
}

isCheckpointSet() {
	return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x24], "UChar")
}

toggleCheckpoint(toggle := true) {
	return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x24], toggle ? 1 : 0 ,"UChar")
}

getCheckpointSize() {
	return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x18], "Float")
}

getCheckpointPos() {
	if (!checkhandles())
		return ""

	dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])

	for i, o in [0xC, 0x10, 0x14]
		pos%i% := __READMEM(hGTA, dwAddress, [o], "Float")
	
	return [pos1, pos2, pos3]
}

getDistanceToCheckpoint(){
    checkpointpos := getCheckpointPos()
    playerpos := getCoordinates()
    return getDistance(checkpointpos, playerpos)
}

setCheckpointPos(cpPos) {
	if (!checkhandles())
		return ""

	dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])
	
	for i, o in [0xC, 0x10, 0x14]
		pos%i% := __WRITEMEM(hGTA, dwAddress, [o], cpPos[A_Index], "Float")

		return [pos1, pos2, pos3]
}

setCheckpoint(fX, fY, fZ, fSize := 3.0) {
	if (!checkHandles())
		return false

	VarSetCapacity(buf, 16, 0)
	NumPut(fX, buf, 0, "Float")
	NumPut(fY, buf, 4, "Float")
	NumPut(fZ, buf, 8, "Float")
	NumPut(fSize, buf, 12, "Float")
	
	if (!__WRITERAW(hGTA, pMemory + 20, &buf, 16))
		return false

	return __CALL(hGTA, dwSAMP + 0x9D340, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])], ["i", pMemory + 20], ["i", pMemory + 32]], false, true) && toggleCheckpoint()
}

isRaceCheckpointSet() {
	return checkHandles() && __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x49], "UChar")
}

toggleRaceCheckpoint(toggle := true) {
	return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x49], toggle ? 1 : 0 ,"UChar")
}

getRaceCheckpointType() {
	return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x48], "UChar")
}

getRaceCheckpointSize() {
	return !checkHandles() ? false : __READMEM(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x44], "Float")
}

getRaceCheckpointPos() {
	if (!checkhandles())
		return ""

	dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])

	Loop, 6
		pos%A_Index% := __READMEM(hGTA, dwAddress, [0x2C + (A_Index - 1) * 4], "Float")
	
	return [pos1, pos2, pos3, pos4, pos5, pos6]
}

setRaceCheckpoint(type, fX, fY, fZ, fXNext, fYNext, fZNext, fSize := 3.0) {
	if (!checkHandles())
		return false

	VarSetCapacity(buf, 28, 0)
	NumPut(fX, buf, 0, "Float")
	NumPut(fY, buf, 4, "Float")
	NumPut(fZ, buf, 8, "Float")
	NumPut(fXNext, buf, 12, "Float")
	NumPut(fYNext, buf, 16, "Float")
	NumPut(fZNext, buf, 20, "Float")
	
	if (!__WRITERAW(hGTA, pMemory + 24, &buf, 28))
		return false

	return __CALL(hGTA, dwSAMP + 0x9D660, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR])], ["i", type], ["i", pMemory + 24], ["i", pMemory + 36], ["f", fSize]], false, true) && toggleRaceCheckpoint()
}

getLastSentMsg() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x1565], 128)
}

setLastSentMsg(text) {
	return checkHandles() && __WRITESTRING(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR, 0x1565], text)
}

pushSentMsg(text) {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0x65930, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR])], ["s", text]], false, true)
}

patchWanteds() {
	return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x9C9C0, [0xC2, 0x04, 0x0, 0x0])
}

unpatchWanteds() {
	return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x9C9C0, [0x8A, 0x44, 0x24,04])
}

checkSendCMDNOP() {
	return checkHandles() && NOP(hGTA, dwSAMP + 0x65DF8, 5) && NOP(hGTA, dwSAMP + 0x65E45, 5)
}

patchSendSay(toggle := true) {
	return !checkHandles() ? false : (toggle ? __WRITEBYTES(hGTA, dwSAMP + 0x64915, [0xC3, 0x90]) : __WRITEBYTES(hGTA, dwSAMP + 0x64915, [0x85, 0xC0]))
}

unpatchSendCMD() {
	return !checkHandles() ? false : __WRITEBYTES(hGTA, dwSAMP + 0x65DF8, [0xE8, 0x63, 0xFE, 0xFF, 0xFF]) && __WRITEBYTES(hGTA, dwSAMP + 0x65E45, [0xE8, 0x16, 0xFE, 0xFF, 0xFF])
}

getChatRenderMode() {
	return !checkHandles() ? -1 : __READMEM(hGTA, [SAMP_CHAT_INFO_PTR, 0x8], "UChar")
}

toggleScoreboard(toggle) {
	return checkHandles() && (toggle ? __CALL(hGTA, dwSAMP + 0x6AD30, [["i", __DWORD(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR])]], false, true) : __CALL(hGTA, dwSAMP + 0x6A320, [["i", __DWORD(hGTA, dwSAMP, [SAMP_SCOREBOARD_INFO_PTR])], ["i", 1]], false, true))
}

toggleChatInput(toggle) {
	return checkHandles() && __CALL(hGTA, dwSAMP + (toggle ? 0x657E0 : 0x658E0), [["i", __DWORD(hGTA, dwSAMP, [SAMP_INPUT_INFO_PTR])]], false, true)
}

setGameState(state) {
	return !checkHandles() ? false : __WRITEMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3BD], state)
}

getGameState() {
	return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3BD])
}

isLineOfSightClear(fX1, fY1, fZ1, fX2, fY2, fZ2) {
	if (!checkHandles())
		return false

	__WRITEMEM(hGTA, pMemory, [0x0], fX1, "Float")
	__WRITEMEM(hGTA, pMemory + 4, [0x0], fY1, "Float")
	__WRITEMEM(hGTA, pMemory + 8, [0x0], fZ1, "Float")
	__WRITEMEM(hGTA, pMemory + 12, [0x0], fX2, "Float")
	__WRITEMEM(hGTA, pMemory + 16, [0x0], fY2, "Float")
	__WRITEMEM(hGTA, pMemory + 20, [0x0], fZ2, "Float")
	return __CALL(hGTA, 0x56A490, [["i", pMemory], ["i", pMemory + 12], ["i", 1], ["i", 0], ["i", 0], ["i", 1], ["i", 0], ["i", 0], ["i", 0]], true, false, true)
}

takeScreenshot() {
	return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [0x119CBC], 1, "UChar")
}

getPlayerFightingStyle() {
	return !checkHandles() ? false : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x72D], "UChar")
}

getMaxPlayerID() {
	return !checkHandles() ? false : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, 0x0])
}

getWeatherID() {
	return !checkHandles() ? "" : __READMEM(hGTA, 0xC81320, [0x0], "UShort")
}

getAmmo(slot) {
	return (slot < 0 || slot > 12 || !checkHandles()) ? "" : __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x5AC + slot * 0x1C])
}

getWeaponID(slot) {
	return (slot < 0 || slot > 12 || !checkHandles()) ? "" : __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x5A0 + slot * 0x1C])
}

getActiveWeaponSlot() {
	return !checkHandles() ? -1 : __READMEM(hGTA, 0xB7CDBC, [0x0], "UChar")
}

cameraRestoreWithJumpcut() {
	return checkHandles() && __CALL(hGTA, 0x50BAB0, [["i", 0xB6F028]], false, true)
}

calcAngle(xActor, yActor, xPoint, yPoint) {
	fX := xActor - xPoint
	fY := yActor - yPoint
	return atan2(fX, fY)
}

atan2(x, y) {
	return DllCall("msvcrt\atan2", "Double", y, "Double", x, "CDECL Double")
}

getPlayerZAngle() {
	return !checkHandles() ? "" : __READMEM(hGTA, 0xB6F5F0, [0x0, 0x558], "Float")
}

setCameraPosX(fAngle) {
	return checkHandles() && __WRITEMEM(hGTA, 0xB6F258, [0x0], "Float")
}

isPlayerFrozen() {
	return checkHandles() && __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x42], "UChar")
}

isPlayerInRangeOfPoint(fX, fY, fZ, r) {
	return checkHandles() && getDistance(getPlayerPos(), [fX, fY, fZ]) <= r
}

getMapQuadrant(pos) {
	return pos[1] <= 0 ? (pos[2] <= 0 ? 3 : 1) : (pos[2] <= 0 ? 4 : 2)
}

getWeaponIDByName(weaponName) {
	for i, o in oWeaponNames {
		if (o = weaponName)
			return i - 1
	}
		
	return -1
}

getWeaponName(weaponID) {
	return weaponID < 0 || weaponID > oWeaponNames.MaxIndex() ? "" : oWeaponNames[weaponID + 1]
}

getPlayerPed(playerID) {
	return playerID < 0 || playerID >= SAMP_MAX_PLAYERS || !checkHandles() ? 0x0 : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4])
}

getIFPAnimationName1(playerID) {
	if (!(ped := getPlayerPed(playerID)))
		return ""

	if (!(dwAddress := isTaskActive(ped, 401)))
		dwAddress := __DWORD(hGTA, ped, [0x47C])

	return __READSTRING(hGTA, dwAddress, [0x28], 10) . " , " . __READSTRING(hGTA, dwAddress, [0x10], 20)
}

getIFPAnimationName(playerID) {
	if (!(ped := getPlayerPed(playerID)))
		return ""

	if (!(dwAddress := isTaskActive(ped, 401)))
		dwAddress := __DWORD(hGTA, ped, [0x47C])

	return __READSTRING(hGTA, dwAddress, [0x10], 20)
}

isTaskActive(ped, taskID) {
	return !checkHandles() ? false : __CALL(hGTA, 0x681740, [["i", __DWORD(hGTA, ped, [0x47C]) + 0x4], ["i", taskID]], false, true, true, "UInt")
}

getVehicleColor1() {
	return !checkHandles() ? false : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x434], "UChar")
}

getVehicleColor2() {
	return !checkHandles() ? false : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x435], "UChar")
}

getVehicleSpeed() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : sqrt(((fSpeedX := __READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])), [0x44], "Float")) * fSpeedX) + ((fSpeedY := __READMEM(hGTA, dwAddress, [0x48], "Float")) * fSpeedY) + ((fSpeedZ := __READMEM(hGTA, dwAddress, [0x4C], "Float")) * fSpeedZ)) * 100 * SERVER_SPEED_KOEFF
}

getVehicleMaxSpeed(modelID) {
	if (!checkHandles())
		return false

	return __READMEM(hGTA, 0xC2BA60, [(modelID - 400) * 0xE0], "Float")
}

getVehicleBootAngle() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x5DC], "Float")
}

getVehicleBonnetAngle() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x5C4], "Float")
}

getVehicleType() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? false : __CALL(hGTA, 0x6D1080, [["i", __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])]], false, true, true, "Char")
}

getInteriorID() {
	return !checkHandles() ? false : __DWORD(hGTA, 0xA4ACE8, [0x0])
}

isPlayerInAnyVehicle() {
	return checkHandles() && __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0]) > 0
}

isPlayerDriver() {
	return checkHandles() && __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x460]) == __DWORD(hGTA, GTA_CPED_PTR, [0x0])
}

getPlayerHealth() {
	return !checkHandles() ? -1 : Round(__READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x540], "Float"))
}

getPlayerArmor() {
	return !checkHandles() ? -1 : Round(__READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x548], "Float"))
}

getRemotePlayerHealth(playerID) {
	return playerID < 0 || playerID > 1004 || !checkHandles() ? -1 : Round(__READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 0x4, 0x0, 0x1BC], "Float"))
}

getVehicleHealth() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : Round(__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x4C0], "Float"))
}

getVehicleRotation() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x0], "Float"), __READMEM(hGTA, dwAddress, [0x4], "Float"), __READMEM(hGTA, dwAddress, [0x8], "Float")]
}

getVehiclePos() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x14])), [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}

getPlayerVehicleModelID() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x22], "UShort")
}

getVehicleModelName(modelID) {
	return modelID < 400 || modelID > 611 ? "" : oVehicleNames[modelID - 399]
}

getPlayerVehicleEngineState() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 16 ? true : false)
}

getPlayerVehicleLightState() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__READMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x428], "UChar") & 64 ? true : false)
}

getPlayerVehicleLockState() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : (__DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x4F8]) == 2)
}

getPlayerVehicleSirenState() {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0, 0x1F7])
}

setVehicleSirenState(toggle := true) {
	return !checkHandles() || !isPlayerInAnyVehicle() ? "" : __WRITEMEM(hGTA, GTA_VEHICLE_PTR, [0x0, 0x42D], toggle ? 208 : 80, "UChar")
}

toggleVision(type, toggle := true) {
	return (type != 0 && type != 1) || !checkHandles() ? false : __WRITEMEM(hGTA, 0xC402B8, [type], toggle, "UChar")
}

toggleCursor(toggle) {
	return checkHandles() && __WRITEMEM(hGTA, __DWORD(hGTA, dwSAMP + 0x21A0CC, [0x0]), [0x0], toggle ? true : false, "UChar") && __CALL(hGTA, dwSAMP + 0x9BD30, [["i", (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR]))], ["i", 0], ["i", 0]], false, true) && (toggle ? __CALL(hGTA, dwSAMP + 0x9BC10, [["i", dwAddress]], false, true) : true)
}

toggleInput(toggle) {
	return checkHandles() && __WRITEMEM(hGTA, GTA_CPED_PTR, [0x0, 0x598], toggle, "Byte")
}

getDrunkLevel() {
	return !checkHandles() ? "" : __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8, 0x2C9])
}

setPlayerAttachedObject(slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0) {
	if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
		return false

	VarSetCapacity(struct, 52, 0)
	NumPut(modelID, &struct, 0, "UInt")
	NumPut(bone, &struct, 4, "UInt")
	NumPut(xPos, &struct, 8, "Float")
	NumPut(yPos, &struct, 12, "Float")
	NumPut(zPos, &struct, 16, "Float")
	NumPut(xRot, &struct, 20, "Float")
	NumPut(yRot, &struct, 24, "Float")
	NumPut(zRot, &struct, 28, "Float")
	NumPut(xScale, &struct, 32, "Float")
	NumPut(yScale, &struct, 36, "Float")
	NumPut(zScale, &struct, 40, "Float")
	NumPut(color1, &struct, 44, "UInt")
	NumPut(color2, &struct, 48, "UInt")
	return !__WRITERAW(hGTA, pMemory + 1024, &struct, 52) ? false : __CALL(hGTA, dwSAMP + 0xAB3E0, [["i", dwAddress], ["i", slot], ["i", pMemory + 1024]], false, true)
}

setRemotePlayerAttachedObject(playerID, slot, modelID, bone, xPos, yPos, zPos, xRot, yRot, zRot, xScale := 1, yScale := 1, zScale := 1, color1 := 0x0, color2 := 0x0) {
	if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])))
		return false
	
	if (!(dwAddress := __DWORD(hGTA, dwAddress, [0x0])))
		return false

	VarSetCapacity(struct, 52, 0)
	NumPut(modelID, &struct, 0, "UInt")
	NumPut(bone, &struct, 4, "UInt")
	NumPut(xPos, &struct, 8, "Float")
	NumPut(yPos, &struct, 12, "Float")
	NumPut(zPos, &struct, 16, "Float")
	NumPut(xRot, &struct, 20, "Float")
	NumPut(yRot, &struct, 24, "Float")
	NumPut(zRot, &struct, 28, "Float")
	NumPut(xScale, &struct, 32, "Float")
	NumPut(yScale, &struct, 36, "Float")
	NumPut(zScale, &struct, 40, "Float")
	NumPut(color1, &struct, 44, "UInt")
	NumPut(color2, &struct, 48, "UInt")
	return !__WRITERAW(hGTA, pMemory + 1024, &struct, 52) ? false : __CALL(hGTA, dwSAMP + 0xAB3E0, [["i", dwAddress], ["i", slot], ["i", pMemory + 1024]], false, true)
}

printRemotePlayerAttachedObjects(playerID) {
	if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0])))
		return false

	if (!(dwAddress := __DWORD(hGTA, dwAddress, [0x0])))
		return false

	Loop, 10 {
		if (!(objectID := __DWORD(hGTA, dwAddress, [0x74 + (A_Index - 1) * 0x34])))
			continue
		
		AddChatMessage("SLOT: " A_Index - 1 ", OBJECTID: " objectID)
	}

	return true
}

getPlayerAttachedObjects() {
	if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
		return ""

	oPlayerObjects := []

	Loop, 10 {
		if (!(objectID := __DWORD(hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
			continue

		oPlayerObjects.Push(Object("SLOT", A_Index - 1, "OBJECTID", objectID))
	}

	return oPlayerObjects
}

getPlayerAttachedObjectPos(slot) {
	if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
		return ""
	
	posMatrix := []

	Loop, 9
		posMatrix[A_Index] := __READMEM(hGTA, dwLocalPlayerPED, [0x7C + slot * 0x34 + (A_Index - 1) * 0x4], "Float")

	return posMatrix
}

printPlayerAttachedObjectPos(slot) {
	if ((posMatrix := getPlayerAttachedObjectPos(slot)) == "")
		return AddChatMessage("Slot not in use.")
	
	string := ""

	for i, o in posMatrix
		string .= o ", "

	StringTrimRight, string, string, 2
	return AddChatMessage("Slot " slot ": " string)
}

printPlayerAttachedObjects() {
	if (!checkHandles() || !(dwLocalPlayerPED := __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])))
		return ""

	oPlayerObjects := []
	
	Loop, 10 {
		if (!(objectID := __DWORD(hGTA, dwLocalPlayerPED, [0x74 + (A_Index - 1) * 0x34])))
			continue

		AddChatMessage("SLOT: " A_Index - 1 ", OBJECTID: " objectID)
	}

	return oPlayerObjects
}

clearPlayerAttachedObject(slot) {
	return checkHandles() && __CALL(hGTA, dwSAMP + 0xA96F0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])], ["i", slot]], false, true)
}

quitGame() {
	return checkHandles() && __CALL(hGTA, 0x619B60, [["i", 0x1E], ["i", 0]])
}

getServerName() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x121], 259)
}

getServerIP() {
	return !checkHandles() ? "" : __READSTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x20], 257)
}

getServerPort() {
	return !checkHandles() ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x225], "UInt")
}

isPlayerSwimming() {
	return !checkHandles() ? "" : __CALL(hGTA, 0x601070, [["i", __DWORD(hGTA, GTA_CPED_PTR, [0x0, 0x47C])]], false, true, true, "UInt") > 0
}

getTargetPlayerID() {
	return !checkHandles() ? 0xFFFF : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x161], "UShort")
}

isPlayerSpawned() {
	return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_LOCALPLAYER, 0x136])
}

updatePlayers() {
	if (!checkHandles())
		return false
	if (playerTick + 1000 > A_TickCount)
		return true
	oPlayers := []
	dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
	Loop, % getMaxPlayerID() + 1
	{
		if (!(dwRemoteplayer := __DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4])))
			continue
		oPlayers[A_Index - 1] := (__DWORD(hGTA, dwRemoteplayer, [0x1C]) > 15 ? __READSTRING(hGTA, dwRemoteplayer, [0xC, 0x0], 25) : __READSTRING(hGTA, dwRemoteplayer, [0xC], 16))
	}
	playerTick := A_TickCount
	return true
}

printPlayers() {
	if (!updatePlayers())
		return false

	playerCount := 1

	for i, o in oPlayers {
		playerCount++
		addChatMessage("ID: " i ", Name: " o)
	}

	addChatMessage("Player Count: " playerCount)
	return true
}

getPlayerCount() {
	if (!updatePlayers())
		return false

	playerCount := 1
	
	for i, o in oPlayers
		playerCount++

	return playerCount
}

updateGangzones() {
if (!checkHandles())
return false
if (gangZoneTick + 1000 > A_TickCount)
return true
oGangzones := []
if (!(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_GANGZONE])))
return false
Loop % SAMP_MAX_GANGZONES {
if (!__DWORD(hGTA, dwAddress, [(A_Index - 1) * 4 + 4 * SAMP_MAX_GANGZONES]))
continue
oGangzones.Push(Object("ID", A_Index - 1, "XMIN", __READMEM(hGTA, (dwGangzone := __DWORD(hGTA, dwAddress, [(A_Index - 1) * 4])), [0x0], "Float"), "YMIN", __READMEM(hGTA, dwGangzone, [0x4], "Float"), "XMAX", __READMEM(hGTA, dwGangzone, [0x8], "Float"), "YMAX", __READMEM(hGTA, dwGangzone, [0xC], "Float"), "COLOR1", __DWORD(hGTA, dwGangzone, [0x10]), "COLOR2", __DWORD(hGTA, dwGangzone, [0x14])))
}
gangZoneTick := A_TickCount
return true
}

printGangzones() {
if (!updateGangzones())
return false
for i, o in oGangzones
AddChatMessage("ID: " o.ID ", X: " o.XMIN " - " o.XMAX ", Y: " o.YMIN " - " o.YMAX ", Colors: " intToHex(o.COLOR1) " - " intToHex(o.COLOR2))
return true
}

updateTextDraws() {
	if (!checkHandles())
		return false

	if (textDrawTick + 1000 > A_TickCount)
		return true

	oTextDraws := []

	if (!(dwTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])))
		return false

	Loop, % SAMP_MAX_TEXTDRAWS {
		if (!__DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4]) || !(dwAddress := __DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS))])))
			continue
		
		oTextDraws.Push(Object("TYPE", "Global", "ID", A_Index - 1, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 800)))
	}

	Loop, % SAMP_MAX_PLAYERTEXTDRAWS {
		if (!__DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + SAMP_MAX_TEXTDRAWS * 4]) || !(dwAddress := __DWORD(hGTA, dwTextDraws, [(A_Index - 1) * 4 + (4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS * 2))])))
			continue

		oTextDraws.Push(Object("TYPE", "Player", "ID", A_Index - 1, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 800)))
	}

	textDrawTick := A_TickCount
	return true
}

deleteTextDraw(ByRef textDrawID) {
	if (textDrawID < 0 || textDrawID > SAMP_MAX_TEXTDRAWS - 1 || !checkHandles()) {
		textDrawID := -1
		return -1
	}

	if (__CALL(hGTA, dwSAMP + 0x1AD00, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])], ["i", textDrawID]], false, true)) {
		textDrawID := -1
		return -1
	}

	AddChatMessage("Could not be deleted: " textDrawID)
	return textDrawID
}

createTextDraw(text, xPos, yPos, letterColor := 0xFFFFFFFF, font := 3, letterWidth := 0.4, letterHeight := 1, shadowSize := 0, outline := 1
, shadowColor := 0xFF000000, box := 0, boxColor := 0xFFFFFFFF, boxSizeX := 0.0, boxSizeY := 0.0, left := 0, right := 0, center := 1
, proportional := 1, modelID := 0, xRot := 0.0, yRot := 0.0, zRot := 0.0, zoom := 1.0, color1 := 0xFFFF, color2 := 0xFFFF) {
	if (font > 5 || StrLen(text) > 800 || !checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])))
		return -1

	Loop, 2048 {
		i := 2048 - A_Index

		if (__DWORD(hGTA, dwAddress, [i * 4]))
			continue

		VarSetCapacity(struct, 63, 0)
		NumPut((box ? 1 : 0) + (left ? 2 : 0) + (right ? 4 : 0) + (center ? 8 : 0) + (proportional ? 16 : 0), &struct, 0, "UChar")
		NumPut(letterWidth, &struct, 1, "Float")
		NumPut(letterHeight, &struct, 5, "Float")
		NumPut(letterColor, &struct, 9, "UInt")
		NumPut(boxSizeX, &struct, 0xD, "Float")
		NumPut(boxSizeY, &struct, 0x11, "Float")
		NumPut(boxColor, &struct, 0x15, "UInt")
		NumPut(shadowSize, &struct, 0x19, "UChar")
		NumPut(outline, &struct, 0x1A, "UChar")
		NumPut(shadowColor, &struct, 0x1B, "UInt")
		NumPut(font, &struct, 0x1F, "UChar")
		NumPut(1, &struct, 0x20, "UChar")
		NumPut(xPos, &struct, 0x21, "Float")
		NumPut(yPos, &struct, 0x25, "Float")
		NumPut(modelID, &struct, 0x29, "Short")
		NumPut(xRot, &struct, 0x2B, "Float")
		NumPut(yRot, &struct, 0x2F, "Float")
		NumPut(zRot, &struct, 0x33, "Float")
		NumPut(zoom, &struct, 0x37, "Float")
		NumPut(color1, &struct, 0x3B, "Short")
		NumPut(color2, &struct, 0x3D, "Short")
		return !__WRITERAW(hGTA, pMemory + 1024, &struct, 63) ? -1 : __CALL(hGTA, dwSAMP + 0x1AE20, [["i", dwAddress], ["i", i], ["i", pMemory + 1024], ["s", text]], false, true) ? i : -1
	}
	
	return -1
}

getTextDrawPos(textDrawID) {
	return textDrawID < 0 || textDrawID > 2047 || !checkHandles() ? "" : [__READMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], "Float"), __READMEM(hGTA, dwAddress, [0x98F], "Float")]
}

moveTextDraw(textDrawID, xPos, yPos) {
	return textDrawID < 0 || textDrawID > 2047 || checkHandles() && __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x98B], xPos, "Float") && __WRITEMEM(hGTA, dwAddress, [0x98F], yPos, "Float")
}

resizeTextDraw(textDrawID, letterWidth, letterHeight) {
	return return textDrawID < 0 || textDrawID > 2047 || checkHandles()
	&& __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP
	, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x963], letterWidth
	, "Float") && __WRITEMEM(hGTA, dwAddress, [0x967], letterHeight, "Float")
}

setTextDrawAlignment(textDrawID, align) {
	if (textDrawID < 0 || textDrawID > 2047 || !checkHandles())
		return false
	
	__WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x970], align == "CENTER", "UChar")
	__WRITEMEM(hGTA, dwAddress, [0x985], align == "LEFT", "UChar")

	return __WRITEMEM(hGTA, dwAddress, [0x986], align == "RIGHT", "UChar")
}

setTextDrawFont(textDrawID, tdFont) {
	return textDrawID < 0 || textDrawID > 2047 || checkHandles() && __WRITEMEM(hGTA, (dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])), [0x987], tdFont, "UChar")
}

updateTextDraw(textDrawID, text) {
	if (textDrawID < 0 || textDrawID > 2047 || StrLen(text) > 800 || !checkHandles())
		return false

	dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW, textDrawID * 4 + 4 * (SAMP_MAX_PLAYERTEXTDRAWS + SAMP_MAX_TEXTDRAWS)])
	return __WRITESTRING(hGTA, dwAddress, [0x0], text)
}

destroyObject(ByRef objectID) {
if (objectID < 0 || objectID > SAMP_MAX_OBJECTS - 1 || !checkHandles()) {
objectID := -1
return false
}
if (__CALL(hGTA, dwSAMP + 0xF3F0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])], ["i", objectID]], false, true)) {
objectID := -1
return true
}
return false
}
attachObjectToPlayerVehicle(objectID) {
if (!checkHandles())
return false
vehPtr := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
if (vehPtr == "" || !vehPtr)
return false
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
if (!dwAddress)
return false
if (!__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
return false
if (__WRITEMEM(hGTA, dwAddress, [objectID * 0x4 + 0xFA4, 0x40, 0xFC], vehPtr, "UInt"))
return true
return false
}
createObject(modelID, xPos, yPos, zPos, xRot, yRot, zRot, drawDistance := 0) {
if (!(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || __DWORD(hGTA, dwAddress, [0x0]) == SAMP_MAX_OBJECTS)
return -1
Loop, % SAMP_MAX_OBJECTS - 1 {
i := SAMP_MAX_OBJECTS - A_Index
if (__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
continue
return __CALL(hGTA, dwSAMP + 0xF470, [["i", dwAddress], ["i", i], ["i", modelID], ["f", xPos], ["f", yPos], ["f", zPos], ["f", xRot]
, ["f", yRot], ["f", zRot], ["f", drawDistance]], false, true) ? i : -1
}
return -1
}
setObjectMaterialText(objectID, text, matIndex := 0, matSize := 90, font := "Arial", fontSize := 24, bold := 1, fontColor := 0xFFFFFFFF, backColor := 0xFF000000, align := 1) {
if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || !__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
return false
return __CALL(hGTA, dwSAMP + 0xA3050, [["i", __DWORD(hGTA, dwAddress, [objectID * 0x4 + 0xFA4])], ["i", matIndex], ["s", text], ["i", matSize], ["s", font]
, ["i", fontSize], ["i", bold], ["i", fontColor], ["i", backColor], ["i", align]], false, true)
}
editObject(objectID) {
return __CALL(hGTA, dwSAMP + 0x6DE40, [["i", __DWORD(hGTA, dwSAMP, [0x21A0C4])], ["i", objectID], ["i", 1]], false, true)
}
editAttachedObject(slot) {
return __CALL(hGTA, dwSAMP + 0x6DF00, [["i", __DWORD(hGTA, dwSAMP, [0x21A0C4])], ["i", slot]], false, true)
}
getObjectPos(objectID) {
if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])) || !__DWORD(hGTA, dwAddress, [objectID * 4 + 0x4]))
return false
dwAddress := __DWORD(hGTA, dwAddress, [objectID * 0x4 + 0xFA4])
xPos := __READMEM(hGTA, dwAddress, [0x10B], "Float")
yPos := __READMEM(hGTA, dwAddress, [0x10F], "Float")
zPos := __READMEM(hGTA, dwAddress, [0x113], "Float")
xRot := __READMEM(hGTA, dwAddress, [0xAD], "Float")
yRot := __READMEM(hGTA, dwAddress, [0xB1], "Float")
zRot := __READMEM(hGTA, dwAddress, [0xB5], "Float")
return [xPos, yPos, zPos, xRot, yRot, zRot]
}
printObjectPos(objectID) {
pos := getObjectPos(objectID)
if (pos == false)
return AddChatMessage("Object not found.")
AddChatMessage(pos[1] ", " pos[2] ", " pos[3] ", " pos[4] ", " pos[5] ", " pos[6])
return true
}
getClosestObjectByModel(modelID) {
if (!updateObjects())
return ""
dist := -1
obj := ""
pPos := getPlayerPos()
for i, o in oObjects {
if (o.MODELID != modelID)
continue
if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
obj := o
dist := newDist
}
}
return obj
}
getClosestObjectModel() {
if (!updateObjects())
return ""
dist := -1
model := ""
pPos := getPlayerPos()
for i, o in oObjects {
if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
dist := newDist
model := o.MODELID
}
}
return model
}
printObjects() {
if (!updateObjects())
return false
for i, o in oObjects
AddChatMessage("Index: " o.ID ", Model: " o.MODELID ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS)
AddChatMessage("Object Count: " i)
return true
}
printObjectsByModelID(modelID) {
if (!updateObjects())
return false
count := 0
for i, o in oObjects {
if (o.MODELID == modelID) {
count++
AddChatMessage("ID: " o.ID ", Model: " o.MODELID ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS)
}
}
AddChatMessage("Object Count: " count)
return true
}
isSirenAttached() {
if (!checkHandles())
return false
vehPtr := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
if (vehPtr == "" || !vehPtr)
return false
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
if (!dwAddress)
return false
count := __DWORD(hGTA, dwAddress, [0x0])
Loop, % SAMP_MAX_OBJECTS {
i := A_Index - 1
if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
continue
dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
if (__DWORD(hGTA, dwObject, [0x4E]) == 18646 && __DWORD(hGTA, dwObject, [0x40, 0xFC]) == vehPtr)
return true
count--
if (count <= 0)
break
}
return false
}
createPickup(modelID, type, xPos, yPos, zPos) {
if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])))
return -1
Loop, % SAMP_MAX_PICKUPS {
if (__READMEM(hGTA, dwAddress, [(A_Index - 1) * 4 + 0x4004], "Int") > 0)
continue
VarSetCapacity(struct, 20, 0)
NumPut(modelID, &struct, 0, "UInt")
NumPut(type, &struct, 4, "UInt")
NumPut(xPos, &struct, 8, "Float")
NumPut(yPos, &struct, 12, "Float")
NumPut(zPos, &struct, 16, "Float")
return !__WRITERAW(hGTA, pMemory + 1024, &struct, 20) ? -1 : __CALL(hGTA, dwSAMP + 0xFDC0, [["i", dwAddress], ["i", pMemory + 1024], ["i", A_Index - 1]] , false, true) ? A_Index - 1 : -1
}
return -1
}
getConnectionTicks() {
return !checkHandles() ? 0 : DllCall("GetTickCount") - __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, 0x3C1], "UInt")
}
getRunningTime() {
return !checkHandles() ? 0 : __READMEM(hGTA, 0xB610E1, [0x0], "UInt") / 4
}
deletePickup(ByRef pickupID) {
if (pickupID < 0 || pickupID > SAMP_MAX_PICKUPS - 1 || !checkHandles())
return false
if (__CALL(hGTA, dwSAMP + 0xFE70, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])], ["i", pickupID]], false, true)) {
pickupID := -1
return true
}
return false
}
getPickupModel(modelID) {
if (!updatePickups())
return ""
for i, o in oPickups {
if (o.MODELID == modelID)
return o
}
return ""
}
getClosestPickupModel() {
if (!updatePickups())
return -1
dist := -1
model := 0
pPos := getPlayerPos()
for i, o in oPickups {
if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1) {
dist := newDist
model := o.MODELID
}
}
return model
}
getPickupModelsInDistance(distance) {
if (!updatePickups())
return ""
array := []
pPos := getPlayerPos()
for i, o in oPickups {
if (getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos) < distance)
array.Push(o.MODELID)
}
return array
}
isPlayerDead(playerID) {
if (!checkHandles())
return false
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0, 0x2A4])
if (!dwAddress2 || dwAddress2 == "")
return false
if (!(dwAddress3 := isTaskActive(dwAddress2, 401)))
dwAddress3 := __DWORD(hGTA, dwAddress2, [0x47C])
if (__READSTRING(hGTA, dwAddress3, [0x10], 20) == "crckdeth2")
return true
return false
}
getClosestDeadPlayer() {
if (!checkHandles())
return [-1, 0]
dist := 0
playerID := -1
pos1 := getPlayerPos()
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
Loop % getMaxPlayerID() + 1 {
dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4, 0x0, 0x0, 0x2A4])
if (!dwAddress2 || dwAddress2 == "")
continue
if (!(dwAddress3 := isTaskActive(dwAddress2, 401)))
dwAddress3 := __DWORD(hGTA, dwAddress2, [0x47C])
if (__READSTRING(hGTA, dwAddress3, [0x10], 20) != "crckdeth2")
continue
dwAddress2 := __DWORD(hGTA, dwAddress2, [0x14])
dist2 := getDistance([__READMEM(hGTA, dwAddress2, [0x30], "Float"), __READMEM(hGTA, dwAddress2, [0x34], "Float"), __READMEM(hGTA, dwAddress2, [0x38], "Float")], pos1)
if (dist == 0 || dist2 < dist) {
playerID := A_Index - 1
dist := dist2
}
}
return [playerID, dist]
}
getClosestPlayer() {
if (!checkHandles())
return [-1, 0]
dist := 0
playerID := -1
pos1 := getPlayerPos()
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
Loop % getMaxPlayerID() + 1 {
dwAddress2 := __DWORD(hGTA, dwAddress, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4, 0x0, 0x0])
if (!dwAddress2 || dwAddress2 == "")
continue
dwAddress2 := __DWORD(hGTA, dwAddress2, [0x2A4, 0x14])
if (!dwAddress2 || dwAddress2 == "")
continue
dist2 := getDistance([__READMEM(hGTA, dwAddress2, [0x30], "Float"), __READMEM(hGTA, dwAddress2, [0x34], "Float"), __READMEM(hGTA, dwAddress2, [0x38], "Float")], pos1)
if (dist == 0 || dist2 < dist) {
playerID := A_Index - 1
dist := dist2
}
}
return [playerID, dist]
}
saveGTASettings() {
return checkHandles() && __CALL(hGTA, 0x57C660, [["i", 0xBA6748]], false, true)
}
setRadioVolume(volume) {
return (volume < 0 || volume > 16 || !checkHandles()) ? false : __CALL(hGTA, 0x506DE0, [["i", 0xB6BC90], ["i", volume * 4]], false, true) && __WRITEMEM(hGTA, 0xBA6798, [0x0], volume * 4, "UChar") && saveGTASettings()
}
getRadioVolume() {
return !checkHandles() ? false : __READMEM(hGTA, 0xBA6798, [0x0], "UChar")
}
setSFXVolume(volume) {
return (volume < 0 || volume > 16 || !checkHandles()) ? false : __CALL(hGTA, 0x506E10, [["i", 0xB6BC90], ["i", volume * 4]], false, true) && __WRITEMEM(hGTA, 0xBA6797, [0x0], volume * 4, "UChar") && saveGTASettings()
}
getSFXVolume() {
return !checkHandles() ? false : __READMEM(hGTA, 0xBA6797, [0x0], "UChar")
}
getDistanceToPickup(modelID) {
if (!updatePickups())
return -1
dist := -1
pPos := getPlayerPos()
for i, o in oPickups {
if (o.MODELID != modelID)
continue
if ((newDist := getDistance([o.XPOS, o.YPOS, o.ZPOS], pPos)) < dist || dist == -1)
dist := newDist
}
return dist
}
printPickups() {
if (!updatePickups())
return false
for i, o in oPickups
AddChatMessage("ID: " o.ID ", Model: " o.MODELID ", Type: " o.TYPE ", xPos: " o.XPOS ", yPos: " o.YPOS ", zPos: " o.ZPOS)
AddChatMessage("Pickup Count: " i)
return true
}
updatePickups() {
if (pickupTick + 200 > A_TickCount)
return true
if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PICKUP])) || (pickupCount := __DWORD(hGTA, dwAddress, [0x0])) <= 0)
return false
oPickups := []
Loop, % SAMP_MAX_PICKUPS {
pickupID := __READMEM(hGTA, dwAddress, [(i := A_Index - 1) * 4 + 0x4004], "Int")
if (pickupID < 0)
continue
pickupCount--
oPickups.Push(Object("ID", pickupID, "MODELID", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF004], "Int"), "TYPE", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF008], "Int"), "XPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF00C], "Float"), "YPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF010], "Float"), "ZPOS", __READMEM(hGTA, dwAddress, [i * 0x14 + 0xF014], "Float")))
if (pickupCount <= 0)
break
}
pickupTick := A_TickCount
return true
}
updateObjects() {
if (!checkHandles())
return false
if (objectTick + 1000 > A_TickCount)
return true
oObjects := []
objectTick := A_TickCount
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
if (!dwAddress)
return false
count := __DWORD(hGTA, dwAddress, [0x0])
Loop, % SAMP_MAX_OBJECTS {
i := A_Index - 1
if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
continue
dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
oObjects.Push(Object("ID", i, "MODELID", __DWORD(hGTA, dwObject, [0x4E]), "XPOS", __READMEM(hGTA, dwObject, [0x5C], "Float"), "YPOS"
, __READMEM(hGTA, dwObject, [0x60], "Float"), "ZPOS", __READMEM(hGTA, dwObject, [0x64], "Float")))
count--
if (count <= 0)
break
}
return true
}
_getChatline(dwIndex) {
if (dwIndex < 0 || dwIndex > 99 || !checkHandles())
return false
return __READSTRING(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x152 + 0xFC * (99 - dwIndex)], 144)
}
printObjectTexts() {
if (!checkHandles())
return false
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_OBJECT])
if (!dwAddress)
return false
count := __DWORD(hGTA, dwAddress, [0x0])
Loop, % SAMP_MAX_OBJECTS {
i := A_Index - 1
if (!__DWORD(hGTA, dwAddress, [i * 4 + 0x4]))
continue
dwObject := __DWORD(hGTA, dwAddress, [i * 0x4 + 0xFA4])
string := __READSTRING(hGTA, dwObject, [0x10CB, 0x0], 256)
if (string != "")
AddChatMessage("ID: " i ", " string ", X: " __READMEM(hGTA, dwObject, [0x5C], "Float") ", Y: " __READMEM(hGTA, dwObject, [0x60], "Float"))
count--
if (count <= 0)
break
}
return true
}
getTextLabelBySubstring(string) {
if (!updateTextLabels())
return ""
for i, o in oTextLabels {
if (InStr(o.TEXT, string))
return o.TEXT
}
return ""
}
updateTextLabels() {
if (!checkHandles())
return false
if (textLabelTick + 200 > A_TickCount)
return true
oTextLabels := []
dwTextLabels := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])
if (!dwTextLabels)
return false
Loop, % SAMP_MAX_TEXTLABELS {
i := A_Index - 1
if (!__DWORD(hGTA, dwTextLabels, [0xE800 + i * 4]))
continue
dwAddress := __DWORD(hGTA, dwTextLabels, [i * 0x1D])
if (!dwAddress)
continue
fX := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x8], "Float")
fY := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0xC], "Float")
fZ := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x10], "Float")
wVehicleID := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x1B], "UShort")
wPlayerID := __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x19], "UShort")
oTextLabels.Push(Object("ID", i, "TEXT", __READSTRING(hGTA, dwAddress, [0x0], 256), "XPOS", fX, "YPOS", fY, "ZPOS", fZ, "VEHICLEID", wVehicleID, "PLAYERID"
, wPlayerID, "VISIBLE", __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x18], "UChar"), "DISTANCE", __READMEM(hGTA, dwTextLabels, [i * 0x1D + 0x14], "Float")))
}
textLabelTick := A_TickCount
return true
}
updateTextLabel(textLabelID, text) {
if (textLabelID < 0 || textLabelID > 2047 || !checkHandles())
return false
return __WRITESTRING(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL, textLabelID * 0x1D, 0x0], text)
}
createTextLabel(text, color, xPos, yPos, zPos, drawDistance := 46.0, testLOS := 0, playerID := 0xFFFF, vehicleID := 0xFFFF) {
if (!checkHandles() || !(dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])))
return -1
Loop, % SAMP_MAX_TEXTLABELS {
if (__DWORD(hGTA, dwAddress, [0xE800 + (SAMP_MAX_TEXTLABELS - A_Index) * 4]))
continue
return __CALL(hGTA, dwSAMP + 0x11C0, [["i", dwAddress], ["i", SAMP_MAX_TEXTLABELS - A_Index], ["s", text], ["i", color], ["f", xPos], ["f", yPos], ["f", zPos]
, ["f", drawDistance], ["i", testLOS], ["i", playerID], ["i", vehicleID]], false, true) ? SAMP_MAX_TEXTLABELS - A_Index : -1
}
return -1
}
deleteTextLabel(ByRef textLabelID) {
if (textLabelID < 0 || !checkHandles()) {
textLabelID := -1
return -1
}
if (__CALL(hGTA, dwSAMP + 0x12D0, [["i", __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTLABEL])], ["i", textLabelID]], false, true)) {
textLabelID := -1
return -1
}
return textLabelID
}
printPlayerTextLabels() {
if (!updateTextLabels())
return false
for i, o in oTextLabels {
if (o.TEXT != "" && o.TEXT != " " && o.PLAYERID != 0xFFFF)
addChatMessage("{FFFF00}ID: " o.ID ", Text: " o.TEXT ", " o.PLAYERID)
}
return true
}

removePlayerTextLabels() {
	if (!updateTextLabels())
		return false

	for i, o in oTextLabels {
		if (o.TEXT != "" && o.TEXT != " " && o.PLAYERID != 0xFFFF)
			deleteTextLabel(o.ID)
	}
	return true
}

printTextLabels() {
if (!updateTextLabels())
return false
for i, o in oTextLabels
AddChatMessage("{FFFF00}ID: " o.ID ", Text: " o.TEXT ", " o.XPOS ", " o.YPOS ", " o.ZPOS ", ")
AddChatMessage("TextLabel Count: " i)
return true
}

printTextLabelsInDialog(){
    if (!updateTextLabels())
        return false
    for i, o in oTextLabels
    {
        TLID := % o.ID
        TLTEXT := % o.TEXT
        XPOS := % o.XPOS
        YPOS := % o.YPOS
        ZPOS := % o.ZPOS
        FileAppend, %TLID%`t%TLTEXT%`t%XPOS%`t%YPOS%`t%ZPOS%`n, %A_AppData%\prawler\temp\textlabels.txt
    }
    FileRead, Textlabels, %A_AppData%\prawler\temp\textlabels.txt
    FileDelete, %A_AppData%\prawler\temp\textlabels.txt
    showDialog(DIALOG_STYLE_TABLIST_HEADERS, prefix . "Textlabels", "ID`tText`tX`tY`tZ`n" Textlabels "`n `nGesamte Textlabels: " i, "Schließen")
    return true
}

countLabels() {
	return !updateTextLabels() ? -1 : oTextLabels.Length()
}

getPlayerAttachedTextLabel(playerID) {
	if (!checkHandles() || !updateTextLabels())
		return false

	for i, o in oTextLabels {
		if (playerID == o.PLAYERID)
			return o
	}

	return false
}

getPlayerAttachedTextLabels(playerID) {
	if (!checkHandles() || !updateTextLabels())
		return false

	labels := []
	for i, o in oTextLabels {
		if (playerID == o.PLAYERID)
			labels.Push(o)
	}
	return labels
}

getLabelBySubstring(text := "") {
if (!updateTextLabels())
return 0
for i, o in oTextLabels {
if (text != "" && InStr(o.TEXT, text) == 0)
continue
return o
}
return ""
}
getNearestLabel2(text := "", pos1 := "") {
if (!updateTextLabels())
return 0
nearest := ""
dist := -1
if (pos1 == "")
pos1 := getPlayerPos()
for i, o in oTextLabels {
if (text != "" && !InStr(o.TEXT, text))
continue
newDist := getDistance(pos1, [o.XPOS, o.YPOS, o.ZPOS])
if (dist == -1 || newDist < dist) {
dist := newDist
nearest := o
}
}
return [nearest, dist]
}
getNearestLabel(text := "") {
if (!updateTextLabels())
return 0
nearest := 0
dist := -1
pos1 := getPlayerPos()
for i, o in oTextLabels {
if (text != "" && o.TEXT != text)
continue
newDist := getDistance(pos1, [o.XPOS, o.YPOS, o.ZPOS])
if (dist == -1 || newDist < dist) {
dist := newDist
nearest := o
}
}
return nearest
}
getNearestLabelDistance(text := "") {
if(!updateTextLabels())
return 0
nearest := 0
dist := 5000
pos1 := getPlayerPos()
For i, o in oTextLabels
{
if (text != "" && !InStr(o.TEXT, text))
continue
pos2 := [o.XPOS, o.YPOS, o.ZPOS]
dist2 := getDistance(pos1, pos2)
if (dist2 < dist) {
dist := dist2
nearest := o
}
}
return [nearest, dist]
}

createBlip(dwIcon, fX, fY) {
	if (!checkHandles())
		return ""

	dwReturn := __INJECT(hGTA, [["NOP"]
		, ["push", [3, "Int"]]
		, ["push", [0, "Int"]]
		, ["push", [0.0, "Float"]]
		, ["push", [fY, "Float"]]
		, ["push", [fX, "Float"]]
		, ["push", [4, "Int"]]
		, ["call", [0x583820, "Int"]]
		, ["mov address, eax", [pMemory, "Int"]]
		, ["push", [dwIcon, "Int"]]
		, ["push eax"]
		, ["call", [0x583D70, "Int"]]
		, ["add esp", [0x20, "UChar"]]
		, ["ret"]])

	return dwReturn
}

clearBlip2(blipID) {
	if (!checkHandles() || !blipID)
		return false

	return __CALL(hGTA, 0x587C10, [["i", blipID]])
}

clearBlip(dwBlip) {
	if (!checkHandles() || !dwBlip)
		return false

	return __CALL(hGTA, 0x587CE0, [["i", dwBlip]])
}

clearAllBlips() {
	if (!checkHandles())
		return false

	Loop % GTA_BLIP_COUNT {
		currentElement := GTA_BLIP_POOL + (A_Index - 1) * GTA_BLIP_ELEMENT_SIZE
		if (__READMEM(hGTA, currentElement + GTA_BLIP_ID_OFFSET, [0x0], "UChar") != 0)
			clearBlip2(A_Index - 1)
	}

	return true
}

getBlipPosByIconID(iconID) {
if (!checkHandles())
return Object("ID", -1)
Loop % GTA_BLIP_COUNT {
currentElement := GTA_BLIP_POOL + (A_Index - 1) * GTA_BLIP_ELEMENT_SIZE
if (__READMEM(hGTA, currentElement + GTA_BLIP_ID_OFFSET, [0x0], "UChar") != iconID)
continue
xPos := __READMEM(hGTA, currentElement + GTA_BLIP_X_OFFSET, [0x0], "Float")
yPos := __READMEM(hGTA, currentElement + GTA_BLIP_Y_OFFSET, [0x0], "Float")
zPos := __READMEM(hGTA, currentElement + GTA_BLIP_Z_OFFSET, [0x0], "Float")
return Object("ID", A_Index - 1, "XPOS", xpos, "YPOS", yPos, "ZPOS", zPos)
}
return Object("ID", -1)
}

printMapIcons() {
	if (!checkHandles())
		return false

	Loop % GTA_BLIP_COUNT {
		currentElement := GTA_BLIP_POOL + (A_Index - 1) * GTA_BLIP_ELEMENT_SIZE
		
		style := __READMEM(hGTA, currentElement + GTA_BLIP_STYLE_OFFSET, [0x0], "UChar")
		id := __READMEM(hGTA, currentElement + GTA_BLIP_ID_OFFSET, [0x0], "UChar")
		xPos := __READMEM(hGTA, currentElement + GTA_BLIP_X_OFFSET, [0x0], "Float")
		yPos := __READMEM(hGTA, currentElement + GTA_BLIP_Y_OFFSET, [0x0], "Float")
		zPos := __READMEM(hGTA, currentElement + GTA_BLIP_Z_OFFSET, [0x0], "Float")
		color := intToHex(__READMEM(hGTA, currentElement + GTA_BLIP_COLOR_OFFSET, [0x0], "UInt"))
		
		if(xPos == 0 || yPos == 0 || zPos == 0)
			continue
		
		AddChatMessage("Icon ID: " id ", Style: " style ", Pos: " xPos " " yPos " " zPos ", Color: " color)
	}

	return true
}

getVehicleAddress(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4])
}
getVehicleModelID(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? false : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x22], "UShort")
}
getVehicleLockState(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x4F8], "UShort") == 2
}
getVehicleEngineState(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x428], "UShort") & 16 ? true : false
}
getVehicleLightState(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x428], "UShort") & 64 ? true : false
}
getVehicleSirenState(vehicleID) {
return !checkHandles() || vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES ? "" : __READMEM(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x1F7], "UShort")
}
getVehicleDriver(vehicleID) {
if (vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES || !checkHandles() || !updatePlayers())
return ""
dwPed := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4, 0x460])
if (dwPed == 0x0 || dwPed == "")
return ""
if (dwPed == __DWORD(hGTA, GTA_CPED_PTR, [0x0]))
return Object("ID", getID(), "NAME", getUserName())
dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
for i, o in oPlayers {
if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) == dwPed)
return Object("ID", i, "NAME", o)
}
return ""
}
getVehicleDriverByPtr(dwVehiclePtr) {
if (dwVehiclePtr == 0x0 || dwVehiclePtr == "" | !checkHandles() || !updatePlayers())
return ""
dwPed := __DWORD(hGTA, dwVehiclePtr, [0x460])
if (dwPed == 0x0 || dwPed == "")
return ""
if (dwPed == __DWORD(hGTA, GTA_CPED_PTR, [0x0]))
return Object("ID", getID(), "NAME", getUserName())
dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
for i, o in oPlayers {
if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) == dwPed)
return Object("ID", i, "NAME", o)
}
return ""
}
getPlayerPosition(playerID) {
if (playerID < 0 || !checkHandles() || playerID > getMaxPlayerID() || playerID == getID())
return ""
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + playerID * 4, 0x0, 0x0])
if (!dwAddress || dwAddress == "")
return ""
dwAddress := __DWORD(hGTA, dwAddress, [0x2A4, 0x14])
return [__READMEM(hGTA, dwAddress, [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getClosestVehicleDriver(modelID := -1, skipOwn := 1) {
if ((modelID < 400 && modelID != -1) || modelID > 611 || !checkHandles() || !updateVehicles())
return ""
nearest := ""
dist := 10000.0
pos1 := getPlayerPos()
vehPTR := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
closestDriver := ""
playerID := getID()
for i, o in oVehicles {
if (modelID != -1 && modelID != o.MODELID || (skipOwn == 1 && o.PTR == vehPTR))
continue
dist2 := getDistance(pos1, getVehiclePosByPtr(o.PTR))
if (dist2 < dist && (driver := getVehicleDriverByPtr(o.PTR)) != "") {
if (skipOwn == 2 && driver.ID == playerID)
continue
dist := dist2
nearest := o
closestDriver := driver
}
}
return [closestDriver, dist]
}
getVehiclePassengers(vehicleID) {
if (vehicleID < 1 || vehicleID > SAMP_MAX_VEHICLES || !checkHandles() || !updatePlayers())
return ""
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE, 0x4FB4 + vehicleID * 0x4])
if (dwAddress == 0x0 || dwAddress == "")
return ""
dwCPedPtr := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
passengers := []
Loop, 10 {
if ((dwPED := __DWORD(hGTA, dwAddress + 0x45C, [4 * A_Index])) == 0x0)
continue
if (dwCPedPtr == dwPED)
passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", getID(), "NAME", getUsername()))
else
passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", 0xFFFF, "NAME", ""))
}
dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
for i, o in oPlayers {
for j, k in passengers {
if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) != k.PED)
continue
k.ID := i
k.NAME := o
}
}
return passengers
}
getMyVehiclePassengers() {
if (!checkHandles() || !updatePlayers())
return ""
dwAddress := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
if (!dwAddress)
return ""
dwCPedPtr := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
passengers := []
Loop, 10 {
if ((dwPED := __DWORD(hGTA, dwAddress + 0x45C, [4 * A_Index])) == 0x0)
continue
if (dwCPedPtr == dwPED)
passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", getID(), "NAME", getUsername()))
else
passengers.Push(Object("SEAT", A_Index - 1, "PED", dwPED, "ID", 0xFFFF, "NAME", ""))
}
dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
for i, o in oPlayers {
for j, k in passengers {
if (__DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + i * 4, 0x0, 0x0, 0x2A4]) != k.PED)
continue
k.ID := i
k.NAME := o
}
}
return passengers
}
updateVehicles() {
if (!checkHandles())
return false
if (vehicleTick + 1000 > A_TickCount)
return true
oVehicles := []
stVehiclePool := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_VEHICLE])
if (!stVehiclePool)
return false
vehicleCount := __DWORD(hGTA, stVehiclePool, [0x0])
Loop, % SAMP_MAX_VEHICLES {
if (!__DWORD(hGTA, stVehiclePool, [0x3074 + (A_Index - 1) * 0x4]))
continue
vehPtr := __DWORD(hGTA, stVehiclePool, [0x4FB4 + (A_Index - 1) * 0x4])
if (!vehPtr)
continue
oVehicles.Push(Object("ID", A_Index - 1, "PTR", vehPTR, "MODELID", __READMEM(hGTA, vehPtr, [0x22], "UShort")))
vehicleCount--
if (vehicleCount < 1)
break
}
vehicleTick := A_TickCount
return true
}
getVehiclePosByPtr(dwVehPtr) {
if (!dwVehPtr || !checkHandles())
return false
dwAddress := __DWORD(hGTA, dwVehPtr, [0x14])
if (!dwAddress)
return false
return [__READMEM(hGTA, dwAddress, [0x30], "Float"), __READMEM(hGTA, dwAddress, [0x34], "Float"), __READMEM(hGTA, dwAddress, [0x38], "Float")]
}
getClosestVehicle(modelID := -1, skipOwn := true) {
if ((modelID < 400 && modelID != -1) || modelID > 611 || !checkHandles() || !updateVehicles())
return ""
nearest := ""
dist := 10000.0
pos1 := getPlayerPos()
vehPTR := __DWORD(hGTA, GTA_VEHICLE_PTR, [0x0])
for i, o in oVehicles {
if (modelID != -1 && modelID != o.MODELID || (skipOwn && o.PTR == vehPTR))
continue
dist2 := getDistance(pos1, getVehiclePosByPtr(o.PTR))
if (dist2 < dist) {
dist := dist2
nearest := o
}
}
return nearest
}
getPlayerSkin() {
return !checkHandles() ? false : __READMEM(hGTA, GTA_CPED_PTR, [0x0, 0x22], "UShort")
}
getSkinID(dwID) {
if (!checkHandles() || dwID > SAMP_MAX_PLAYERS || dwID < 0)
return -1
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER, SAMP_REMOTEPLAYERS + dwID * 4])
if (!dwAddress)
return -1
dwAddress := __DWORD(hGTA, dwAddress, [0x0])
if (!dwAddress)
return -1
dwAddress := __DWORD(hGTA, dwAddress, [0x0])
if (!dwAddress)
return -1
dwAddress := __DWORD(hGTA, dwAddress, [0x2A4])
if (!dwAddress)
return -1
skin := __READMEM(hGTA, dwAddress, [0x22], "UShort")
if (ErrorLevel)
return -1
return skin
}
setPlayerSkin(skinID) {
return checkHandles() && __CALL(hGTA, dwSAMP + 0x9A590, [["i", __DWORD(hGTA, dwSAMP, [SAMP_MISC_INFO_PTR, 0x8])], ["i", skinID]], false, true)
}
getPlayerPos() {
return !checkHandles() ? "" : [__READMEM(hGTA, 0xB6F2E4, [0x0], "Float"), __READMEM(hGTA, 0xB6F2E8, [0x0], "Float"), __READMEM(hGTA, 0xB6F2EC, [0x0], "Float")]
}
getDistance(pos1, pos2) {
return !pos1 || pos1 == "" || !pos2 || pos2 == "" ? -1 : Sqrt((pos1[1] - pos2[1]) * (pos1[1] - pos2[1]) + (pos1[2] - pos2[2]) * (pos1[2] - pos2[2]) + (pos1[3] - pos2[3]) * (pos1[3] - pos2[3]))
}
isKillInfoEnabled() {
return checkHandles() && __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR, 0x0])
}
toggleKillInfoEnabled(toggle := true) {
return checkHandles() && __WRITEMEM(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR, 0x0], toggle ? 1 : 0, "UInt")
}
getKilledPlayers(bReset := false) {
if (!checkHandles())
return ""
kills := []
dwPlayers := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_PLAYER])
dwLocalPED := __DWORD(hGTA, GTA_CPED_PTR, [0x0])
Loop % getMaxPlayerID() + 1
{
dwRemoteplayer := __DWORD(hGTA, dwPlayers, [SAMP_REMOTEPLAYERS + (A_Index - 1) * 4])
if (!dwRemoteplayer)
continue
fHealth := __READMEM(hGTA, dwRemoteplayer, [0x0, 0x1BC], "Float")
if (fHealth > 0)
continue
dwSAMPActor := __DWORD(hGTA, dwRemoteplayer, [0x0, 0x0])
if (!dwSAMPActor)
continue
dwPED := __DWORD(hGTA, dwSAMPActor, [0x2A4])
if (!dwPED)
continue
dwMurderer := __DWORD(hGTA, dwPED, [0x764])
if (!dwMurderer || dwLocalPED != dwMurderer)
continue
if (bReset)
__WRITEMEM(hGTA, dwPED, [0x764], 0, "UInt")
kills.Push(Object("ID", A_Index - 1, "WEAPON", __DWORD(hGTA, dwPED, [0x760])))
}
return kills
}
getKillEntry(index) {
if (index < 0 || index > 4 || !checkHandles())
return false
dwAddress := __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR]) + 0x4
sVictim := __READSTRING(hGTA, dwAddress, [index * 0x3B], 25)
sKiller := __READSTRING(hGTA, dwAddress, [index * 0x3B + 0x19], 25)
dwVictimColor := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x32], "UInt")
dwKillerColor := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x36], "UInt")
bReason := __READMEM(hGTA, dwAddress, [index * 0x3B + 0x3A], "UChar")
return Object("VICTIM", sVictim, "KILLER", sKiller, "VCOLOR", dwVictimColor, "KCOLOR", dwKillerColor, "REASON", bReason)
}
addKillEntry(victimName := " ", killerName := " ", victimColor := 0xFFFFFFFF, killerColor := 0xFFFFFFFF, reason := 255) {
return checkHandles() && __CALL(hGTA, dwSAMP + 0x66930, [["i", __DWORD(hGTA, dwSAMP, [SAMP_KILL_INFO_PTR])], ["s", victimName], ["s", killerName], ["i", victimColor], ["i", killerColor], ["i", reason]], false, true)
}
playAudioStream(url) {
return checkHandles() && __CALL(hGTA, dwSAMP + 0x62DA0, [["s", url], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
}
stopAudioStream() {
return checkHandles() && __CALL(hGTA, dwSAMP + 0x629A0, [["i", 1]], false)
}
playSound(soundID) {
return checkHandles() && __CALL(hGTA, 0x506EA0, [["i", 0xB6BC90], ["i", soundID], ["i", 0], ["f", 1.0]], false, true)
}
playAudioEvent(eventID) {
if (!checkHandles())
return false
VarSetCapacity(buf, 12, 0)
NumPut(0, buf, 0, "Float")
NumPut(0, buf, 4, "Float")
NumPut(0, buf, 8, "Float")
if (!__WRITERAW(hGTA, pMemory + 20, &buf, 12))
return false
return __CALL(hGTA, 0x507340, [["i", pMemory + 20], ["i", eventID]], false, false)
}
addDelimiters(value, delimiter := ".") {
return RegExReplace(Round(value), "\G\d+?(?=(\d{3})+(?:\D|$))", "$0" delimiter)
}
checkHandles() {
return !refreshGTA() || !refreshSAMP() || !refreshMemory() ? false : true
}

refreshGTA() {
	if (!(newPID := getPID(gta_title))) {
		if (hGTA) {
			virtualFreeEx(hGTA, pMemory, 0, 0x8000)
			closeProcess(hGTA)
		}
		
		dwGTAPID := 0, hGTA := 0x0, dwSAMP := 0x0, pMemory := 0x0
		return false
	}

	if (!hGTA || dwGTAPID != newPID) {
		if (!(hGTA := openProcess(newPID))) {
			dwGTAPID := 0, hGTA := 0x0, dwSAMP := 0x0, pMemory := 0x0
			return false
		}
		
		dwGTAPID := newPID, dwSAMP := 0x0, pMemory := 0x0
	}

	return true
}

refreshSAMP() {
	if (dwSAMP)
		return true

	dwSAMP := "0x" + sampdll_base_address
	
	if (!dwSAMP)
		return false

	return true
}

refreshMemory() {
if (!pMemory) {
pMemory := virtualAllocEx(hGTA, 6384, 0x1000 | 0x2000, 0x40)
if (ErrorLevel) {
pMemory := 0x0
return false
}
pInjectFunc := pMemory + 5120
pDetours	:= pInjectFunc + 1024
}
return true
}
queryPerformance() {
Static QPCLAST, QPCNOW, QPCFREQ
if not QPCFREQ
if not DllCall("QueryPerformanceFrequency", "Int64 *", QPCFREQ)
return "Fail QPF"
QPCLAST=%QPCNOW%
if not DllCall("QueryPerformanceCounter", "Int64 *", QPCNOW)
return "Fail QPC"
return (QPCNOW-QPCLAST)/QPCFREQ
}
getTownNumber() {
if (!checkHandles())
return false
pos := getPlayerPos()
VarSetCapacity(struct, 12, 0)
NumPut(pos[1], &struct, 0, "Float")
NumPut(pos[2], &struct, 4, "Float")
NumPut(pos[3], &struct, 8, "Float")
return !__WRITERAW(hGTA, pMemory + 1024, &struct, 63) ? -1 : __CALL(hGTA, 0x572300, [["i", pMemory + 1024]], true, false, true)
}
getCity(x, y, z) {
if (z > 900.0)
return "Interior"
for i, o in cities {
if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
return o.NAME
}
return "Unbekannt"
}
getZone(x, y, z) {
if (z > 900.0)
return "Interior"
for i, o in zones {
if (x >= o.X1 && y >= o.Y1 && x <= o.X2 && y <= o.Y2)
return o.NAME
}
return "Unbekannt"
}
global aInterface := []
aInterface["HealthX"] 			:= Object("ADDRESSES", [0x58EE87], "DEFAULT_POINTER", 0x86535C, "DEFAULT_VALUE", 141.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["HealthY"] 			:= Object("ADDRESSES", [0x58EE68], "DEFAULT_POINTER", 0x866CA8, "DEFAULT_VALUE", 77.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["HealthWidth"] 		:= Object("ADDRESSES", [0x5892D8], "DEFAULT_POINTER", 0x866BB8, "DEFAULT_VALUE", 109.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["HealthHeight"] 		:= Object("ADDRESSES", [0x589358], "DEFAULT_POINTER", 0x85EED4, "DEFAULT_VALUE", 9.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["HealthColor"] 		:= Object("ADDRESSES", [0x58932A], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 0, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["HealthBorder"] 		:= Object("ADDRESSES", [0x589353], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 1, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["HealthPercentage"] 	:= Object("ADDRESSES", [0x589355], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 0, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["ArmorX"] 			:= Object("ADDRESSES", [0x58EF59], "DEFAULT_POINTER", 0x866B78, "DEFAULT_VALUE", 94.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["ArmorY"] 			:= Object("ADDRESSES", [0x58EF3A], "DEFAULT_POINTER", 0x862D38, "DEFAULT_VALUE", 48.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["ArmorWidth"] 		:= Object("ADDRESSES", [0x58915D], "DEFAULT_POINTER", 0x86503C, "DEFAULT_VALUE", 62.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["ArmorHeight"] 		:= Object("ADDRESSES", [0x589146], "DEFAULT_POINTER", 0x85EED4, "DEFAULT_VALUE", 9.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["ArmorColor"] 		:= Object("ADDRESSES", [0x5890F5], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 4, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["ArmorBorder"] 		:= Object("ADDRESSES", [0x589123], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 1, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["ArmorPercentage"] 	:= Object("ADDRESSES", [0x589125], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 0, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["BreathX"] 			:= Object("ADDRESSES", [0x58F11F], "DEFAULT_POINTER", 0x866B78, "DEFAULT_VALUE", 94.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["BreathY"] 			:= Object("ADDRESSES", [0x58F100], "DEFAULT_POINTER", 0x86503C, "DEFAULT_VALUE", 62.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["BreathWidth"] 		:= Object("ADDRESSES", [0x589235], "DEFAULT_POINTER", 0x86503C, "DEFAULT_VALUE", 62.0 ,"VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["BreathHeight"] 		:= Object("ADDRESSES", [0x58921E], "DEFAULT_POINTER", 0x85EED4, "DEFAULT_VALUE", 9.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["BreathColor"] 		:= Object("ADDRESSES", [0x5891E4], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 3, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["BreathBorder"] 		:= Object("ADDRESSES", [0x589207], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 1, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["BreathPercentage"] 	:= Object("ADDRESSES", [0x589209], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 0, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["MoneyX"] 			:= Object("ADDRESSES", [0x58F5FC], "DEFAULT_POINTER", 0x85950C, "DEFAULT_VALUE", 32.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["MoneyY"] 			:= Object("ADDRESSES", [0x58F5DC], "DEFAULT_POINTER", 0x866C88, "DEFAULT_VALUE", 89.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["MoneyXScale"] 		:= Object("ADDRESSES", [0x58F564], "DEFAULT_POINTER", 0x866CAC, "DEFAULT_VALUE", 0.55 ,"VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["MoneyYScale"] 		:= Object("ADDRESSES", [0x58F54E], "DEFAULT_POINTER", 0x858F14, "DEFAULT_VALUE", 1.1, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["MoneyColor"] 		:= Object("ADDRESSES", [0x58F492], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 1, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["MoneyColorDebt"] 	:= Object("ADDRESSES", [0x58F4D4], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 0, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["WeaponX"] 			:= Object("ADDRESSES", [0x58F92F], "DEFAULT_POINTER", 0x866C84, "DEFAULT_VALUE", 0.17343046, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponIconX"] 		:= Object("ADDRESSES", [0x58F927], "DEFAULT_POINTER", 0x85950C, "DEFAULT_VALUE", 32.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponIconY"] 		:= Object("ADDRESSES", [0x58F913], "DEFAULT_POINTER", 0x858BA4, "DEFAULT_VALUE", 20.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponAmmoY"] 		:= Object("ADDRESSES", [0x58F9DC], "DEFAULT_POINTER", 0x858BA4, "DEFAULT_VALUE", 20.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponAmmoX"] 		:= Object("ADDRESSES", [0x58F9F7], "DEFAULT_POINTER", 0x866C84, "DEFAULT_VALUE", 0.17343046, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponIconWidth"] 	:= Object("ADDRESSES", [0x58FAAB], "DEFAULT_POINTER", 0x866C4C, "DEFAULT_VALUE", 47.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponAmmoHeight"]	:= Object("ADDRESSES", [0x5894B7], "DEFAULT_POINTER", 0x858CB0, "DEFAULT_VALUE", 0.7, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WeaponAmmoWidth"]	:= Object("ADDRESSES", [0x5894CD], "DEFAULT_POINTER", 0x858C24, "DEFAULT_VALUE", 0.3, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedX"] 			:= Object("ADDRESSES", [0x58DD0F], "DEFAULT_POINTER", 0x863210, "DEFAULT_VALUE", 29.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedY"] 			:= Object("ADDRESSES", [0x58DDFC], "DEFAULT_POINTER", 0x866C5C, "DEFAULT_VALUE", 114.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedEmptyY"] 		:= Object("ADDRESSES", [0x58DE27], "DEFAULT_POINTER", 0x858CCC, "DEFAULT_VALUE", 12.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedXScale"] 		:= Object("ADDRESSES", [0x58DCC0], "DEFAULT_POINTER", 0x866C60, "DEFAULT_VALUE", 0.605, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedYScale"] 		:= Object("ADDRESSES", [0x58DCAA], "DEFAULT_POINTER", 0x866C64, "DEFAULT_VALUE", 1.21, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["WantedColor"] 		:= Object("ADDRESSES", [0x58DDC9], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 6, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["RadioY"] 			:= Object("ADDRESSES", [0x4E9FD8], "DEFAULT_POINTER", 0x858F8C, "DEFAULT_VALUE", 22.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadioXScale"] 		:= Object("ADDRESSES", [0x4E9F38], "DEFAULT_POINTER", 0x858CC8, "DEFAULT_VALUE", 0.6, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadioYScale"] 		:= Object("ADDRESSES", [0x4E9F22], "DEFAULT_POINTER", 0x858C20, "DEFAULT_VALUE", 0.9, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadioColor"] 		:= Object("ADDRESSES", [0x4E9F91], "DEFAULT_POINTER", null, "DEFAULT_VALUE", 6, "VALUE_TYPE", "Byte", "DETOUR_ADDRESS", null)
aInterface["RadarX"] 			:= Object("ADDRESSES", [0x58A79B, 0x5834D4, 0x58A836, 0x58A8E9, 0x58A98A, 0x58A469, 0x58A5E2, 0x58A6E6], "DEFAULT_POINTER", 0x858A10, "DEFAULT_VALUE", 40.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadarY"] 			:= Object("ADDRESSES", [0x58A7C7, 0x58A868, 0x58A913, 0x58A9C7, 0x583500, 0x58A499, 0x58A60E, 0x58A71E], "DEFAULT_POINTER", 0x866B70, "DEFAULT_VALUE", 104.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadarHeight"]		:= Object("ADDRESSES", [0x58A47D, 0x58A632, 0x58A6AB, 0x58A70E, 0x58A801, 0x58A8AB, 0x58A921, 0x58A9D5, 0x5834F6], "DEFAULT_POINTER", 0x866B74, "DEFAULT_VALUE", 76.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadarWidth"]		:= Object("ADDRESSES", [0x5834C2, 0x58A449, 0x58A7E9, 0x58A840, 0x58A943, 0x58A99D], "DEFAULT_POINTER", 0x866B78, "DEFAULT_VALUE", 94.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadarScaleWidth"]	:= Object("ADDRESSES", [0x5834EE, 0x58A475, 0x58A602, 0x58A706, 0x58A7BB, 0x58A85C, 0x58A90B, 0x58A9BF], "DEFAULT_POINTER", 0x859524, "DEFAULT_VALUE", 0.002232143, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["RadarScaleHeight"]	:= Object("ADDRESSES", [0x5834BC, 0x58A443, 0x58A5DA, 0x58A6E0, 0x58A793, 0x58A830, 0x58A8E1, 0x58A984], "DEFAULT_POINTER", 0x859520, "DEFAULT_VALUE", 0.0015625, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["Radar-Tilt-XPos"] 	:= Object("ADDRESSES", [0x58A469], "DEFAULT_POINTER", 0x858A10, "DEFAULT_VALUE", 40.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["Radar-Tilt-YPos"] 	:= Object("ADDRESSES", [0x58A499], "DEFAULT_POINTER", 0x866B70, "DEFAULT_VALUE", 104.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["Radar-Height-XPos"] := Object("ADDRESSES", [0x58A5E2, 0x58A6E6], "DEFAULT_POINTER", 0x858A10, "DEFAULT_VALUE", 40.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)
aInterface["Radar-Height-YPos"] := Object("ADDRESSES", [0x58A60E, 0x58A71E], "DEFAULT_POINTER", 0x866B70, "DEFAULT_VALUE", 104.0, "VALUE_TYPE", "Float", "DETOUR_ADDRESS", null)

setHUDValue(sName, value) {
if (!aInterface.HasKey(sName) || !checkHandles())
return false
oKey := aInterface[sName]
dwAddress := oKey.DEFAULT_POINTER != null ? pDetours + (getKeyIndex(sName) - 1) * 4 : oKey.ADDRESSES[1]
if (value = "DEFAULT")
value := oKey.DEFAULT_VALUE
else if (value = "RESET")
{
if (oKey.DEFAULT_POINTER != null)
{
for i, o in oKey.ADDRESSES {
__WRITEMEM(hGTA, o, [0x0], oKey.DEFAULT_POINTER, "UInt")
if (ErrorLevel)
return false
}
return true
}
else
value := oKey.DEFAULT_VALUE
}
else if (oKey.DEFAULT_POINTER != null && (oKey.DETOUR_ADDRESS == null || __READMEM(hGTA, oKey.ADDRESSES[1], [0x0], "UInt") != oKey.DETOUR_ADDRESS))
{
__WRITEMEM(hGTA, dwAddress, [0x0], oKey.DEFAULT_VALUE, oKey.VALUE_TYPE)
if (ErrorLevel)
return false
oKey.DETOUR_ADDRESS := dwAddress
for i, o in oKey.ADDRESSES {
__WRITEMEM(hGTA, o, [0x0], dwAddress, "UInt")
if (ErrorLevel)
return false
}
}
__WRITEMEM(hGTA, dwAddress, [0x0], value, oKey.VALUE_TYPE)
if (ErrorLevel)
return false
return true
}

resetHUD() {
	for i, o in aInterface
	{
		for k, v in o.ADDRESSES {
			if (o.DEFAULT_POINTER != null)
				__WRITEMEM(hGTA, v, [0x0], o.DEFAULT_POINTER, "UInt")
			else
				__WRITEMEM(hGTA, v, [0x0], o.DEFAULT_VALUE, o.VALUE_TYPE)
		}
	}

	if (ErrorLevel)
		return false

	return true
}

getKeyIndex(sKey) {
for i, o in aInterface {
if (aInterface[sKey] == o)
return A_Index
}
return false
}

PlayerInput(text) {
s := A_IsSuspended
Suspend On
KeyWait Enter
;BlockChatInput()
SendInput t^a{backspace}%text%
Input, var, v, {enter}
SendInput ^a{backspace 100}{enter}
Sleep, 20
;unBlockChatInput()
if(!s)
Suspend Off
return var
}

ReverseArray(oArray)
{
	Array := Object()
	For i,v in oArray
		Array[oArray.Length()-i+1] := v
	Return Array
}

getFPS() {
	if (!checkHandles())
		return 0
	static timev := A_TickCount
	static val   := readDWORD(hGTA, 0xB7CB4C)
	temp := readDWORD(hGTA, 0xB7CB4C)
	ret := (temp-val)/(A_TickCount-timev)*1000
	timev := A_TickCount
	val := temp
	return Round(ret)
}

sendDialogResponseWait(dialogID, buttonID, listIndex := 0xFFFF, inputResponse := "") {
	Loop, 100 {
		if (getDialogID() == dialogID) {
			sendDialogResponse(dialogID, buttonID, listIndex, inputResponse)
			return true
		}
		sleep, 20
	}
	unblockDialog()
	return false
}

waitForDialogID(dialogID) {
	Loop, 100 {
		if (getDialogID() == dialogID) {
			sleep, 300
			return true
		}
		sleep, 20
	}
	unblockDialog()
	return false
}

getGender(playerID) {
	skin := getSkinID(playerID)
	if (skin < 1)
		return ""
	return SubStr(skinGender, skin + 1, 1) ? "Herr " : "Frau "
}

fpsUnlock() {
if (!checkHandles())
return 0
global instruction
instruction := readMem(hGTA, dwSAMP + 0x9D9D0, 4, "UInt")
return writeMemory(hGTA, dwSAMP + 0x9D9D0, 0x5051FF15, 4, "UChar")
}
fpsLock() {
if (!checkHandles())
return 0
global instruction
if (instruction) {
return writeMemory(hGTA, dwSAMP + 0x9D9D0, instruction, 4, "UInt")
} else {
return false
}
}

getCoordinates() {
if(!checkHandles())
return ""
fX := readFloat(hGTA, ADDR_POSITION_X)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fY := readFloat(hGTA, ADDR_POSITION_Y)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fZ := readFloat(hGTA, ADDR_POSITION_Z)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}

updateTextLabelData() {
if (!checkHandles())
return 0
if (iRefreshTL+iUpdateTickTL > A_TickCount)
return 1
oTextLabelData := []
iRefreshTL := A_TickCount
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if (ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if (ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwTextLabels := readDWORD(hGTA, dwAddress + 12)
if (ErrorLevel || dwTextDraws==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
Loop, % 2048
{
i := A_Index-1
dwIsActive := readDWORD(hGTA, dwTextLabels + 59392 + i*4)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if (dwIsActive==0)
continue
dwAddr := readDWORD(hGTA, dwTextLabels + i*29)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if (dwAddr==0)
continue
sText := readString(hGTA, dwAddr, 256)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fX := readFloat(hGTA, dwTextLabels + i*29 +8)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fY := readFloat(hGTA, dwTextLabels + i*29 +12)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fZ := readFloat(hGTA, dwTextLabels + i*29 +16)
if (ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
wPlayerID := readMem(hGTA, dwTextLabels + i * 0x1D + 0x19, 2, "UShort")
wVehicleID := readMem(hGTA, dwTextLabels + i * 0x1D + 0x1B, 2, "UShort")
oTextLabelData[i] := Object("TEXT", sText, "XPOS", fX , "YPOS", fY , "ZPOS", fZ, "PLAYERID", wPlayerID, "VEHICLEID", wVehicleID)
}
ErrorLevel := ERROR_OK
return 1
}

getUnixTimestamp(time_orig) {
StringLeft, now_year, time_orig, 4
StringMid, now_month, time_orig, 5, 2
StringMid, now_day, time_orig, 7, 2
StringMid, now_hour, time_orig, 9, 2
StringMid, now_min, time_orig, 11, 2
StringRight, now_sec, time_orig, 2
year_sec := 31536000 * (now_year - 1970)
leap_days := (now_year - 1972) / 4 + 1
Transform, leap_days, Floor, %leap_days%
this_leap := now_year/4
Transform, this_leap_round, Floor, %this_leap%
if (this_leap = this_leap_round) {
if (now_month <= 2) {
leap_days--
}
}
leap_sec := leap_days * 86400
if (now_month == 01)
month_sec = 0
if (now_month == 02)
month_sec = 2678400
if (now_month == 03)
month_sec = 5097600
if (now_month == 04)
month_sec = 7776000
if (now_month == 05)
month_sec = 10368000
if (now_month == 06)
month_sec = 13046400
if (now_month == 07)
month_sec = 15638400
if (now_month == 08)
month_sec = 18316800
if (now_month == 09)
month_sec = 20995200
if (now_month == 10)
month_sec = 23587200
if (now_month == 11)
month_sec = 26265600
if (now_month == 12)
month_sec = 28857600
day_sec := (now_day - 1) * 86400
hour_sec := now_hour * 3600
min_sec := now_min * 60
date_sec := year_sec + month_sec + day_sec + leap_sec + hour_sec + min_sec + now_sec
return date_sec
}

formatTime(time) {
	hours := Floor(time / 60 / 60)
	minutes := Floor(time / 60) - hours * 60
	seconds := time - minutes * 60 - hours * 60 * 60
	time := ""
	if (hours > 0) {
		time .= hours
		if (minutes > 0) {
			time .= ":"
		} else if (seconds > 0) {
			time .= ":"
		}
	}
	if (minutes > 0) {
		if(Minutes < 10) {
			time .= "0" . minutes
		} else {
			time .= minutes
		}
		if (seconds > 0) {
			time .= ":"
		}
		else
		{
			time .= ":00"
		}
	}
	else
	{
		time .= "00:"
	}
	if (seconds > 0 || (minutes == 0 && hours == 0)) {
		if(Seconds < 10) {
			time .= "0" . seconds
		} else {
			time .= seconds
		}
	}
	return time
}

changeTextDrawColors() {
	if (!checkHandles())
		return false
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1F1FE0, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF009933, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFFFF901E, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFFFFFFF, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF00D7FF, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF00D7FF, "UInt")
	return true
}

changeServerTextdraws() {
	if (!checkHandles())
		return false

	dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 315.0, "Float")
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.28, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 540.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 12.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 1, "UChar")
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 3, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 15.0, "Float")
	return true
}

resetTextDrawColors() {
	if (!checkHandles())
		return false
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 0], 0xFF1D19B4, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 1], 0xFF2C6836, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 2], 0xFF7F3C32, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 4], 0xFFE1E1E1, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 6], 0xFF106290, "UInt")
	__WRITEMEM(hGTA, 0xBAB22C, [4 * 11], 0xFF63C0E2, "UInt")
	return true
}

resetServerTextdraws() {
	if (!checkHandles())
		return false

	resetHUD()

	dwSAMPTextDraws := __DWORD(hGTA, dwSAMP, [SAMP_INFO_PTR, SAMP_POOLS, SAMP_POOL_TEXTDRAW])
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4400])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 1, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.31, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 1.085, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 35.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 321.0, "Float")
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x4450])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERWIDTH], 0.19, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_LETTERHEIGHT], 0.9, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 406.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_YPOS], 27.0, "Float")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_RIGHT], 0, "UChar")
	dwAddress := __DWORD(hGTA, dwSAMPTextDraws, [0x2428])
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_FONT], 2, "UInt")
	__WRITEMEM(hGTA, dwAddress, [SAMP_TEXTDRAW_XPOS], 26.0, "Float")
	return true
}

restartGameEx() {
	if (!checkHandles())
		return -1

	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)

	if (ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return -1
	}

	dwFunc := dwSAMP + 0xA060

	VarSetCapacity(injectData, 11, 0)
	
	NumPut(0xB9, injectData, 0, "UChar")
	NumPut(dwAddress, injectData, 1, "UInt")
	NumPut(0xE8, injectData, 5, "UChar")
	offset := dwFunc - (pInjectFunc + 10)
	NumPut(offset, injectData, 6, "Int")
	NumPut(0xC3, injectData, 10, "UChar")

	writeRaw(hGTA, pInjectFunc, &injectData, 11)
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	
	return true
}

disconnectEx() {
	if (!checkHandles())
		return 0

	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
	if (ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
	if (ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ecx := dwAddress

	dwAddress := readDWORD(hGTA, dwAddress)
	if (ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	VarSetCapacity(injectData, 24, 0)

	NumPut(0xB9, injectData, 0, "UChar")
	NumPut(ecx, injectData, 1, "UInt")

	NumPut(0xB8, injectData, 5, "UChar")
	NumPut(dwAddress, injectData, 6, "UInt")

	NumPut(0x68, injectData, 10, "UChar")
	NumPut(0, injectData, 11, "UInt")
	
	NumPut(0x68, injectData, 15, "UChar")
	NumPut(500, injectData, 16, "UInt")
	
	NumPut(0x50FF, injectData, 20, "UShort")
	NumPut(0x08, injectData, 22, "UChar")
	
	NumPut(0xC3, injectData, 23, "UChar")
	
	writeRaw(hGTA, pInjectFunc, &injectData, 24)
	if (ErrorLevel)
		return false

	hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
	if (ErrorLevel)
		return false

	waitForSingleObject(hThread, 0xFFFFFFFF)
	return true
}

setRestart() {
	VarSetCapacity(old, 4, 0)
	dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)

	if (ErrorLevel || dwAddress==0) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	NumPut(9,old,0,"Int")
	writeRaw(hGTA, dwAddress + 957, &old, 4)
}

getCheckpointPos_(ByRef x, ByRef y, ByRef z) {
	if(!checkHandles())
		return 0

	x := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_X)
	y := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_Y)
	z := readFloat(hGTA, GTA_CHECKPOINT + GTA_CHECKPOINT_OFF_Z)
	return 1
}

getCheckpointDistance() {
	getCheckpointPos_(x, y, z)
	return getDistanceToPoint(x, y, z)
}

getDistanceToPoint(x, y, z = 0) {
	GetPlayerPos_(_x, _y, _z)

	if(z == 0)
		return sqrt((_x-x)**2+(_y-y)**2)
	else
		return sqrt((_x-x)**2+(_y-y)**2+(_z-z)**2)

	return 0
}

GetPlayerPos_(ByRef fX,ByRef fY,ByRef fZ) {
	if(!checkHandles())
		return 0

	fX := readFloat(hGTA, ADDR_POSITION_X)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	fY := readFloat(hGTA, ADDR_POSITION_Y)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}
	
	fZ := readFloat(hGTA, ADDR_POSITION_Z)
	if(ErrorLevel) {
		ErrorLevel := ERROR_READ_MEMORY
		return 0
	}

	ErrorLevel := ERROR_OK
}

getLabelText() {
	if(!checkHandles())
		return 0
	
	ADDR_3DText := readDWORD(hGTA, dwSAMP + SAMP_3DTEXT)
	TEXT_3DTEXT := readString(hGTA, ADDR_3DText, 512)
	return TEXT_3DTEXT
}

URLDownloadToVar_(url,ByRef variable=""){
	hObject:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	hObject.Open("GET",url)
	hObject.Send()
	return variable:=hObject.ResponseText
}

renderChat() {
	if (!checkHandles())
		return false

	Sleep, 40
	__WRITEMEM(hGTA, dwSAMP, [SAMP_CHAT_INFO_PTR, 0x63DA], 1, "UInt")
	return true
}

ARGB(a, r, g, b){
	return (a << 24) | (r << 16) | (g << 8) | b
}

getDistanceBetween(posX, posY, posZ, _posX, _posY, _posZ, _posRadius) {
	X := posX -_posX
	Y := posY -_posY
	Z := posZ -_posZ
	if (((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
		return true
	return false
}

isConnected() {
	coords := getCoordinates()
	if ((coords[1] == 384 && coords[2] == -1557 && coords[3] == 20) || (Round(coords[1]) == 1531 && Round(coords[2]) == -1734 && Round(coords[3]) == 13)) {
		return false
	}
	return true
}

getPeds() {
	if (!checkHandles()) {
		return false
	}
	if (!updateScoreboardDataEx()) {
		return false
	}
	dwAddress := readDWORD(hGTA, dwSAMP + 0x21A0F8)
	dwAddress := readDWORD(hGTA, dwAddress + 0x3CD)
	dwAddress := readDWORD(hGTA, dwAddress + 0x18)
	data := []
	wID := readMem(hGTA, dwAddress + 0x4, 2, "UShort")
	dwPed := readDWORD(hGTA, 0xB6F5F0)
	if (readDWORD(hGTA, dwAddress + 0x1A) <= 16) {
		sName := readString(hGTA, dwAddress + 0xA, 16)
	} else {
		sName := readString(hGTA, readDWORD(hGTA, dwAddress + 0xA), 20)
	}
	data.Push({LOCAL: true, ID: wID, PED: dwPed, ISNPC: false, NAME: sName})
	Loop % 1000
	{
		i := A_Index - 1
		dwRemotePlayer := readDWORD(hGTA, dwAddress + 0x2E + i*4)
		if (!dwRemotePlayer) {
			Continue
		}
		dwRemotePlayerData := readDWORD(hGTA, dwRemotePlayer)
		dwRemotePlayerData := readDWORD(hGTA, dwRemotePlayerData)
		dwPed := readDWORD(hGTA, dwRemotePlayerData + 0x2A4)
		if (!dwPed) {
			Continue
		}
		dwIsNPC := readDWORD(hGTA, dwRemotePlayer + 0x4)
		if (readMem(hGTA, dwRemotePlayer + 0x1C, 4, "Int") <= 16) {
			sName := readString(hGTA, dwRemotePlayer + 0xC, 16)
		} else {
			sName := readString(hGTA, readDWORD(hGTA, dwRemotePlayer + 0xC), 20)
		}
		data.Push({LOCAL: false, ID: i, PED: dwPed, ISNPC: dwIsNPC, NAME: sName})
	}
	return data
}

readChatLine(line, color = 0) {
	if (!checkHandles())
		return 0
	dwPTR := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
	chat := readString(hGTA, dwPTR + SAMP_CHAT_OFF + SIZE_SAMP_CHATMSG * (99 - line), SAMP_CHAT_SIZE)
	if (!color)
		chat := RegExReplace(chat, "\{[a-fA-F0-9]{6}\}")
	return chat
}

getGameText(type = 1, length = 12) {
	if (!checkHandles())
		return ""
	if (type == 1) {
		text := readString(hGTA, GAMETEXT_1, length)
	} else if (type == 2) {
		text := readString(hGTA, GAMETEXT_2, length)
	} else if (type == 3) {
		text := readString(hGTA, GAMETEXT_3, length)
	} else if (type == 4) {
		text := readString(hGTA, GAMETEXT_4, length)
	} else if (type == 5) {
		text := readString(hGTA, GAMETEXT_5, length)
	}
	return text
}

CheckStatus(){
	if(isChatOpen() || isInMenu() || isDialogOpen() || keybinds == 0)
		return true
	else
		return false
}

CheckValue(data){
	if(data == "")
		return true
	else
		return false
}

DisableClouds(){
	if(!checkHandles())
        return fals
		
	VarSetCapacity(buf, 4, 0)
	NumPut("100000", buf, 0, "Float")
	writeRaw(hGTA, ADDR_CLOUD_DENSITY, &buf, 4)
	writeRaw(hGTA, ADDR_CLOUD_DISABLE, &buf, 4)
	return
}

EnableClouds(value){
	if(!checkHandles())
        return false
		
	VarSetCapacity(buf, 4, 0)
	NumPut(value, buf, 0, "Float")
	writeRaw(hGTA, ADDR_CLOUD_DENSITY, &buf, 4)
	writeRaw(hGTA, ADDR_CLOUD_DISABLE, &buf, 4)
	return
}

GetSprintInfo(){
	if(!checkHandles())
        return -1
		
	sprintInfo := readFloat(hGTA, ADDR_SPRINT)
	if(ErrorLevel) {
        ErrorLevel := ERROR_READ_MEMORY
        return -1
    }
	
	ErrorLevel := ERROR_OK
	
	sprintData := Round((Round(sprintInfo) / 3147) * 100)
	
	if(sprintData < 0)
		sprintData := 0
	
    return sprintData
}

ChangeHudColor(selector, data){
	if(!checkHandles())
        return false
	
	switch selector
	{
		case "title":	selectedAddress := ADDR_HUD_TITLE
		case "wanted":	selectedAddress := ADDR_HUD_WANTED
		case "radio":	selectedAddress := ADDR_HUD_RADIO
		case "white":	selectedAddress := ADDR_HUD_WHITE
		case "green":	selectedAddress := ADDR_HUD_GREEN
		case "red": 	selectedAddress := ADDR_HUD_RED
		case "yellow":	selectedAddress := ADDR_HUD_YELLOW
	}
	
	writeMemory(hGTA, selectedAddress, data, 4)
	return
}

; =================================================================================================
; | Functions
; =================================================================================================
getRandomArrayValue(arr,arrayChanged:=0){
	static ind:=""
	if (arrayChanged || !ind){
		ind:=[]
		for k in arr
			ind.push(k)
	}
	Random,i,1,ind.length()
	return arr[ind[i]]
}

SetParam("process", "gta_sa.exe")
SetParam("use_window", "0")